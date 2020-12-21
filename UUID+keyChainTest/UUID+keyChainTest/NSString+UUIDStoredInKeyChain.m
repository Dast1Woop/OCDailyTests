//
//  NSString+UUIDStoredInKeyChain.m
//  UUID+keyChainTest
//
//  Created by LongMa on 2020/12/21.
//

#import "NSString+UUIDStoredInKeyChain.h"
#import <UIKit/UIKit.h>
@class KeyChainStore;

static NSString *  KEY_USERNAME_PASSWORD = @"com.huatu.chunYaMap";

@implementation NSString (UUIDStoredInKeyChain)

+(NSString *)getUUID
{
    NSString * strUUID = (NSString *)[KeyChainStore load:KEY_USERNAME_PASSWORD];
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //获取UUID
        strUUID = [UIDevice currentDevice].identifierForVendor.UUIDString;
        //将该uuid保存到keychain
        [KeyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
            
        //iPhone 8
        //11.2版本最初安装应用UUID FD6A5FE3-9EB4-422B-ADD3-17B313B9C8DE
        //11.2版本删除重装应用UUID FD6A5FE3-9EB4-422B-ADD3-17B313B9C8DE
        //升级系统11.2.5之后UUID  FD6A5FE3-9EB4-422B-ADD3-17B313B9C8DE
        
        //iPhone 6
        //10.3.3最初安装应用UUID   711CAC84-0540-4A44-80B4-26F87D2DD8B7
        //10.3.3删除重装应用UUID   711CAC84-0540-4A44-80B4-26F87D2DD8B7
        //升级11系统重装应用UUID    711CAC84-0540-4A44-80B4-26F87D2DD8B7
        //还原系统之后的应用UUID    1236FB53-CDCE-431E-999B-5C857C679B8A

    }
    return strUUID;
}

@end

#pragma mark -- KeyChainStore

@implementation KeyChainStore

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

// 将UUID保存到钥匙串
+ (void)save:(NSString *)service data:(id)data
{
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

// 读取保存到钥匙串的UUID
+ (id)load:(NSString *)service
{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr)
    {
        @try{
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

// 删除保存到钥匙串的UUID
+ (void)deleteKeyData:(NSString *)service
{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

@end


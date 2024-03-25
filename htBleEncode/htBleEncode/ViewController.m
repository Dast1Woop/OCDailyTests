//
//  ViewController.m
//  htBleEncode
//
//  Created by LongMa on 2023/10/19.
//

#import "ViewController.h"
#import "MYBeaconModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //4-1234567,加密后：17517,26860
    MYBeaconModel *beaconModel = [[MYBeaconModel alloc] init];
    beaconModel.major = 1;
    beaconModel.minor = 2;
    beaconModel.proximity = 0; // 设置适当的 proximity 值
    beaconModel.rssi = 0; // 设置适当的 rssi 值

    MYBeaconModel *encryptedBeacon = [self encryptBeaconWithModel:beaconModel];
    int initialMajor = encryptedBeacon.major;
    int initialMinor = encryptedBeacon.minor;

    NSLog(@"Initial Major: %d, Initial Minor: %d", initialMajor, initialMinor);

    MYBeaconModel *beaconModel2 = [[MYBeaconModel alloc] init];
    beaconModel2.major = initialMajor;
    beaconModel2.minor = initialMinor;
    beaconModel2.proximity = 0; // 设置适当的 proximity 值
    beaconModel2.rssi = 0; // 设置适当的 rssi 值

    MYBeaconModel *decryptedBeacon = [self getMajorlableWithBeacon:beaconModel2];
    int initialMajor2 = decryptedBeacon.major;
    int initialMinor2 = decryptedBeacon.minor;

    NSLog(@"Initial Major2: %d, Initial Minor2: %d", initialMajor2, initialMinor2);
}

-(NSDictionary *)encryptMajor:(int)major minor:(int)minor
{
Byte majorByte[2];
Byte minorByte[2];

majorByte[0] = (Byte) ((major >> 8) & 0xff);
majorByte[1] = (Byte) (major & 0xff);

minorByte[0] = (Byte) ((minor >> 8) & 0xff);
minorByte[1] = (Byte) (minor & 0xff);

Byte origMajor[2];
Byte origMinor[2];

Byte rngNum = (Byte) (arc4random_uniform(255) + 1);
Byte majorTemp[2];
Byte minorTemp[2];

majorTemp[0] = (Byte) (((majorByte[0] & 0x0f) + (rngNum & 0x0f)) & 0x0f);
majorTemp[1] = (Byte) (majorByte[1] ^ rngNum);

minorTemp[0] = (Byte) ((minorByte[0] ^ rngNum) + 0xA5);
minorTemp[1] = (Byte) ((minorByte[1] ^ rngNum) + 0x5A);

origMajor[0] = (Byte) ((majorTemp[0] & 0x0f) | (rngNum & 0xf0));
origMajor[1] = (Byte) (((majorTemp[1] >> 4) & 0x0f) | ((majorTemp[1] << 4) & 0xf0));

origMinor[0] = minorTemp[1];
origMinor[1] = minorTemp[0];

int resultMajor = (int) (((origMajor[0] >> 3) & 0x07) | ((origMajor[1] << 5) & 0xe0));
int resultMinor = (int) (((origMajor[1] & 0x1f) << 16) | ((origMinor[0] & 0xff) << 8) | (origMinor[1] & 0xff));

return @{@"major": @(resultMajor), @"minor": @(resultMinor)};
}

-(MYBeaconModel *)encryptBeaconWithModel:(MYBeaconModel *)beaconModel
{
    int major = beaconModel.major;
    int minor = beaconModel.minor;
    
    NSDictionary *dic = [self encryptMajor:major minor:minor];
    
    MYBeaconModel *encryptedBeacon = [[MYBeaconModel alloc] init];
    encryptedBeacon.major = [dic[@"major"] intValue];
    encryptedBeacon.minor = [dic[@"minor"] intValue];
    encryptedBeacon.proximity = beaconModel.proximity;
    encryptedBeacon.rssi = beaconModel.rssi;
    // 设置其他属性
    // encryptedBeacon.uuid = beaconModel.uuid;
    
    return encryptedBeacon;
}


-(MYBeaconModel *)getMajorlableWithBeacon:(MYBeaconModel *)beacon
{
    
    int major = beacon.major ;
    int minor = beacon.minor ;
    
    Byte majorByte[2];
    Byte minorByte[2];
    
    majorByte[1] = major;
    majorByte[0] = major >> 8;
    
    minorByte[1] = minor;
    minorByte[0] = minor >> 8;
    
    Byte origMajor[2];
    Byte origMinor[2];
    
    Byte rngNum;
    Byte majorTemp[2];
    Byte minorTemp[2];
    
    rngNum = (Byte)  (((majorByte[0] >> 4) & 0x0f) | (majorByte[0] & 0xf0));
    majorTemp[0] = (Byte) (((majorByte[0] & 0x0f) - (rngNum & 0x0f)) & 0x0f);
    majorTemp[1] = (Byte) (majorByte[1] ^ rngNum);
    
    minorTemp[0] = (Byte) ((minorByte[0] - 0xA5) ^ rngNum);
    minorTemp[1] = (Byte) ((minorByte[1] - 0x5A) ^ rngNum);
    
    origMajor[0] = (Byte) ((majorTemp[0] & 0x0f) | (rngNum & 0xf0));
    origMajor[1] = (Byte) (((majorTemp[1] << 4) & 0xf0 ) | ((majorTemp[1] >> 4) & 0x0f ));
    
    origMinor[0] = minorTemp[1];
    origMinor[1] = minorTemp[0];
    
    int origMajorInt = (int) ((((origMajor[0] & 0x07) << 3)) | ((origMajor[1] & 0xe0) >> 5));
    int origMinorInt = (int) (((origMajor[1] & 0x1f ) << 16) | ((origMinor[0] & 0xff) << 8) | (origMinor[1] & 0xff));
    
    
    MYBeaconModel *beaconModel = [[MYBeaconModel alloc] init];
    beaconModel.major = origMajorInt;
    beaconModel.minor = origMinorInt;
    beaconModel.proximity = beacon.proximity;
    beaconModel.rssi = beacon.rssi;
    return beaconModel;
}


@end

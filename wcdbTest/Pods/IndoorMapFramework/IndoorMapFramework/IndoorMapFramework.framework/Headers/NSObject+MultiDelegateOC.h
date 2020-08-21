

#import <Foundation/Foundation.h>
#import "HTMMultiDelegateOC.h"

/*
 Multi Delegate Extension
*/
@interface NSObject (MultiDelegateOC)

@property (readonly, nonatomic) HTMMultiDelegateOC *multiDelegate;


/**
 添加delegate代理对象到otherDelegate之前
 
 @param delegate 代理对象
 @param otherDelegate 其他代理对象
 */
- (void)addDelegate:(id)delegate beforeDelegate:(id)otherDelegate;

/**
 添加delegate代理对象到otherDelegate之后
 
 @param delegate 代理对象
 @param otherDelegate 其他代理对象
 */
- (void)addDelegate:(id)delegate afterDelegate:(id)otherDelegate;

/**
 移除所有代理对象
 */
- (void)removeAllDelegates;
    
/**
 底层：[self.multiDelegate addDelegate:delegate];

 @param delegate 代理对象
 */
- (void)addMultiDelegate:(id)delegate;

/**
 底层：[self.multiDelegate removeDelegate:self];

 @param delegate 代理对象
 */
- (void)removeMultiDelegate:(id)delegate;


@end

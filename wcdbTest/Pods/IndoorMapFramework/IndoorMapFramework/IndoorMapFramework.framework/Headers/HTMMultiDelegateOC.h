

#import <Foundation/Foundation.h>

@interface HTMMultiDelegateOC : NSObject

/**
 The array of registered delegates.实现一对多代理
 */
@property (readonly, nonatomic) NSPointerArray* delegates;

/**
 Set whether to throw unrecognized selector exceptions when calling delegate methods on an empty AIMultiDelegate.
 
 When `slientWhenEmpty` is NO, the default, if a delegate selector is called and there are no registered delegates an
 unregonized selector execption will be thrown. Which, unless you have a try/catch block, will crash the app. Setting
 `silentWhenEmpt` to YES will silence the execptions by ignoring selector invocations when there are no registered
 delegates.
 */
@property (nonatomic, assign) BOOL silentWhenEmpty;


/**
 添加代理对象到delegates数组中

 @param delegate 代理对象
 */
- (void)addDelegate:(id)delegate;
    
/**
 添加delegate代理对象，且放到otherDelegate之前

 @param delegate 代理对象
 @param otherDelegate 其他代理对象
 */
- (void)addDelegate:(id)delegate beforeDelegate:(id)otherDelegate;
    
/**
 添加delegate代理对象，且放到otherDelegate之后
 
 @param delegate 代理对象
 @param otherDelegate 其他代理对象
 */
- (void)addDelegate:(id)delegate afterDelegate:(id)otherDelegate;

    
/**
 从delegates数组中移除代理对象

 @param delegate 代理对象
 */
- (void)removeDelegate:(id)delegate;
    
/**
 移除delegates数组中所有代理对象
 */
- (void)removeAllDelegates;

@end

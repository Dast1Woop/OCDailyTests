//
//  HTBNByBusGuideModel.h

//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTBNByBusGuideModel : NSObject

@property (nonatomic,copy) NSString *gImgName;

@property (nonatomic,copy) NSString *gTitle;

@property (nonatomic,copy) NSString *gContent;

+ (instancetype)modelWithImgName:(NSString *)imgName
                           title:(NSString *)title
                         content:(NSString *)content;

@end

NS_ASSUME_NONNULL_END

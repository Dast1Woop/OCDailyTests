//
//  HTBNByBusGuideModel.m

//

#import "HTBNByBusGuideModel.h"

@implementation HTBNByBusGuideModel

+ (instancetype)modelWithImgName:(NSString *)imgName
                           title:(NSString *)title
                         content:(NSString *)content{
    HTBNByBusGuideModel *lM = [[HTBNByBusGuideModel alloc] init];
    lM.gImgName = imgName;
    lM.gTitle = title;
    lM.gContent = content;
    return lM;
}

@end

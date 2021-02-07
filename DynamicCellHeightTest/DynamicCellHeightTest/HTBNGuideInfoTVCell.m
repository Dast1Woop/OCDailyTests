//
//  HTBNGuideInfoTVCell.m
//  DynamicCellHeightTest
//
//  Created by LongMa on 2021/2/7.
//

#import "HTBNGuideInfoTVCell.h"
#import "HTBNByBusGuideModel.h"

@interface HTBNGuideInfoTVCell ()
@property (weak, nonatomic) IBOutlet UILabel *gLblTitle;
@property (weak, nonatomic) IBOutlet UILabel *gLblContent;
@property (weak, nonatomic) IBOutlet UIImageView *gImgV;

@end

@implementation HTBNGuideInfoTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setGModel:(HTBNByBusGuideModel *)gModel{
    _gModel = gModel;
    
    self.gLblTitle.text = gModel.gTitle;
    self.gLblContent.text = gModel.gContent;
    self.gImgV.image = [UIImage imageNamed:gModel.gImgName];
}

- (void)setFrame:(CGRect)frame{
    frame.size.height -= 8;
    [super setFrame:frame];
}

@end

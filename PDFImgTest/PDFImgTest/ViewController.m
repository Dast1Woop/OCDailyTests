//
//  ViewController.m
//  PDFImgTest
//
//  Created by LongMa on 2022/3/1.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *img1 = [UIImage imageNamed:@"cart_menu_icon"];
    [self.btn setImage:img1 forState:(UIControlStateNormal)];
    
    self.imgV.image = img1;
}


@end

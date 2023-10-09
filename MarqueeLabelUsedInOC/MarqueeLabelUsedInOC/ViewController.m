//
//  ViewController.m
//  MarqueeLabelUsedInOC
//
//  Created by LongMa on 2023/10/8.
//

#import "ViewController.h"
@import MarqueeLabel;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MarqueeLabel *marqueeLbl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.marqueeLbl.trailingBuffer = 20;
    self.marqueeLbl.animationDelay = 0;
    
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapG:)];
    tapG.numberOfTapsRequired = 1;
    [self.marqueeLbl addGestureRecognizer:tapG];
    self.marqueeLbl.userInteractionEnabled = true;
}

- (void)tapG:(UITapGestureRecognizer *)tap {
    NSLog(@"%s", __func__);
}


@end

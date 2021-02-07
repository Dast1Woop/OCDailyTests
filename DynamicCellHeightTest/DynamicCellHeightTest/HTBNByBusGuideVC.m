//
//  HTBNGuideVC.m

//

#import "HTBNByBusGuideVC.h"
#import "HTBNGuideInfoTVCell.h"
#import "HTBNByBusGuideModel.h"


@interface HTBNByBusGuideVC ()<UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *gTV;

@property (weak, nonatomic) IBOutlet UIButton *gBtnAtBottom;

@property (nonatomic,copy) NSArray *gArrData;
@end

@implementation HTBNByBusGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    
    [self.gTV reloadData];
}

- (void)setUpUI{
    self.title = NSLocalizedString(@"乘车指引", nil);
    [self setUpTV];
}

- (void)setUpTV{
    self.gTV.delegate = self;
    self.gTV.dataSource = self;
    [self.gTV registerNib:[UINib nibWithNibName:@"HTBNGuideInfoTVCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([HTBNGuideInfoTVCell class])];
    
//    self.gTV.rowHeight = 85 + 8;
    self.gTV.estimatedRowHeight = 90;
    self.gTV.rowHeight = UITableViewAutomaticDimension;
    
    self.gTV.tableFooterView = [[UIView alloc] init];
    self.gTV.allowsSelection = NO;
    self.gTV.separatorStyle = UITableViewCellSeparatorStyleNone;
}

//MARK:delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.gArrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HTBNGuideInfoTVCell *lCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HTBNGuideInfoTVCell class]) forIndexPath:indexPath];
    lCell.gModel = self.gArrData[indexPath.row];
    
    return lCell;
}

#pragma mark -  action
- (IBAction)gBtnAtBottomDC:(id)sender {

}

//MARK:getter
- (NSArray *)gArrData{
    if (nil == _gArrData) {
        _gArrData = @[
            [HTBNByBusGuideModel modelWithImgName:NSLocalizedString(@"zhiyin_1", nil) title:NSLocalizedString(@"1、", nil) content:
             NSLocalizedString(@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", nil)],
            [HTBNByBusGuideModel modelWithImgName:NSLocalizedString(@"zhiyin_2", nil) title:NSLocalizedString(@"2、", nil) content:NSLocalizedString(@"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", nil)],
            [HTBNByBusGuideModel modelWithImgName:NSLocalizedString(@"zhiyin_3", nil) title:NSLocalizedString(@"3", nil) content:NSLocalizedString(@"ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc", nil)],
            [HTBNByBusGuideModel modelWithImgName:NSLocalizedString(@"zhiyin_4", nil) title:NSLocalizedString(@"4、", nil) content:NSLocalizedString(@"dd", nil)],
            [HTBNByBusGuideModel modelWithImgName:NSLocalizedString(@"zhiyin_5", nil) title:NSLocalizedString(@"5、", nil) content:NSLocalizedString(@"ee", nil)],
            [HTBNByBusGuideModel modelWithImgName:NSLocalizedString(@"zhiyin_6", nil) title:NSLocalizedString(@"6、", nil) content:NSLocalizedString(@"fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff", nil)],
        ];
    }
    return _gArrData;
}

@end

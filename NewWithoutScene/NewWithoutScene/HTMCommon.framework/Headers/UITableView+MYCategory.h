//
//  UITableView+MYCategory.h
//  HTMCommon
//
//  Created by LongMa on 2022/6/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (MYCategory)

/**
  适配 tableview 使用 autolayout 布局时，tableHeaderView 视图布局不正常问题，使用示例：
 ```
 - (void)viewDidLayoutSubviews{
 [super viewDidLayoutSubviews];
 [self.tableview  ca_headerSizeToFit4Autolayout];
 }
 ```
 */
- (void)ca_headerSizeToFit4Autolayout;

@end

NS_ASSUME_NONNULL_END

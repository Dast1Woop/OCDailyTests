//
//  ViewController.m
//  BackgroundShakeTest
//
//  Created by LongMa on 2020/9/8.
//  Copyright © 2020 my. All rights reserved.
//

#import "ViewController.h"
#import "MYAccelerometerTool.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<MYAccelerometerToolDelegate
,CLLocationManagerDelegate>
@property(nonatomic, strong) CLLocationManager *gMnger;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[MYAccelerometerTool sharedMYAccelerometerTool] startMonitorShake];
    [MYAccelerometerTool sharedMYAccelerometerTool].delegateCustom = self;
    
    
    //加速计实现后台摇一摇时，必须以 app拥有后台相关功能为前提。否则app退到后台后被挂起，会导致加速计信息获取失败。再次进入时，会发现瞬间log了很多次，说明app处于后台时，相关log指令很可能被系统缓存起来了。
    self.gMnger = [[CLLocationManager alloc] init];
    self.gMnger.delegate = self;
    self.gMnger.allowsBackgroundLocationUpdates = YES;
    [self.gMnger requestWhenInUseAuthorization];
    [self.gMnger startUpdatingLocation];
}


#pragma mark -  delegate & datasource
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
//    NSLog(@"%s", __FUNCTION__);
}


#pragma mark -  delegate
- (void)dmMYAccelerometerTool:(MYAccelerometerTool *)tool didDetectShakeGesture:(double)accelerationCaled{
    NSLog(@"%s,currentThread:%@", __FUNCTION__, [NSThread currentThread]);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"main log");
    });
}

@end

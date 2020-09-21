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

@interface ViewController ()<CLLocationManagerDelegate>
@property(nonatomic, strong) CLLocationManager *gMnger;
@end

@implementation ViewController

//
- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL lRes = [[MYAccelerometerTool sharedMYAccelerometerTool] startMonitorShake];
    NSLog(@"lRes:%d", lRes);
    NSAssert(lRes, @"开始监听摇一摇失败");
    
    //加速计实现后台摇一摇时，必须以 app拥有后台相关功能为前提。否则app退到后台后被挂起，会导致加速计信息获取失败。再次进入时，会发现瞬间log了很多次，说明app处于后台时，相关log指令很可能被系统缓存起来了。
    if (kCLAuthorizationStatusAuthorizedAlways ==  [CLLocationManager authorizationStatus]
        || kCLAuthorizationStatusAuthorizedWhenInUse == [CLLocationManager authorizationStatus]) {
        [self.gMnger startUpdatingLocation];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nmShakeSuccess:) name:KNTFY_SHAKE_SUCCESS object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark -  action
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"%s", __FUNCTION__);
}

//在摇一摇的同时，通过观察此方法是否有log，可以判断是否有监听到。
- (void)nmShakeSuccess:(NSNotification *)ntfy{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark -  delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    NSLog(@"%s", __FUNCTION__);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark -  getter
- (CLLocationManager *)gMnger{
    if (nil == _gMnger) {
        _gMnger = [[CLLocationManager alloc] init];
        _gMnger.delegate = self;
        _gMnger.allowsBackgroundLocationUpdates = YES;
        [_gMnger requestWhenInUseAuthorization];
    }
    return _gMnger;
}

@end

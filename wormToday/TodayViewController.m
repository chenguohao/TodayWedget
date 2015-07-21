//
//  TodayViewController.m
//  wormToday
//
//  Created by guohao on 21/7/15.
//  Copyright (c) 2015 guohao. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property (nonatomic,strong)  UILabel* label;
@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(100, 100); // x -> N/A
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton* bt_camera = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 80, 40)];
    [bt_camera setTitle:@"Open" forState:UIControlStateNormal];
    [bt_camera setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    bt_camera.backgroundColor = [UIColor whiteColor];
    [bt_camera addTarget:self action:@selector(onOpen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt_camera];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 80, 40)];
    [self.view addSubview:self.label];
    self.label.text = [self readDataFromNSUserDefaults];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor purpleColor];
}


- (NSString *)readDataFromNSUserDefaults
{
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.leomaster.demo.wormhole"];
    NSString *value = [shared valueForKey:@"Key"];
    
    return value;
}


- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsZero;
}

- (void)onOpen{
    [self.extensionContext openURL:[NSURL URLWithString:@"wormhole://open"] completionHandler:nil];
}



@end

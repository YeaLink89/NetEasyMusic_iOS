//
//  DiscoverViewController.m
//  NetEasyMusic_iOS
//
//  Created by chenhao on 16/9/17.
//  Copyright © 2016年 com.chh. All rights reserved.
//

#import "DiscoverViewController.h"
#import "HYPageView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface DiscoverViewController ()


@property (nonatomic , strong) NSArray *titleArray;

@end

@implementation DiscoverViewController


#define kSegMentControlHeight (36)
#define kIS_IOS7                (kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_6_1)

#define kIOS7DIS(X) ([[NSNumber numberWithBool:kIS_IOS7] intValue] * X)

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *defaultTitles = @[@"个性推荐",@"歌单", @"主播电台", @"排行榜"];
    HYPageView *pageView = [[HYPageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withTitles:defaultTitles withViewControllers:@[@"RemdViewController",@"PlaylistViewController", @"RadioStationViewController", @"ToplistViewController"] withParameters:nil];
    pageView.isTranslucent = NO;
    pageView.selectedColor = [UIColor redColor];
    pageView.unselectedColor = [UIColor blackColor];
    [self.view addSubview:pageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

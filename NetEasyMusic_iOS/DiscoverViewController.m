//
//  DiscoverViewController.m
//  NetEasyMusic_iOS
//
//  Created by chenhao on 16/9/17.
//  Copyright © 2016年 com.chh. All rights reserved.
//

#import "DiscoverViewController.h"
#import "iCarousel.h"
#import "XTSegmentControl.h"

@interface DiscoverViewController () <iCarouselDataSource,iCarouselDelegate>

@property (nonatomic , strong) iCarousel *carousel;

@property (nonatomic , strong) XTSegmentControl *segmentControl;

@property (nonatomic , strong) NSArray *titleArray;
@end

@implementation DiscoverViewController


#define kSegMentControlHeight (36)
#define kIS_IOS7                (kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_6_1)

#define kIOS7DIS(X) ([[NSNumber numberWithBool:kIS_IOS7] intValue] * X)

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *defaultTitles = @[@"个性推荐",@"歌单", @"主播电台", @"排行榜"];
    _titleArray = defaultTitles;
    
    float listOrigionY = kIOS7DIS(64) + kSegMentControlHeight;
    float listViewHeight = CGRectGetHeight(self.view.bounds) - 44 - kIOS7DIS(20) - kSegMentControlHeight;
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, listOrigionY, 320, listViewHeight)];
    _carousel.backgroundColor = [UIColor whiteColor];
    _carousel.dataSource = self;
    _carousel.delegate = self;
    _carousel.decelerationRate = 0.7;
    _carousel.type = iCarouselTypeLinear;
    _carousel.pagingEnabled = YES;
    _carousel.edgeRecognition = YES;
    _carousel.bounceDistance = 0.4;
    [self.view addSubview:_carousel];
    
    __weak typeof(_carousel) weakCarousel = _carousel;
    
    _segmentControl = [[XTSegmentControl alloc] initWithFrame:CGRectMake(20, kIOS7DIS(64), 260, 36) Items:_titleArray selectedBlock:^(NSInteger index) {
        
        [weakCarousel scrollToItemAtIndex:index animated:NO];
    }];
    
    [self.view addSubview:_segmentControl];
    
//    
//    XTCornerButton *cornerButton = [XTCornerButton buttonWithType:UIButtonTypeCustom];
//    cornerButton.frame = CGRectMake(CGRectGetMaxX(_segmentControl.frame) + 1, CGRectGetMinY(_segmentControl.frame), CGRectGetWidth(self.view.bounds) - CGRectGetMaxX(_segmentControl.frame), CGRectGetHeight(_segmentControl.frame));
//    [cornerButton addTarget:self action:@selector(showCategories:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:cornerButton];
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



- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return _titleArray.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{

    return nil;
}

- (void)carouselDidScroll:(iCarousel *)carousel
{
    if (_segmentControl) {
        
        float offset = carousel.scrollOffset;
        
        if (offset > 0) {
            
            [_segmentControl moveIndexWithProgress:offset];
        }
    }
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    if (_segmentControl) {
        
        [_segmentControl endMoveIndex:carousel.currentItemIndex];
    }
}


@end

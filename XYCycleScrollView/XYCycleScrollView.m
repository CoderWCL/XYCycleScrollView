//
//  XYCycleScrollView.m
//  XYSDCycleScrollViewDemo
//
//  Created by 吕万昌 on 2018/8/31.
//  Copyright © 2018年 lvwanchang. All rights reserved.
//

#import "XYCycleScrollView.h"

#import "SDCycleScrollView.h"

@interface XYCycleScrollView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation XYCycleScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self addSubview:self.cycleScrollView];
}

#pragma mark - 懒加载

- (SDCycleScrollView *)cycleScrollView {
    if (!_cycleScrollView) {
   
        // 网络加载 --- 创建带标题的图片轮播器
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) delegate:self placeholderImage:[UIImage imageNamed:@"h7"]];
        //cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
        
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        
        _cycleScrollView = cycleScrollView;
    }
    return _cycleScrollView;
}

#pragma mark - setter
- (void)setImageURLStringsGroup:(NSArray *)imageURLStringsGroup {
    _imageURLStringsGroup = imageURLStringsGroup;
    self.cycleScrollView.imageURLStringsGroup = imageURLStringsGroup;
}

- (void)setLocalizationImageNamesGroup:(NSArray *)localizationImageNamesGroup {
    
    _localizationImageNamesGroup = localizationImageNamesGroup;
    self.cycleScrollView.localizationImageNamesGroup = localizationImageNamesGroup;
}

- (void)setBannerImageViewContentMode:(UIViewContentMode)bannerImageViewContentMode {
    _bannerImageViewContentMode = bannerImageViewContentMode;
    self.cycleScrollView.bannerImageViewContentMode = bannerImageViewContentMode;
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
    if (self.clickImageBlock) {
        self.clickImageBlock((int)index);
    }
}

@end

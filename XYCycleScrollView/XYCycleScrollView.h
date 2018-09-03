//
//  XYCycleScrollView.h
//  XYSDCycleScrollViewDemo
//
//  Created by 吕万昌 on 2018/8/31.
//  Copyright © 2018年 lvwanchang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYCycleScrollView : UIView

@property (nonatomic, copy) void(^clickImageBlock)(int index);

/** 网络图片 url string 数组 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;
/** 本地图片数组 */
@property (nonatomic, strong) NSArray *localizationImageNamesGroup;
/** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;

@end

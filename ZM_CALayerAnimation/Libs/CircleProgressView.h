//
//  CircleProgressView.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIView
@property (assign,nonatomic) CGFloat lineWidth; // 线条宽度
@property (nonatomic, copy) NSString *lineCap;  // 边缘线的类型
@property (nonatomic) CGFloat strokeStart;      // 弧线开始的角度值
@property (nonatomic) CGFloat strokeEnd;        // 弧线结束的角度值
@property (nonatomic) BOOL isAnimation;         // 是否动画 播放进度
@end

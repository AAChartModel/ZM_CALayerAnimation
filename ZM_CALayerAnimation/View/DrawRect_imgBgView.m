//
//  DrawRect_imgBgView.m
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "DrawRect_imgBgView.h"

@implementation DrawRect_imgBgView

- (void)drawRect:(CGRect)rect {

    CGContextRef context= UIGraphicsGetCurrentContext();
    /*图片*/
    CGFloat ww=130, hh=100;
//    UIImage *img1 = [UIImage imageNamed:@"m0.jpg"];
    UIImage *img1 = [UIImage imageNamed:@"scene1_1.png"];

    CGContextDrawTiledImage(context, CGRectMake(200, 100, ww, hh), img1.CGImage);//平铺图
    CGContextDrawImage(context, CGRectMake(170, 0, ww, hh), img1.CGImage);//使用这个使图片上下颠倒了

    
}

@end

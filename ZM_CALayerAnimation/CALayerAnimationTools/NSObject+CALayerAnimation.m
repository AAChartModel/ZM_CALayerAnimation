//
//  NSObject+CALayerAnimation.m
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/12.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSObject+CALayerAnimation.h"

@implementation NSObject (CALayerAnimation)


// 设置 CALayer
- (void)setLayer:(CALayer *)layer
           frame:(CGRect)frame
         bgColor:(UIColor *)bgColor
           image:(UIImage *)image {
    
    CGImageRef img = image.CGImage;
    layer.contents = (__bridge id)img;
    layer.frame           = frame;
    layer.backgroundColor = bgColor.CGColor;
    layer.contentsScale   = image.scale;
    layer.contentsScale   = [UIScreen mainScreen].scale;
}


// 设置 CAShapeLayer
- (void)setCAShapeLayer:(CAShapeLayer *)layer path:(UIBezierPath *)path
            strokeColor:(UIColor *)strokeColor
              fillColor:(UIColor *)fillColor
              lineWidth:(CGFloat)CGFloat {
    layer.path        = path.CGPath;
    layer.strokeColor = strokeColor.CGColor;
    layer.fillColor   = fillColor.CGColor;
    layer.lineWidth   = 5;
}

// 设置 CAKeyframeAnimation
- (void)setCAKeyframeAnimation:(CAKeyframeAnimation *)animation values:(NSArray *)values
                  functionName:(NSString *)functionName fillMode:(NSString *)fillMode
                      duration:(CFTimeInterval)duration
                   repeatCount:(float)repeatCount
           removedOnCompletion:(BOOL)removedOnCompletion {
    
    animation.values            = values;
    animation.timingFunction    = [CAMediaTimingFunction functionWithName:functionName];
    animation.fillMode          = fillMode;
    animation.duration          = duration ;
    animation.repeatCount       = repeatCount;
    animation.removedOnCompletion = removedOnCompletion;
}



@end

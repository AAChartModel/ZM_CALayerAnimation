//
//  NSObject+CALayerAnimation.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/12.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (CALayerAnimation)

// 设置 CALayer
- (void)setLayer:(CALayer *)layer
           frame:(CGRect)frame
         bgColor:(UIColor *)bgColor
           image:(UIImage *)image;


// 设置 CAShapeLayer
- (void)setCAShapeLayer:(CAShapeLayer *)layer path:(UIBezierPath *)path
            strokeColor:(UIColor *)strokeColor
              fillColor:(UIColor *)fillColor
              lineWidth:(CGFloat)CGFloat;

// 设置 CAKeyframeAnimation
- (void)setCAKeyframeAnimation:(CAKeyframeAnimation *)animation values:(NSArray *)values
                  functionName:(NSString *)functionName fillMode:(NSString *)fillMode
                      duration:(CFTimeInterval)duration
                   repeatCount:(float)repeatCount
           removedOnCompletion:(BOOL)removedOnCompletion;




@end

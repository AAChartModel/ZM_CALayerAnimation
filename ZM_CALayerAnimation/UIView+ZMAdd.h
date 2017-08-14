//
//  UIView+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZMAdd)
{

}

#pragma mark 导航视图 动画
- (void)pushViewController:(UIViewController *)nav;

#pragma mark 普通动画
- (void)flipView:(UIView *)myView
            Rect:(CGRect)myRect
         forView:(UIView *)view
    timeInterval:(NSTimeInterval)durationTime;



// 动画 (模仿系统方法)
- (void)animationDuration:(NSTimeInterval)duration animation:(void (^)(void) )animationBlock;

// 翻页动画
- (void)animationDuration:(NSTimeInterval)duration
               transition:(UIViewAnimationTransition)transition
                    curve:(UIViewAnimationCurve)curve
                animation:(void (^)(void) )animationBlock;



-(void)cornerRadius:(CGFloat)cornerRadius
        borderWidth:(CGFloat)borderWidth
        borderColor:(UIColor *)borderColor;

@end

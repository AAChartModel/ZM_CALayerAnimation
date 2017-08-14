//
//  UIView+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UIView+ZMAdd.h"

@implementation UIView (ZMAdd)

- (void)Use_test {
    
    
//    UIView *view1;
//    [self flipView:view1 Rect:CGRectMake(0, 0, SSWIDTH, SSHEIGHT) forView:self timeInterval:0.1];

    
//UIImageView
}

-(void)cornerRadius:(CGFloat)cornerRadius
        borderWidth:(CGFloat)borderWidth
        borderColor:(UIColor *)borderColor
{
    self.layer.cornerRadius= cornerRadius;
    self.layer.masksToBounds= YES;
    self.layer.borderWidth= borderWidth;
    self.layer.borderColor= borderColor.CGColor;
}






#pragma mark 导航视图 动画
- (void)pushViewController:(UIViewController *)nav
{
    UIWindow *window=[[[UIApplication sharedApplication] delegate] window];
    window.rootViewController= nav;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
    nav.modalTransitionStyle = UIModalTransitionStyleCoverVertical;    //从底部滑入
    //nav.modalPresentationStyle =  UIModalPresentationFullScreen;
    [UIView commitAnimations];
}


#pragma mark 普通动画
- (void)flipView:(UIView *)myView
           Rect:(CGRect)myRect
        forView:(UIView *)view
   timeInterval:(NSTimeInterval)durationTime
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:durationTime];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:view cache:YES];
    myView.frame = myRect;
    [UIView commitAnimations];
    
}



// 动画 (模仿系统方法)
- (void)animationDuration:(NSTimeInterval)duration animation:(void (^)(void) )animationBlock {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self cache:YES];

    animationBlock();
    
    [UIView commitAnimations];
}

// 翻页动画
- (void)animationDuration:(NSTimeInterval)duration transition:(UIViewAnimationTransition)transition curve:(UIViewAnimationCurve)curve animation:(void (^)(void) )animationBlock  {

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:transition forView:window cache:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    animationBlock();
    
    [UIView commitAnimations];
}

// 系统方法
- (void)aaa {
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // 内容
    [UIView commitAnimations];
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
    }];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    // 起始时间和持续时间值在0.0和1.0之间指定时间和持续时间相对于整体的关键帧动画
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.0f initialSpringVelocity:0.0f options:0 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}

/**
 *
 1.常规动画属性设置（可以同时选择多个进行设置）
 
	UIViewAnimationOptionLayoutSubviews：动画过程中保证子视图跟随运动。
	UIViewAnimationOptionAllowUserInteraction：动画过程中允许用户交互。
	UIViewAnimationOptionBeginFromCurrentState：所有视图从当前状态开始运行。
 
	UIViewAnimationOptionRepeat：重复运行动画。
	UIViewAnimationOptionAutoreverse ：动画运行到结束点后仍然以动画方式回到初始点。
	UIViewAnimationOptionOverrideInheritedDuration：忽略嵌套动画时间设置。
	UIViewAnimationOptionOverrideInheritedCurve：忽略嵌套动画速度设置。
	UIViewAnimationOptionAllowAnimatedContent：动画过程中重绘视图（注意仅仅适用于转场动画）。
 
	UIViewAnimationOptionShowHideTransitionViews：视图切换时直接隐藏旧视图、显示新视图，而不是将旧视图从父视图移除（仅仅适用于转场动画）
	UIViewAnimationOptionOverrideInheritedOptions ：不继承父动画设置或动画类型。
 
 2.动画速度控制（可从其中选择一个设置）
 
	UIViewAnimationOptionCurveEaseInOut：动画先缓慢，然后逐渐加速。
	UIViewAnimationOptionCurveEaseIn ：动画逐渐变慢。
	UIViewAnimationOptionCurveEaseOut：动画逐渐加速。
	UIViewAnimationOptionCurveLinear ：动画匀速执行，默认值。
 
 3.转场类型（仅适用于转场动画设置，可以从中选择一个进行设置，基本动画、关键帧动画不需要设置）
 
	UIViewAnimationOptionTransitionNone：没有转场动画效果。
	UIViewAnimationOptionTransitionFlipFromLeft ：从左侧翻转效果。
	UIViewAnimationOptionTransitionFlipFromRight：从右侧翻转效果。
	UIViewAnimationOptionTransitionCurlUp：			向后翻页的动画过渡效果。
	UIViewAnimationOptionTransitionCurlDown ：		向前翻页的动画过渡效果。
 
	UIViewAnimationOptionTransitionCrossDissolve：旧视图溶解消失显示下一个新视图的效果。
	UIViewAnimationOptionTransitionFlipFromTop ：  从上方翻转效果。
	UIViewAnimationOptionTransitionFlipFromBottom：从底部翻转效果。
 */


@end

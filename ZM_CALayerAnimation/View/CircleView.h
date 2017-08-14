//
//  CircleView.h
//  GraphicsAnimation
//
//  Created by ZM on 2017/3/12.
//  Copyright © 2017年 TD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
{
    
}
@property (nonatomic ,strong) UIBezierPath* bezierPath;
@property (nonatomic, strong) UIColor *fillColor;   //内部颜色
@property (nonatomic, strong) UIColor *strokeColor; //边线颜色
@property (nonatomic) CGFloat lineWidth;            //边宽
@property (nonatomic) CGPoint circleCenterPoint;    //圆心
@property (nonatomic) CGFloat radius;               //半径

@property (nonatomic, strong) UILabel *textLab; //


// iOS CAShapeLayer & UIBezierPath画线、画图
// http://www.cnblogs.com/jaesun/p/iOS-CAShapeLayerUIBezierPath-hua-xian.html


@end

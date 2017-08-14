//
//  UIBezierPath_AAView.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath_AAView : UIView
{
    
}
@property (nonatomic ,strong) UIBezierPath* bezierPath;
@property (nonatomic, strong) UIColor *fillColor;   //内部颜色 innerColor
@property (nonatomic, strong) UIColor *strokeColor; //边线颜色 borderColor
@property (nonatomic) CGFloat lineWidth;            //边宽
@property (nonatomic) CGPoint circleCenterPoint;    //圆心
@property (nonatomic) CGFloat radius;               //半径

@property (nonatomic, strong) UILabel *textLab; //
@property (nonatomic,strong) CAShapeLayer *mylayer;
@property (nonatomic,assign) CGFloat strokeStart;
@property (nonatomic,assign) CGFloat strokeEnd;

@end


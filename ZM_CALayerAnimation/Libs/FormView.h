//
//  FormView.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormView : UIView
//边界path，水波的容器
@property (nonatomic, strong) UIBezierPath *borderPath;
//容器填充色
@property (nonatomic, strong) UIColor *border_fillColor;
//容器描边色
@property (nonatomic, strong) UIColor *border_strokeColor;

//对于不规则图形，进度变化相对于自身的frame
@property (nonatomic) CGRect changeFrame;

@end

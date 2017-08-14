//
//  UIBezierPath_RectView.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/11.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath_RectView : UIView
{
    
}
@property (nonatomic ,strong) UIBezierPath* bezierPath;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic) CGFloat lineWidth;
@end

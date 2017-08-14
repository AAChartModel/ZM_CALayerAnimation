//
//  UIBezierPath_RectView.m
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/11.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "UIBezierPath_RectView.h"
#import "BaseHeader.h"

@interface UIBezierPath_RectView()
{
    
}
@property (nonatomic) CGFloat myWidth;
@property (nonatomic) CGFloat myHeight;
@end



@implementation UIBezierPath_RectView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        _myWidth = self.frame.size.width;
        _myHeight = self.frame.size.height;
        // NSLog(@"_myWidth= %f",_myWidth);
        // NSLog(@"_myHeight= %f \n ",_myHeight);
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 画不规则矩形
    [self drawRectangle];
    
}
// 画不规则矩形
- (void)drawRectangle
{
    // 顺时针划线：左上角 -->右上角 -->右下角 -->左下角
    // 一阶多边形（closePath 闭合）
    _bezierPath = [UIBezierPath bezierPath];
    [_bezierPath moveToPoint: CGPointMake(0, 0)];                      //起点  （左上角）
    [_bezierPath addLineToPoint: CGPointMake(_myWidth, 0)];            //第2个点（右上角）
    [_bezierPath addLineToPoint: CGPointMake(_myWidth, _myHeight/2-50)]; //第3个点（右下角）
    [_bezierPath addLineToPoint: CGPointMake(0, _myHeight/2)];           //第4个点（左下角）
    [_bezierPath closePath];
    //设置填充色
    [_fillColor setFill];
    [_bezierPath fill];
    //设置表面色
    [_strokeColor setStroke];
    [_bezierPath setLineWidth:_lineWidth];
    [_bezierPath stroke];
    
}



@end

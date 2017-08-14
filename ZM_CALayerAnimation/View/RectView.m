//
//  RectView.m
//  GraphicsAnimation
//
//  Created by ZM on 2017/3/10.
//  Copyright © 2017年 TD. All rights reserved.
//

#import "RectView.h"

@interface RectView()
{
    
}
@property (nonatomic) CGFloat myWidth;
@property (nonatomic) CGFloat myHeight;
@end


@implementation RectView


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
//    _bezierPath = [UIBezierPath bezierPath];
//    [_bezierPath moveToPoint: CGPointMake(10, 20)]; //起点
//    [_bezierPath addLineToPoint: CGPointMake(self.frame.size.width-20, 20)]; //第2个点
//    [_bezierPath addLineToPoint: CGPointMake(self.frame.size.width-20, 200)];//第3个点
//    [_bezierPath addLineToPoint: CGPointMake(30, 300)];//第4个点
//    [_bezierPath closePath];
//    //设置填充色
//    [_fillColor setFill];
//    [_bezierPath fill];
//    //设置边色
//    [_strokeColor setStroke];
//    [_bezierPath setLineWidth:_lineWidth];
//    [_bezierPath stroke];
    
    _bezierPath = [UIBezierPath bezierPath];
    [_bezierPath moveToPoint: CGPointMake(0, 0)];                      //起点
    [_bezierPath addLineToPoint: CGPointMake(_myWidth, 0)];            //第2个点
    [_bezierPath addLineToPoint: CGPointMake(_myWidth, _myHeight-50)]; //第3个点
    [_bezierPath addLineToPoint: CGPointMake(0, _myHeight)];           //第4个点
    [_bezierPath closePath];
    //设置填充色
    [_fillColor setFill];
    [_bezierPath fill];
    //设置表面色
    [_strokeColor setStroke];
    _bezierPath.lineWidth = _lineWidth;
    [_bezierPath stroke];


}

@end

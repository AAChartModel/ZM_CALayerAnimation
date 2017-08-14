//
//  CircleView.m
//  GraphicsAnimation
//
//  Created by ZM on 2017/3/12.
//  Copyright © 2017年 TD. All rights reserved.
//

#import "CircleView.h"

@interface CircleView()
{
    CGFloat _textLabHeight;
}
@end;

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        
        _textLabHeight = 30;

        self.radius = 2;
        self.lineWidth = 6 ;
        self.circleCenterPoint = CGPointMake(_lineWidth , _textLabHeight/2);
        self.strokeColor = [UIColor lightGrayColor];
        self.fillColor = [UIColor blueColor];
        
        [self addSubview: self.textLab];

    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 画圆
    [self drawCircle];
    
    [self drawLine];
}

- (void)drawCircle
{
    // 添加圆到path  //radius= R：半径   M_PI= 180度

    _bezierPath = [UIBezierPath bezierPath];
    [_bezierPath addArcWithCenter:_circleCenterPoint
                           radius:_radius
                       startAngle:0.0
                         endAngle:M_PI*2
                        clockwise:YES];
    //设置颜色
    [_strokeColor setStroke];
    [_fillColor setFill];
    // 描边和填充
    [_bezierPath setLineWidth:_lineWidth];
    [_bezierPath stroke];
    [_bezierPath fill];
}

// 线的路径
- (void)drawLine {

    CGFloat centerX = _circleCenterPoint.x+ _lineWidth- _radius;
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    // 起点
    [linePath moveToPoint:CGPointMake(centerX, _circleCenterPoint.y)];
    // 第二个点
    [linePath addLineToPoint:CGPointMake(centerX+ 20, _circleCenterPoint.y)];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 1;
    lineLayer.strokeColor = _strokeColor.CGColor;
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = nil; // 默认为blackColor
    [self.layer addSublayer:lineLayer];
}

// 标题
- (UILabel *)textLab {
    if (_textLab==nil) {
        
        CGFloat centerX = _circleCenterPoint.x+ _lineWidth- _radius+ 20;
        CGFloat ww = 100;
        _textLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ww, _textLabHeight)];
        _textLab.center  =CGPointMake(centerX+ ww/2, _circleCenterPoint.y);
        _textLab.font = [UIFont systemFontOfSize:14];
        _textLab.textColor = [UIColor darkTextColor];
        _textLab.textAlignment = NSTextAlignmentCenter;
        _textLab.backgroundColor = self.strokeColor;
        
        _textLab.layer.cornerRadius = _textLabHeight/2;
        _textLab.clipsToBounds = YES;
    }
    return _textLab;
}

@end

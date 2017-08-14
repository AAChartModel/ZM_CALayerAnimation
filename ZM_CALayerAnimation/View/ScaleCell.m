//
//  ScaleCell.m
//  ZM_ScaleZoomImageView
//
//  Created by ZM on 2017/4/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ScaleCell.h"
#import "UIView+ZMFrame.h"
#import "BaseHeader.h"

@interface ScaleCell()
{
    CGFloat myWidth, myHeight;
    CGFloat _BgWidth, _BgHeight;
}
@end


@implementation ScaleCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _BgWidth = SSWIDTH;
        _BgHeight = rowHeight-5;
        
        [self addSubview:self.BgView];
        [self.BgView addSubview:self.contentLab];
        [self.BgView addSubview:self.imgView];
        [self.BgView addSubview:self.imgView2];
        [self.BgView addSubview:self.imgView3];
        [self.BgView addSubview:self.imgView4];

        _BgView.frame = CGRectMake(0, 0, _BgWidth, _BgHeight);
        _contentLab.frame = CGRectMake(10, 0, 30,_BgHeight);
        CGFloat yy = 5, hh = (_BgHeight-yy*2);
        _imgView.frame = CGRectMake(_contentLab.right+10, yy, hh, hh);
        _imgView2.frame = CGRectMake(_imgView.right+10, yy, hh, hh);
        _imgView3.frame = CGRectMake(_imgView2.right+10, yy, hh, hh);
        _imgView4.frame = CGRectMake(_imgView3.right+10, yy, hh, hh);

        self.backgroundColor = Clear_COLOR;
        self.BgView.backgroundColor = White_COLOR;
        self.imgView.backgroundColor = Clear_COLOR;
        self.contentLab.textColor = Gray_333333;

    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    //画虚线
    CGFloat dashArray[] = {2, 3};
    [self drawDashLineOfDashArray:dashArray
                       startPoint:CGPointMake(5, _BgHeight+3)
                         endPoint:CGPointMake(SSWIDTH-10, _BgHeight+3)
                        lineWidth:2.0f lineColor:Orange_AA ];
}

/**
 画虚线

 @param dashArray 虚线间隙数组
 @param startPoint  开始点 坐标
 @param endPoint    结束点 坐标
 @param lineWidth 线宽
 @param lineColor 线颜色
 */
- (void)drawDashLineOfDashArray:(const CGFloat * __nullable)dashArray
                     startPoint:(CGPoint)startPoint
                       endPoint:(CGPoint)endPoint
                      lineWidth:(CGFloat)lineWidth
                      lineColor:(UIColor *)lineColor{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineDash(ctx, 0, dashArray, 2);
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);       
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
}



- (UIView *)BgView {
    if (_BgView==nil) {
        _BgView = [[UIView alloc] init];
        _BgView.backgroundColor = White_COLOR;
    }return _BgView;
}
- (UIImageView *)imgView {
    if (_imgView==nil) {
        _imgView = [[UIImageView alloc]init];
        _imgView.backgroundColor = [UIColor clearColor];
    }return _imgView;
}
- (UIImageView *)imgView2 {
    if (_imgView2==nil) {
        _imgView2 = [[UIImageView alloc]init];
        _imgView2.backgroundColor = [UIColor clearColor];
    }return _imgView2;
}
- (UIImageView *)imgView3 {
    if (_imgView3==nil) {
        _imgView3 = [[UIImageView alloc]init];
        _imgView3.backgroundColor = [UIColor clearColor];
    }return _imgView3;
}
- (UIImageView *)imgView4 {
    if (_imgView4==nil) {
        _imgView4 = [[UIImageView alloc]init];
        _imgView4.backgroundColor = [UIColor clearColor];
    }return _imgView4;
}

- (UILabel *)contentLab {
    if (_contentLab==nil) {
        _contentLab = [[UILabel alloc] init];
        _contentLab.font = FFont(15);
        _contentLab.textColor = Gray_333333;
        _contentLab.numberOfLines = 0;
        _contentLab.backgroundColor = [UIColor clearColor];
    }return _contentLab;
}


@end

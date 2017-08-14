//
//  CircleProgressView.m
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CircleProgressView.h"
#import "BaseHeader.h"
#import "UIView+ZMFrame.h"


@interface CircleProgressView()
@property (strong,nonatomic) CAShapeLayer *progressLayer;   //
@property (strong,nonatomic) UILabel *progressLab;      //
@end


@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        
        self.lineWidth   = 10;              // 线条宽度
        self.lineCap     = kCALineCapRound; // 边缘线的类型
        self.strokeStart = 0.0f;            // 弧线开始的角度值
        self.strokeEnd   = 0.0f;            // 弧线结束的角度值
        self.isAnimation = NO;              // 是否动画 播放进度
        
        [self addSubview:self.progressLab];
        _progressLab.text = [NSString stringWithFormat:@"%f",(self.strokeEnd-self.strokeStart)];

    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // 画进度条
    [self drawProgress];
}


// 画进度条
- (void)drawProgress {
    
    //圆心
    float centerX = self.width/2.0;
    float centerY = self.height/2.0;
    //半径
    float radius = (self.bounds.size.width-_lineWidth)/2.0;

    // 贝塞尔曲线(创建一个圆)  radius：半径R
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX,centerY)
                                                        radius:radius
                                                    startAngle:0
                                                      endAngle:M_PI * 2
                                                     clockwise:YES];
    //添加背景圆环
    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.frame = self.bounds;
    backLayer.fillColor     =  [[UIColor clearColor] CGColor];
    backLayer.strokeColor   = BgColor.CGColor;
    backLayer.lineWidth     = _lineWidth;
    backLayer.path = [path CGPath];
    backLayer.strokeEnd = 1;
    [self.layer addSublayer:backLayer];

    
    // 创建一个shapeLayer
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame         = self.bounds;
    _progressLayer.fillColor     = [UIColor clearColor].CGColor;
    _progressLayer.strokeColor   = Orange_ff7800.CGColor;
    _progressLayer.lineCap       = kCALineCapRound;
    _progressLayer.lineWidth     = _lineWidth;
    _progressLayer.path          = path.CGPath;
    [self.layer addSublayer:_progressLayer];
    
    if (_isAnimation) {
        _progressLayer.strokeStart   = _strokeStart;
        _progressLayer.strokeEnd     = 0;

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration  = 1.0;
        animation.fromValue = [NSNumber numberWithFloat:_strokeStart];
        animation.toValue   = [NSNumber numberWithFloat:_strokeEnd]; 
        animation.fillMode            =kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        [_progressLayer addAnimation:animation forKey:nil];
        
    }else{
        _progressLayer.strokeStart   = _strokeStart;
        _progressLayer.strokeEnd     = _strokeEnd;
    }
    _progressLab.text = [NSString stringWithFormat:@"%f",(self.strokeEnd-self.strokeStart)];
    
}
- (UILabel *)progressLab {
    if (_progressLab==nil) {
        _progressLab= [[UILabel alloc] init];
        _progressLab.frame = CGRectMake(0, 0,self.width-_lineWidth*2, self.height-_lineWidth*2);
        _progressLab.center = CGPointMake(self.width/2, self.height/2);
        _progressLab.textAlignment = NSTextAlignmentCenter;
        _progressLab.backgroundColor= Yellow_COLOR;
        _progressLab.font = FFont(20);
        _progressLab.layer.cornerRadius = (self.height-_lineWidth*2)/2;
        _progressLab.clipsToBounds = YES;
    }
    return _progressLab;
}

- (void)setStrokeStart:(CGFloat)strokeStart {
    _strokeStart= strokeStart;
    if (_progressLayer!=nil) {
        _progressLayer.strokeStart = strokeStart;
    }
}
- (void)setStrokeEnd:(CGFloat)strokeEnd {
    _strokeEnd= strokeEnd;
    if (_progressLayer!=nil) {
        //_progressLayer.strokeEnd = strokeEnd; //此方式不行
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration  = 1.0;
        animation.toValue   = [NSNumber numberWithFloat:_strokeEnd];
        animation.fillMode            =kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        [_progressLayer addAnimation:animation forKey:nil];
        _progressLab.text = [NSString stringWithFormat:@"%f",(self.strokeEnd-self.strokeStart)];
    }
}

//- (void)setLineWidth:(CGFloat)lineWidth {
//    _lineWidth= lineWidth;
//    if (_progressLayer!=nil) {
//        _progressLayer.lineWidth = _lineWidth;
//    }
//}
//- (void)setLineCap:(NSString *)lineCap {
//    _lineCap = lineCap;
//    if (_progressLayer!=nil) {
//        _progressLayer.lineCap   = _lineCap;
//    }
//}
//- (void)setIsAnimation:(BOOL)isAnimation {
//    
//    if (_progressLayer!=nil) {
//        if (_isAnimation) {
//            _progressLayer.strokeStart   = _strokeStart;
//            _progressLayer.strokeEnd     = 0;
//            
//            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//            animation.duration  = 1.0;
//            animation.fromValue = [NSNumber numberWithFloat:_strokeStart];
//            animation.toValue   = [NSNumber numberWithFloat:_strokeEnd];
//            animation.fillMode            =kCAFillModeForwards;
//            animation.removedOnCompletion = NO;
//            [_progressLayer addAnimation:animation forKey:nil];
//            
//        }else{
//            _progressLayer.strokeStart   = _strokeStart;
//            _progressLayer.strokeEnd     = _strokeEnd;
//        }
//    }
//}


@end

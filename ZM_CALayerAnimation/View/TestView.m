//
//  TestView.m
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/8/3.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "TestView.h"
#import "BaseHeader.h"

@interface TestView()
@property (nonatomic, assign) int loadNum;
@end


@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        NSLog(@"--> initWithFrame");
//        _loadNum= 0;
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"--> init");
        _loadNum= 0;
    }
    return self;
}

// 绘制UI
- (void)drawRect:(CGRect)rect {
     [super drawRect:rect];
    NSLog(@"--> drawRect：绘制UI_渲染绘图 \n "); _loadNum++;
}
// 布局UI
- (void)layoutSubviews {
    NSLog(@"--> layoutSubviews：布局UI_加载数据");  if (_loadNum!=0) { NNSLog(@"\n ");}
}


// 重新加载_layoutSubviews
- (void)method1 {
    NSLog(@"--> setNeedsLayout：方便出来数据_method1");
    [self setNeedsLayout];
    _loadNum++;
}

// 重新绘制_drawRect
- (void)method2 {
    NSLog(@"--> setNeedsDisplay：方便绘图_method2");
    [self setNeedsDisplay]; _loadNum++;
    
}

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"--> awakeFromNib");
    //调用此方法后，才可以获取到正确的frame
//    [self layoutIfNeeded];

}


- (void)test {
    //如果要立即刷新，要先调用[view setNeedsLayout]，把标记设为需要布局，
    //然后马上调用[view layoutIfNeeded]，实现布局
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    
    
}
/*
 一、layoutSubviews不能直接调用这个方法。
 强制刷新布局，调用 setNeedsLayout，
 如果想马上刷新界面，调用 layoutIfNeeded
 
 
 测试加载的顺序如下：
 1. awakeFromNib (alloc)
 2. initWithFrame   初始化
 3. layoutSubviews  布局UI_加载数据
 4. drawRect        绘制UI_渲染绘图 
 
*/

@end

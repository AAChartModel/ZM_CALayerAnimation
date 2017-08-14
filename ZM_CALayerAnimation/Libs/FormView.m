//
//  FormView.m
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "FormView.h"

@implementation FormView

#pragma mark - drawRect
- (void)drawRect:(CGRect)rect {
    if (_borderPath) {
        if (_border_fillColor) {
            [_border_fillColor setFill];
            [_borderPath fill];
        }
        if (_border_strokeColor) {
            [_border_strokeColor setStroke];
            [_borderPath stroke];
        }
        
        [_borderPath addClip];
    }
}

@end

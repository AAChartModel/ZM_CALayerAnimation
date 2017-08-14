//
//  RectView.h
//  GraphicsAnimation
//
//  Created by ZM on 2017/3/10.
//  Copyright © 2017年 TD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RectView : UIView
{
    
}
@property (nonatomic ,strong) UIBezierPath* bezierPath;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *strokeColor;
@property(nonatomic) CGFloat lineWidth;


@end

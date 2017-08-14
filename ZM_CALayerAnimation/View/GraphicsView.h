//
//  GraphicsView.h
//  ZM_CGContextRef
//
//  Created by tangdi on 15/6/30.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

// float ssWidth=  self.frame.size.width;
// float ssHeight= self.frame.size.height;
#define  ssWidth      self.frame.size.width
#define  ssHeight     self.frame.size.height

@interface GraphicsView : UIView
{
    
}
@property(nonatomic,strong)UIButton* numBtn;
@property(nonatomic,copy)NSString* num;
@property(nonatomic,assign)float numFont;

@property (nonatomic) CGContextRef MyContext;

@end

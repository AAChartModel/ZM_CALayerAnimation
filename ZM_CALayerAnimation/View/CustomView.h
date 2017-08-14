//
//  CustomView.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/8/4.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;
- (IBAction)testBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labLetf;

@end

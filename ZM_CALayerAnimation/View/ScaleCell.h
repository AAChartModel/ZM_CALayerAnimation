//
//  ScaleCell.h
//  ZM_ScaleZoomImageView
//
//  Created by ZM on 2017/4/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScaleCell : UITableViewCell
{
    
}

@property(nonatomic,strong) UIView* BgView;
@property(nonatomic,strong) UILabel* contentLab;  //内容
@property(nonatomic,strong) UIImageView* imgView; //图片
@property(nonatomic,strong) UIImageView* imgView2; //图片
@property(nonatomic,strong) UIImageView* imgView3; //图片
@property(nonatomic,strong) UIImageView* imgView4; //图片

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight;


@end

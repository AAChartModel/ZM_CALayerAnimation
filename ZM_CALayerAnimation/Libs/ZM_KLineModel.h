//
//  ZM_KLineModel.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZM_KLineModel : NSObject {
    
}
// 日期
@property (nonatomic, copy) NSString *Date;
// 开盘价
@property (nonatomic, copy) NSNumber *Open;
// 收盘价
@property (nonatomic, copy) NSNumber *Close;//CGFloat Close;
// 最高价
@property (nonatomic, copy) NSNumber *High; //CGFloat High;
// 最低价
@property (nonatomic, copy) NSNumber *Low;  //CGFloat Low;
// 成交量
@property (nonatomic, assign) CGFloat Volume;

@end

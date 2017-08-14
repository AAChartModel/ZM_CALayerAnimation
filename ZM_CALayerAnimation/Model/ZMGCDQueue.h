//
//  ZMGCDQueue.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMGCDQueue : NSObject

// 执行主要队列
+ (void)addExecutionBlock:(void (^)(void))execute afterDelay:(int64_t)delta;


@end

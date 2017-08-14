//
//  ZMGCDQueue.m
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/17.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMGCDQueue.h"

@implementation ZMGCDQueue

+ (ZMGCDQueue *)singleton
{
    static ZMGCDQueue *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


/**
 *  执行主要队列
 *
 *  @param execute 执行的任务
 *  @param delta   延迟的时间
 */
+ (void)addExecutionBlock:(void (^)(void))execute afterDelay:(int64_t)delta {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), ^(void){
        
        execute(); //NSLog(@"执行主要队列 主线程");
    });
}


@end

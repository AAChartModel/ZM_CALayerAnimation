//
//  AppDelegate.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

/*
 QuartzCore.framework
 CoreText.framework
 
 
 PNChart
 Fun：文字动画
 XSChart：简单折线图
 
 #import <UIKit/UIKit.h>
 #import <Foundation/Foundation.h>
 #import <CoreGraphics/CoreGraphics.h>
 #import <CoreText/CoreText.h>
 #import <QuartzCore/QuartzCore.h>
 
 
 
 */

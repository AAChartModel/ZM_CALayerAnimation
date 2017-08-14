//
//  CALayerAnimationTools.h
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/7/12.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CALayerAnimationTools : NSObject

@end

//弧度转角度  radian -> angle
#define RadiansToDegrees(radians) ((radians) * (180.0 / M_PI))
//角度转弧度  angle -> radian
#define DegreesToRadians(angle)   ((angle) / 180.0 * M_PI)

// DEGREES_TO_RADIANS
// Degrees_To_Radians、Radians_To_Degrees


//FOUNDATION_EXTERN NSString *const NotiMsg;      //提示语
//FOUNDATION_EXTERN CGFloat const Hud_DelayTime;  //延时
//FOUNDATION_EXTERN NSInteger const ValidTime;    //有效时间
//
//NSString *const  NotiMsg = @"新消息";  //提示语
//CGFloat const  Hud_DelayTime = 0.8f;  //延时
//NSInteger const  ValidTime = 30;      //有效时间


//============================"  CABasicAnimation_KeyPath、Key  "=============================
#define AAAAA           @"aaaaa"    //
#define BBBBB           @"bbbbb"    //
#define CCCCC           @"ccccc"    //
/*
 * KeyPath（改变的路径）
 */
#define Scale           @"transform.scale"          // 改变大小（所有方向缩放）
#define ScaleX          @"transform.scale.x"        //
#define ScaleY          @"transform.scale.y"        //
#define ScaleZ          @"transform.scale.z"        //

#define Rotation        @"transform.rotation"       // 旋转（默认围绕z轴）
#define RotationX       @"transform.rotation.x"     //
#define RotationY       @"transform.rotation.y"     //
#define RotationZ       @"transform.rotation.z"     //

#define Position        @"position"                 // 移动位置
#define Translation     @"transform.translation"    // 移动（默认x方向）
#define TranslationX    @"transform.translation.x"  // x方向移动
#define TranslationY    @"transform.translation.y"  // y方向移动
#define TranslationZ    @"transform.translation.z"  // z方向移动
/*
 * Key（改变的效果）
 */
#define ScaleAnimation          @"scaleAnimation"       // 改变大小
#define RotateAnimation         @"rotateAnimation"      // 旋转
#define TranslationAnimation    @"TranslationAnimation" // 移动
#define MoveAnimation           @"moveAnimation"        // 移动位置



//============================"  CATransition_Type "=============================

// 以下API效果可以安全使用
#define Cube					@"cube"			//方块
#define SuckEffect				@"suckEffect"	//三角
#define RippleEffect			@"rippleEffect"	//水波抖动
#define PageCurl				@"pageCurl"		//上翻页
#define PageUnCurl				@"pageUnCurl"	//下翻页
#define OglFlip					@"oglFlip"		//上下翻转
#define CameraIrisHollowOpen	@"cameraIrisHollowOpen"		//镜头快门开
#define CameraIrisHollowClose	@"cameraIrisHollowClose"	//镜头快门关


// 以下API效果请慎用
#define SpewEffect		@"spewEffect"	// 新版面在屏幕下方中间位置被释放出来覆盖旧版面.
#define GenieEffect		@"genieEffect"	// 旧版面在屏幕左下方或右下方被吸走, 显示出下面的新版面
#define UnGenieEffect	@"unGenieEffect"// 新版面在屏幕左下方或右下方被释放出来覆盖旧版面.
#define Twist			@"twist"		// 版面以水平方向像龙卷风式转出来.
#define Tubey			@"tubey"		// 版面垂直附有弹性的转出来.
#define Swirl			@"swirl"		// 旧版面360度旋转并淡出, 显示出新版面.
#define CharminUltra	@"charminUltra"	// 旧版面淡出并显示新版面.
#define ZoomyIn			@"zoomyIn"		// 新版面由小放大走到前面, 旧版面放大由前面消失.
#define ZoomyOut		@"zoomyOut"		// 新版面屏幕外面缩放出现, 旧版面缩小消失.
#define OglApplicationSuspend	@"oglApplicationSuspend" // 像按”home” 按钮的效果.





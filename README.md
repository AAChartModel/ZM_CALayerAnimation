# ZM_CALayerAnimation
###iOS绘图和动画

#### 这里有你想要的 几乎所有的绘图和动画

![](https://github.com/lucking/ZM_CALayerAnimation/raw/master/img1.png)


###  一、drawRect

一般的画图基础知识总结：

1、 CGContextRef context = UIGraphicsGetCurrentContext();     设置上下文,创建画板  
2、 CGContextMoveToPoint                          开始画线 起点坐标  
3、 CGContextAddLineToPoint                       画直线  
4、 CGContextAddEllipseInRect                     画一椭圆或圆  
5、 CGContextSetLineCap                           设置线条终点形状  
6、 CGContextSetLineDash                          画虚线  
7、 CGContextAddRect                              画一方框  
8、 CGContextAddRects                             画多个线  
9、 CGContextFillRect                             补充当前填充颜色的rect  
10  CGContextStrokeRect                           画矩形边框：描边用当前的笔触颜色和当前的线宽。  
11 CGContextStrokeRectWithWidth 	              指定矩形线宽度  
12、CGContextStrokeLineSegments 		              一些直线：一次性画多条  
13、CGContextFillPath(context rect)	              绘制填充路径  
14、CGContextStrokePath 				              开始绘制图片轨迹  
15、CGContextDrawPath                             设置绘制模式  
16、CGContextClosePath                            封闭当前线路  
17、CGContextAddArc                               画圆弧线：画已曲线 前俩店为中心 中间俩店为起始弧度 最后一数据为0则顺时针画 1则逆时针  
18、CGContextAddArcToPoint(context,0,0, 2, 9, 40);	先画俩条线从point 到 弟1点 ，从弟1点到弟2点的线  切割里面的圆  
19、CGContextSetShadowWithColor                   设置阴影  
20、CGContextSetRGBFillColor    	                  这只填充颜色  
21、CGContextSetRGBStrokeColor  	                  画笔颜色设置  
22、CGContextSetFillColorSpace                    颜色空间填充  
23、CGConextSetStrokeColorSpace 	                  颜色空间画笔设置  
24、CGContextSetAlaha 			                  透明度  
25、CGContextTranslateCTM 		                  改变画布位置  
26、CGContextSetLineWidth 		                  设置线的宽度  
27、CGContextAddQuadCurveToPoint 	              画曲线  
28、CGContextTranslateCTM(context, 0, rect.size.height); CGContextScaleCTM(context, 1.0, -1.0);反转画布  
29、CGContextSetInterpolationQuality 	          背景内置颜色质量等级  
30、CGImageCreateWithImageInRect 	              从原图片中取小图  



17 字符串的 写入可用   NSString本身的画图方法

```objective-c    
- (CGize)drawInRect:(CGRect)rect withFont:(UIFont *)font lineBreakMode:(UILineBreakMode)lineBreakMode alignment:(UITextAlignment)alignment;    
```
18 对图片放大缩小的功能就是慢了点  

```objective-c   
   UIGraphicsBeginImageContext(newSize);    
   UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();    
   UIGraphicsEndImageContext();       
```
 
19 `CGColorGetComponents（）` 返回颜色的各个值： 以及透明度 可用只读`const float`来接收 是个数组     

20 画图片 `CGImageRef image＝ CGImageRetain(img.CGImage);`  
```objective-c
       CGContextDrawImage(context, CGRectMake(10.0, height-100.0, 90.0, 90.0), image);    
```
21 实现逐变颜色填充方法 `CGContextClip(context)`;

  ```objective-c  
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();    
    CGFloat colors[] =    
    {    
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,    
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,    
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,    
    };    
    CGGradientRef gradient = CGGradientCreateWithColorComponents (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));    
    CGColorSpaceRelease(rgb);   
    CGContextDrawLinearGradient(context, gradient,CGPointMake(0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),
     kCGGradientDrawsBeforeStartLocation);    
 ```   

22 注: 画完图后,必须     

   1. 先用`CGContextStrokePath`来描线,即形状     
   2. 后用`CGContextFillPath`来填充形状内的颜色.     
填充一个路径的时候，路径里面的子路径都是独立填充的假如是重叠的路径，决定一个点是否被填充，有两种规则    

1. *nonzero winding number rule*:非零绕数规则，假如一个点被从左到右跨过，计数器`+1`，从右到左跨过，计数器`-1`，最后，如果结果是0，那么不填充，如果是非零，那么填充。    

2. *even-odd rule*: 奇偶规则，假如一个点被跨过，那么`+1`，最后是奇数，那么要被填充，偶数则不填充，和方向没有关系。    
   
    Function    
    Description     
    CGContextEOFillPath：        使用奇偶规则填充当前路径    
    CGContextFillPath：          使用非零绕数规则填充当前路径    
    CGContextFillRect   
    CGContextFillRects          填充指定的矩形    
    CGContextFillEllipseInRect	填充指定的一些矩形    
    CGContextDrawPath           填充指定矩形中的椭圆    		
    两个参数决定填充规则，`kCGPathFill`表示用非零绕数规则，`kCGPathEOFill`表示用奇偶规则，`kCGPathFillStroke`表示填充，`kCGPathEOFillStroke`表示描线，不是填充    
 
设置当一个颜色覆盖上另外一个颜色，两个颜色怎么混合?默认方式是:

    ```objective-c 
    result = (alpha * foreground) + (1 - alpha) * background    
    CGContextSetBlendMode 	              //设置blend mode.    
    CGContextSaveGState 	              //保存blend mode.    
    CGContextRestoreGState	              //在没有保存之前，用这个函数还原blend mode.    
    CGContextSetBlendMode 	              //混合俩种颜色    
    CGContextClearRect(context,rect)      //擦除全部所画的       
    ```



二：`Quart 2D ` --------> ` CGPathRef `    
`Quartz－2D`绘图之路径`（Paths）`详解    

首先使用`Quartz`的`CGPath`来做这张图。很简单，首先创建用于转移坐标的`Transform`，然后创建一`CGMutablePathRef`（属于`CGPath`类型）对象。接着通过两个`CGPathAddEllipseInRect`和一个`CGPathAddArc`函数来绘制`Path`中的两个眼睛和一个嘴，注意把`CGAffineTransform`的地址传进去，这样`Transform`才会应用。接着把这个创建好的`CGPath`加入到当前`CGContextRef`中，最后通过`CGContextRef`执行绘画。    

CGPathCreateMutable                 创建一个可变图形的路径 需要自己释放        
CGPathCreateWithEllipseInRect       创建一个椭圆形的不可改变的路径       
CGPathCreateWithRect                创建一个不变的矩形路径       
CGPathCreateCopy                    创建一个不可变的可以拷贝的路径       
CGPathCreateCopyByTransformingPath 	由一个转换矩阵变换一个图形路径创建一个不可变的副本       
CGPathCreateCopyByDashingPath 		  创建一个虚线路径可以复制的       
CGPathCreateCopyByStrokingPath 		  创建一个画的路径       
CGPathCreateMutableCopy 			      创建一个现有的图形路径的副本       
CGPathCreateMutableCopyByTransformingPath 创建一个由一个转换矩阵变换一个图形路径的可变副本       
CGPathRelease 	                    递减保留的图形路径计数       
CGPathRetain 	                      增加保留的图形路径计数       

CGPathAddArc 		                    一个弧形追加一个可变图形的路径， 可能由直线段之前       
CGPathAddEllipseInRect 	            添加一个适合的椭圆在矩形的内部       
CGPathEqualToPath 		              两个图形路径是否相等       
CGPathGetBoundingBox 	              返回图形路径中包含所有点的包围盒       
CGPathGetPathBounding	Box           返回图形路径的边界框       
CGPathGetCurrentPoint 	            返回当前点的路径       
CGPathGetTypeID 		                返回Quartz图形路径的核心基础类型的标识符       
CGPathIsEmpty                       指示路径是否为空       
CGPathIsRect                        图形路径指示是否代表一个矩形      
CGPathContainsPoint 	              检查一个点是否在图形路径中       

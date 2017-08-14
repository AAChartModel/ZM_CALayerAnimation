//
//  Test_VC.m
//  ZM_CALayerAnimation
//
//  Created by ZM on 2017/8/4.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "Test_VC.h"
#import "BaseHeader.h"
#import "UIView+ZMFrame.h"
#import "UIView+ZMAdd.h"
#import "TestView.h"
#import "CustomView.h"

@interface Test_VC ()
@property (nonatomic, strong) TestView *testView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myViewRight;
@property (weak, nonatomic) IBOutlet TestView *myView;
@property (nonatomic, strong) CustomView *customView;
@end

@implementation Test_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}

- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 170;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        if (i==1) {         title=@"[self setNeedsLayout]";}
        else if (i==2){     title=@"[self setNeedsDisplay]";}
        else if (i==7){ width= SSWIDTH-20;  title=@"标记：需要重新布局，但没有立即执行布局（没动画）";}
        else if (i==8){ width= SSWIDTH-20;  title=@"不做标记：重新布局，但是没有立即执行";}
        else if (i==9){ width= SSWIDTH-20;  title=@"做标记：重新布局，立即执行（有动画）";}
        else if (i==10){ width= SSWIDTH-20;  title=@"直接重新布局，立即执行（有动画）";}
        
        [self addBtnTitle:title frame:CGRectMake(10, 40+ (35+10)*i, width, 35) Tag:i];
    }
    
    [self.view addSubview:self.testView];
    [self.view addSubview:self.customView];
}

//例一：
- (void)case1 {
    [_testView method1];
    
}
//例二：
- (void)case2 {
    [_testView method2];
}
//例三：
- (void)case3 {
    NSLog(@"--> 改变_frame");
    _testView.frame = CGRectMake(190, 80, 150, 80);
}
//例四：
- (void)case4 {
    NSLog(@"--> 改变_颜色");
    _testView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.2];
}
//例五：
- (void)case5 {
    NSLog(@"--> case5");
    NSLog(@"--> case8 \n ");
    [UIView animateWithDuration:0.3f animations:^{
        //只是执行了setNeedsLayout 标记了需要重新布局，但是没有立即执行。
        self.myViewRight.constant = 50;
    }];
    
}
//例六：
- (void)case6 {
    NSLog(@"--> case6");
    NSLog(@"--> layoutSubviews：布局UI_加载数据 \n ");
    self.myViewRight.constant = 100;
    [UIView animateWithDuration:0.3f animations:^{
        
        [ self.view layoutIfNeeded];
    }];

    
}


/*---------"  customView  "------------*/

//标记：需要重新布局，但没有立即执行布局
- (void)case7 {
    //只执行了setNeedsLayout 标记了需要重新布局，但是没有立即执行布局（没动画：没执行 layoutIfNeeded）
    [UIView animateWithDuration:0.3f animations:^{
        self.customView.labLetf.constant = 50;
    }];
  
}
//测试顺序： case10 --> case8
- (void)case8 {
    NSLog(@"--> 如果点击了其他方法：做了标记，就会执行布局有动画");
    //不做标记：重新布局，但是没有立即执行 （让约束生效，不立即布局）
    self.customView.labLetf.constant = 90;
    [UIView animateWithDuration:0.3f animations:^{
        [ self.customView layoutIfNeeded];
    }];
}

//测试顺序： case10 --> case9
- (void)case9 {
    //做标记：重新布局，立即执行
    [self.customView setNeedsLayout];
    self.customView.labLetf.constant = 130;
    [UIView animateWithDuration:0.3f animations:^{
        [ self.customView layoutIfNeeded];
    }];
}

- (void)case10 {
    //直接重新布局，立即执行（默认做标记，有动画）
    [UIView animateWithDuration:0.3f animations:^{
        self.customView.titleLab.frame = CGRectMake(160, 10, 80, 40);
    }];
}



- (void)case11 {
}
- (void)case12 {
}
- (void)case13 {
}


- (void)myBtnClick:(UIButton *)Btn{
    
    if (Btn.tag==1) {       [self case1];
    }else if (Btn.tag==2) { [self case2];
    }else if (Btn.tag==3) { [self case3];
    }else if (Btn.tag==4) { [self case4];
    }else if (Btn.tag==5) { [self case5];
    }else if (Btn.tag==6) { [self case6];
    }else if (Btn.tag==7) { [self case7];
    }else if (Btn.tag==8) { [self case8];
    }else if (Btn.tag==9) { [self case9];
    }else if (Btn.tag==10) { [self case10];
    }else if (Btn.tag==11) { [self case11];
    }else if (Btn.tag==12) { [self case12];
    }else if (Btn.tag==13) { [self case13];
    }
}



- (TestView *)testView {
    if (_testView==nil) {
        _testView = [[TestView alloc] initWithFrame:CGRectMake(190, 80, 150, 50)];
        _testView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.2];
    }return _testView;
}

- (CustomView *)customView {
    if (_customView==nil) {
        _customView = [[UINib nibWithNibName:@"CustomView" bundle:nil] instantiateWithOwner:nil options:nil][0];
        _customView.frame = CGRectMake(20, 535, 300, 120);
    }return _customView;
}

@end

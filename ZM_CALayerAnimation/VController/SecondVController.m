//
//  SecondVController.m
//  Chart_ZM
//
//  Created by ZM on 2017/7/6.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "SecondVController.h"
#import "BaseHeader.h"
#import "BaseHeader.h"
#import "Common.h"
#import "ScaleCell.h"

static CGFloat const rowHeight = 80;//
@interface SecondVController ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *ttableView;
@property (nonatomic, strong) NSMutableArray* titleArray;
@property (nonatomic, strong) NSArray* imgArray;



@end

@implementation SecondVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SecondVC";
    
    // 测试 fps(每秒帧数)
    _titleArray = [[NSMutableArray alloc] init];
    _imgArray = @[@"test1.jpeg",
                  @"Guidepage_1242x2208-3",
                  @"scene1",
                  @"scene2",
                  @"nowifi",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  @"compress",@"compress",@"compress",@"compress",
                  ];
    
    [_imgArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.titleArray addObject:[NSString stringWithFormat:@"%ld",idx]];
    }];
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
    _ttableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SSWIDTH, SSHEIGHT)];
    _ttableView.backgroundColor = BgLightColor;;
    _ttableView.delegate = self;
    _ttableView.dataSource= self;
    _ttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_ttableView];
    [Common clearTableViewLine:_ttableView];
    
}
- (void)case1 {
    UIImageView *aImageView;
    aImageView.layer.cornerRadius = aImageView.frame.size.width/2.0;
    aImageView.layer.masksToBounds = YES;
}

#pragma mark UITableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //NSSLog(@"indexPath = %ld",(long)indexPath.row);
}

#pragma mark ------"  UITableViewDataSource、UITableViewDelegate  "------
// rowHeight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return rowHeight;
}
// row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _imgArray.count;
}
// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CellID_BB";
    ScaleCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[ScaleCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier: cellID rowHeight:rowHeight];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    };
    
    cell.contentLab.text = _titleArray[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:_imgArray[indexPath.row]];
    cell.imgView2.image = [UIImage imageNamed:_imgArray[indexPath.row]];
    cell.imgView3.image = [UIImage imageNamed:_imgArray[indexPath.row]];
    cell.imgView4.image = [UIImage imageNamed:_imgArray[indexPath.row]];
    
    //    cell.imgView.layer.cornerRadius = cell.imgView.frame.size.width/2.0;
    //    cell.imgView.layer.masksToBounds = YES;
    //
    //    cell.imgView2.layer.cornerRadius = cell.imgView.frame.size.width/2.0;
    //    cell.imgView2.layer.masksToBounds = YES;
    //
    //    cell.imgView3.layer.cornerRadius = cell.imgView.frame.size.width/2.0;
    //    cell.imgView3.layer.masksToBounds = YES;
    //
    //    cell.imgView4.layer.cornerRadius = cell.imgView.frame.size.width/2.0;
    //    cell.imgView4.layer.masksToBounds = YES;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:cell.imgView.bounds];
    layer.path = aPath.CGPath;
    cell.imgView.layer.mask = layer;
    cell.imgView2.layer.mask = layer;
    cell.imgView3.layer.mask = layer;
    cell.imgView4.layer.mask = layer;
    
    return cell;
}



@end

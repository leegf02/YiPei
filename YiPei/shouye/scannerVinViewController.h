//
//  scannerVinViewController.h
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBProgressHUD;

@interface scannerVinViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)IBOutlet UIScrollView *ContenrScroll;
@property(nonatomic,strong)IBOutlet UIView *cheXingView;
@property(nonatomic,strong)IBOutlet UITableView *cheXingTable;
@property(nonatomic,strong)IBOutlet UIImageView *cheImage;

@property(nonatomic,strong)IBOutlet UIView *xiangXiView;
@property(nonatomic,strong)IBOutlet UITableView *InfoTable;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

//@property (nonatomic, strong) UIImage *img;
@property(nonatomic, strong)NSString *resKey;
//返回
-(IBAction)clickFanHuiBT:(id)sender;

//购物车
-(IBAction)clickShoppingCartBT:(id)sender;

//选择车型
-(void)selectCheXing:(id)sender;

//车型信息的布局
-(void)cheXingTableLayout;

//详细信息的布局
-(void)InfoTableLayout;


@end

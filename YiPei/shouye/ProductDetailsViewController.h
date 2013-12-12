//
//  ProductDetailsViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"

@class goodInfoDetailFunc;
@class GoodsInfo;
@class searchFunc;
@class UIHTTPImageView;

@interface ProductDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,dataGoodsInfoProcessProtocol,dataSearchGoodsByBarCodeProcessProtocol>
{
    goodInfoDetailFunc *goodInfoFunc;
    NSString *pid;
    GoodsInfo *info;
    NSString *barcode;
    searchFunc *searchfunc;
    int intBuyNum;
}


@property(nonatomic,strong)IBOutlet UIScrollView *ContenrScroll;
@property(nonatomic,strong)IBOutlet UIView *contenrBack;

@property(nonatomic,strong)IBOutlet UIView *imageView;
@property(nonatomic,strong)IBOutlet UIView *imageBackView;
@property(nonatomic,strong)IBOutlet UIScrollView *imageScroll;
@property(nonatomic,strong)IBOutlet UIButton *leftImageBT;
@property(nonatomic,strong)IBOutlet UIButton *rightImageBT;
@property(nonatomic,strong)IBOutlet UIHTTPImageView *imageOri;

@property(nonatomic,strong)IBOutlet UIView *infoView;
@property(nonatomic,strong)IBOutlet UILabel *nameLabel;
@property(nonatomic,strong)IBOutlet UILabel *jianJieLabel;
@property(nonatomic,strong)IBOutlet UILabel *NowPrice;
@property(nonatomic,strong)IBOutlet UILabel *priceShuoming;
@property(nonatomic,strong)IBOutlet UILabel *yuanPrice;
@property(nonatomic,strong)IBOutlet UILabel *chengJiaoLiangLa;
@property(nonatomic,strong)IBOutlet UIButton *jianJiaBT;
@property(nonatomic,strong)IBOutlet UILabel *gouMaiNum;
@property(nonatomic,strong)IBOutlet UIButton *jianBT;//减按钮
@property(nonatomic,strong)IBOutlet UIButton *jiaBT;//加按钮

@property(nonatomic,strong)IBOutlet UIView *guiGeView;
@property(nonatomic,strong)IBOutlet UITableView *guiGeTable;

@property(nonatomic,strong)IBOutlet UITableView *detailedTable;
@property(nonatomic,strong)IBOutlet UIView *butView;
@property(nonatomic,strong)IBOutlet UIButton *gouMaiBT;
@property(nonatomic,strong)IBOutlet UIButton *gouWuCheBT;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

@property(nonatomic,strong)goodInfoDetailFunc *goodInfoFunc;
@property(nonatomic,strong)GoodsInfo *info;

@property(nonatomic,strong)NSString *pid;
@property(nonatomic,strong)NSString *barcode;
@property(nonatomic,strong)searchFunc *searchfunc;

@property(nonatomic,strong)NSArray *guiGeArray;


//返回
-(IBAction)clickFanHuiBT:(id)sender;
//购物车
-(IBAction)clickShoppingCartBT:(id)sender;
//左图片按钮
-(IBAction)clickLeftImageBT:(id)sender;
//右图片按钮
-(IBAction)clickRightImageBT:(id)sender;
//降价通知
-(IBAction)clickjianJiaBT:(id)sender;
//减数量
-(IBAction)clickJianNumBT:(id)sender;
//加数量
-(IBAction)clickJiaNumBT:(id)sender;
//立即购买
-(IBAction)clickGouMaiBT:(id)sender;
//加入购物车
-(IBAction)clickJoinShoppingCartBT:(id)sender;



@end

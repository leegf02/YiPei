//
//  JieSuanGuanLiViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JieSuanGuanLiViewController : UIViewController
@property(nonatomic,strong)IBOutlet UIView *ButView;
@property(nonatomic,strong)IBOutlet UIButton *sanYueNeiBT;
@property(nonatomic,strong)IBOutlet UIButton *sanYueQianBT;


@property(nonatomic,strong)IBOutlet UIView *ContenrView;
@property(nonatomic,strong)IBOutlet UILabel *OrderTimeLabel;
@property(nonatomic,strong)IBOutlet UILabel *OrderBianHaoLa;
@property(nonatomic,strong)IBOutlet UIButton *OrderXiangQiangBT;
@property(nonatomic,strong)IBOutlet UILabel *OrederJinELa;
@property(nonatomic,strong)IBOutlet UILabel *OrderShouXinLa;
@property(nonatomic,strong)IBOutlet UILabel *YiFuKuanLa;
@property(nonatomic,strong)IBOutlet UILabel *weiJieSuanLa;
@property(nonatomic,strong)IBOutlet UILabel *JieSuanRiQiLa;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

//返回
-(IBAction)clickFanHuiBT:(id)sender;
//购物车
-(IBAction)clickShoppingCartBT:(id)sender;

-(IBAction)clickXiangQingBT:(id)sender;

-(IBAction)clicksanYueNeiBT:(id)sender;

-(IBAction)clicksanYueQianBT:(id)sender;
@end

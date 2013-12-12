//
//  JieSuanGuanLiViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "JieSuanGuanLiViewController.h"
#import "GuoWuCheViewController.h"

@interface JieSuanGuanLiViewController ()

@end

@implementation JieSuanGuanLiViewController
@synthesize ButView=_ButView;
@synthesize sanYueNeiBT=_sanYueNeiBT;
@synthesize sanYueQianBT=_sanYueQianBT;
@synthesize ContenrView=_ContenrView;
@synthesize OrderTimeLabel=_OrderTimeLabel;
@synthesize OrderBianHaoLa=_OrderBianHaoLa;
@synthesize OrderXiangQiangBT=_OrderXiangQiangBT;
@synthesize OrederJinELa=_OrederJinELa;
@synthesize OrderShouXinLa=_OrderShouXinLa;
@synthesize YiFuKuanLa=_YiFuKuanLa;
@synthesize weiJieSuanLa=_weiJieSuanLa;
@synthesize JieSuanRiQiLa=_JieSuanRiQiLa;
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"结算管理";
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 30, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
}


//返回
-(IBAction)clickFanHuiBT:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
}
//购物车
-(IBAction)clickShoppingCartBT:(id)sender{
    GuoWuCheViewController *guowucheVC=[[GuoWuCheViewController alloc]initWithNibName:@"GuoWuCheViewController" bundle:nil];
    [self.navigationController pushViewController:guowucheVC animated:YES];
}


-(IBAction)clickXiangQingBT:(id)sender{
    NSLog(@"订单详情");
}



-(IBAction)clicksanYueNeiBT:(id)sender{
    NSLog(@"三个月内");
}

-(IBAction)clicksanYueQianBT:(id)sender{
    NSLog(@"三个月外");
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  JinRiFaBuViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-1.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "JinRiFaBuViewController.h"
#import "GuoWuCheViewController.h"
#import "AppDelegate.h"
#import "CustomTabBar.h"
#import "ProductDetailsViewController.h"
#import "model.h"
#import "todayNewfunc.h"

@interface JinRiFaBuViewController (){
    BOOL isXiaoling;//yes为升序  no为降序
    BOOL isJiaGe;////yes为升序  no为降序

}

@end

@implementation JinRiFaBuViewController
@synthesize tableview=_tableview;
@synthesize moRenBT=_moRenBT;
@synthesize xiaoLiangBT=_xiaoLiangBT;
@synthesize xiaoLiangImage=_xiaoLiangImage;
@synthesize jiaGeBT=_jiaGeBT;
@synthesize jiaGeImage=_jiaGeImage;
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;
@synthesize todayNewData=_todayNewData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    isXiaoling=YES;
    isJiaGe=NO;
    _xiaoLiangImage.image=[UIImage imageNamed:@"icon_arrow_down.png"];
    _jiaGeImage.image=[UIImage imageNamed:@"icon_arrow_up.png"];
}



- (void) didTodayNewDataSuccess : (id)data{
//    _todayNewData = (NSArray *)data;
    NSArray *newarray = (NSArray *)data;
    for (int i=0; i<newarray.count;i++ ) {
        todayNew *goods = [[todayNew alloc] init];
        goods.min_price = [[newarray objectAtIndex:i]objectForKey:@"min_price"];    //最低价格
        goods.market_price = [[newarray objectAtIndex:i]objectForKey:@"market_price"]; //商品原价
        goods.goods_id = [[newarray objectAtIndex:i]objectForKey:@"goods_id"];     //商品id
        goods.supplier_id = [[newarray objectAtIndex:i]objectForKey:@"supplier_id"];
        goods.warehouse_id = [[newarray objectAtIndex:i]objectForKey:@"warehouse_id"];
        goods.goods_sn = [[newarray objectAtIndex:i]objectForKey:@"goods_sn"];     //商品编号
        goods.factory_code = [[newarray objectAtIndex:i]objectForKey:@"factory_code"];
        goods.barcode = [[newarray objectAtIndex:i]objectForKey:@"barcode"];
        goods.goods_format = [[newarray objectAtIndex:i]objectForKey:@"goods_format"];
        
        goods.goods_name = [[newarray objectAtIndex:i]objectForKey:@"goods_name"];   //商品名称
        goods.goods_sale_amount = [[newarray objectAtIndex:i]objectForKey:@"goods_sale_amount"];//商品销售量
        goods.package_format = [[newarray objectAtIndex:i]objectForKey:@"package_format"];
        goods.product_company = [[newarray objectAtIndex:i]objectForKey:@"product_company"];
        goods.goods_thumb = [[newarray objectAtIndex:i]objectForKey:@"goods_thumb"];
        goods.goods_img = [[newarray objectAtIndex:i]objectForKey:@"goods_img"];
        goods.original_img = [[newarray objectAtIndex:i]objectForKey:@"original_img"];
        goods.goodsAttrs = [[newarray objectAtIndex:i]objectForKey:@"goodsAttrs"];//商品属性（有多个），基本数据结构如下
        [_todayNewData addObject:goods];
    }
}
- (void) didTodayNewDataFailed : (NSString *)err{

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *app=[AppDelegate shsharedeApp];
    [app.tabBarController bringCustomTabBarToFront];
    
    _todayNewData = [[NSMutableArray alloc] init];
    todayNewfunc *todaynew = [[todayNewfunc alloc] init];
    todaynew.delegate = self;
    [todaynew getTodayNew:@"0" SortPrice:@"0" SortSale:@"0"];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"今日发布";
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 50, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
    
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.rowHeight=65;
    _tableview.separatorColor=[UIColor darkGrayColor];
    [_tableview reloadData];
    
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

//默认按钮
-(IBAction)clickmoRenBT:(id)sender{
    [_tableview reloadData];

}

//销量
-(IBAction)clickxiaoLiangBT:(id)sender{
    if (isXiaoling) {
        isXiaoling=NO;
        _xiaoLiangImage.image=[UIImage imageNamed:@"icon_arrow_up.png"];
    }else{
        isXiaoling=YES;
        _xiaoLiangImage.image=[UIImage imageNamed:@"icon_arrow_down.png"];
    }
    [_tableview reloadData];
}

//价格
-(IBAction)clickjiaGeBT:(id)sender{
    if (isJiaGe) {
        isJiaGe=NO;
        _jiaGeImage.image=[UIImage imageNamed:@"icon_arrow_up.png"];
    }else{
        isJiaGe=YES;
        _jiaGeImage.image=[UIImage imageNamed:@"icon_arrow_down.png"];
    }
   [_tableview reloadData];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_todayNewData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier =[NSString stringWithFormat: @"mycell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
    }
    UIView *spcell = [cell viewWithTag:1002];
    if (spcell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"JinRiFaBuCell" owner:self options:nil];
        spcell=[nib objectAtIndex:0];
        spcell.backgroundColor=[UIColor clearColor];
        [cell addSubview:spcell];
    }
    //UIImageView *imageview=(UIImageView *)[spcell viewWithTag:1];
    todayNew *todaydata = [_todayNewData objectAtIndex:indexPath.row];
    UILabel *nameLa=(UILabel *)[spcell viewWithTag:2];
    nameLa.text=[NSString stringWithFormat:@"%@ %@",todaydata.product_company,todaydata.goods_name];
    
    UILabel *chengjiaLa=(UILabel *)[spcell viewWithTag:3];
    chengjiaLa.text=todaydata.goods_sale_amount;//@"1200件";
    
    UILabel *jiaGeLa=(UILabel *)[spcell viewWithTag:4];
    jiaGeLa.text=todaydata.min_price;//@"¥90.00";

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductDetailsViewController *ProductVc=[[ProductDetailsViewController alloc]initWithNibName:@"ProductDetailsViewController" bundle:nil];
    todayNew *goods = [_todayNewData objectAtIndex:indexPath.row];
    ProductVc.pid= goods.goods_id;
    ProductVc.hidesBottomBarWhenPushed =  YES;
    
    [self.navigationController pushViewController:ProductVc animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

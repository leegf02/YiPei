//
//  GuoWuCheViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "GuoWuCheViewController.h"
#import "AppDelegate.h"
#import "CustomTabBar.h"
#import "userInfo.h"
#import "userDataManager.h"
#import "JieSuanZhiFuViewController.h"
#import "gouwucheChooseViewController.h"
#import "JMWhenTapped.h"

@interface GuoWuCheViewController (){
    BOOL isQuanXuan;
    NSMutableDictionary *selectDictionary;

}

@end

@implementation GuoWuCheViewController
@synthesize tableview=_tableview;
@synthesize quanXuanBT=_quanXuanBT;
@synthesize infoView=_infoView;
@synthesize zongJiaLabel=_zongJiaLabel;
@synthesize shanChuBT=_shanChuBT;
@synthesize jieSuanBT=_jieSuanBT;

@synthesize tableArray=_tableArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
     isQuanXuan=YES;
     [_quanXuanBT setBackgroundImage:[UIImage imageNamed:@"cart_input_choose_press.png"] forState:UIControlStateNormal];

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
    self.title=@"购物车";
    AppDelegate *app=[AppDelegate shsharedeApp];
    [app.tabBarController hideCustomTabBar];
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];

    float height=[[UIScreen mainScreen] bounds].size.height-20;
    _tableview.frame=CGRectMake(0, 35, 320, height-90-40-35);
    _infoView.frame=CGRectMake(0,height-90-40-35, 320, 90);
    
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.separatorColor=[UIColor lightGrayColor];
    _tableview.rowHeight=125;
    selectDictionary=[[NSMutableDictionary alloc]init];
    
    userInfo *user = [[userInfo alloc] init];
    _tableArray = [user getMyCartArr];
    for (int i=0; i<[_tableArray count]; i++) {
        NSString *keyid=[NSString stringWithFormat:@"%d",i];
        [selectDictionary setObject:@"1" forKey:keyid];
    }
    [self updateTotalPrice];
}


//返回
-(void)clickFanHuiBT:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
}
//全选
-(IBAction)clickquanXuanBT:(id)sender{
    if (isQuanXuan) {
        isQuanXuan=NO;
        [_quanXuanBT setBackgroundImage:[UIImage imageNamed:@"cart_input_choose.png"] forState:UIControlStateNormal];
        for (int i=0; i<10; i++) {
            NSString *keyid=[NSString stringWithFormat:@"%d",i];
            [selectDictionary setObject:@"0" forKey:keyid];
        }
    }else{
        isQuanXuan=YES;
        [_quanXuanBT setBackgroundImage:[UIImage imageNamed:@"cart_input_choose_press.png"] forState:UIControlStateNormal];
        for (int i=0; i<10; i++) {
            NSString *keyid=[NSString stringWithFormat:@"%d",i];
            [selectDictionary setObject:@"1" forKey:keyid];
        }
    }
    [self updateTotalPrice];
    [_tableview reloadData];
}

//删除
-(IBAction)clickshanChuBT:(id)sender{
    userInfo *info=[[userInfo alloc] init];
    for (int i=0; i<[_tableArray count]; i++) {
        if ([[selectDictionary objectForKey:[NSString stringWithFormat:@"%d",i]] isEqualToString:@"1"])
        {
            Goods2Cart *goods = (Goods2Cart *)[_tableArray objectAtIndex:i];
            [info deleteFromMyCart:goods.goodsId];
        }
    }
    _tableArray = [info getMyCartArr];
    [self updateTotalPrice];
    [_tableview reloadData];
}

//结算
-(IBAction)clickjieSuanBT:(id)sender{
    JieSuanZhiFuViewController *buy = [[JieSuanZhiFuViewController alloc]initWithNibName:@"JieSuanZhiFuViewController" bundle:nil];
    NSMutableArray *goodArr = [[NSMutableArray alloc] init];
    for (int i=0; i<[_tableArray count]; i++) {
        if ([[selectDictionary objectForKey:[NSString stringWithFormat:@"%d",i]] isEqualToString:@"1"])
        {
            [goodArr addObject:[_tableArray objectAtIndex:i]];
        }
    }
    buy.jieArray = goodArr;
    [self.navigationController pushViewController:buy animated:YES];
}


//是否选中
-(void)selectShangping:(id)sender{
    UITableViewCell* cell ;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        cell = (UITableViewCell*)[[[sender superview] superview] superview];
    }
    else{
        cell = (UITableViewCell* )[[sender superview] superview];
    }
    NSIndexPath *index = [_tableview indexPathForCell:cell];
    NSString *str=[selectDictionary objectForKey:[NSString stringWithFormat:@"%d",index.row]];
    if ([str isEqualToString:@"1"]) {
         [selectDictionary setObject:@"0" forKey:[NSString stringWithFormat:@"%d",index.row]];
    }else{
         [selectDictionary setObject:@"1" forKey:[NSString stringWithFormat:@"%d",index.row]];
    }
    [self updateTotalPrice];
    [_tableview reloadData];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSString *identifier =[NSString stringWithFormat: @"mycell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
    }
    UIView *spcell = [cell viewWithTag:1001];
    if (spcell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GuoWuCheCell" owner:self options:nil];
        spcell=[nib objectAtIndex:0];
        spcell.backgroundColor=[UIColor clearColor];
        [cell addSubview:spcell];
    }
    UIImageView *imgeview=(UIImageView *)[spcell viewWithTag:1];
    Goods2Cart *goods = (Goods2Cart *)[_tableArray objectAtIndex:indexPath.row];
    
    imgeview.image = [[userDataManager sharedUserDataManager] getDownImageByPid:goods.goodsId];
    
    UILabel *NameLa=(UILabel *)[spcell viewWithTag:2];
    NameLa.text = goods.goodName;//@"MANN 空气滤清器";
    
    UIButton *button=(UIButton *)[spcell viewWithTag:3];
    [button addTarget:self action:@selector(selectShangping:) forControlEvents:UIControlEventTouchUpInside];
    if ([[selectDictionary objectForKey:[NSString stringWithFormat:@"%d",indexPath.row]] isEqualToString:@"1"]) {
        [button setBackgroundImage:[UIImage imageNamed:@"cart_input_choose_press.png"] forState:UIControlStateNormal];
    }else{
        [button setBackgroundImage:[UIImage imageNamed:@"cart_input_choose.png"] forState:UIControlStateNormal];
    }

//    UILabel *xingHaoLa=(UILabel *)[spcell viewWithTag:4];
//    xingHaoLa.text=@"美孚（ow-40）sn 1l装";
    
    UILabel *danjiaLa=(UILabel *)[spcell viewWithTag:5];
    danjiaLa.text=goods.goodPrice;//@"¥120.00";
    
    UILabel *zongjiaLa=(UILabel *)[spcell viewWithTag:6];
    zongjiaLa.text=[[NSString alloc]initWithFormat:@"%d",(int)[goods.goodPrice intValue]*[goods.goodsNumber intValue]];//@"120.00";
    
    UILabel *numberLa=(UILabel *)[spcell viewWithTag:7];
    numberLa.text = goods.goodsNumber ;
    [numberLa whenTapped:^{
        UITableViewCell* cell ;
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
            cell = (UITableViewCell*)[[[numberLa superview] superview] superview];
        }
        else{
            cell = (UITableViewCell* )[[numberLa superview] superview];
        }
        selectIndex = [_tableview indexPathForCell:cell];
        Goods2Cart *goods = (Goods2Cart *)[_tableArray objectAtIndex:selectIndex.row];
        gouwucheChooseViewController *gwc = [[gouwucheChooseViewController alloc] initWithNibName:@"gouwucheChooseViewController" bundle:nil];
        gwc.goods = goods;
        gwc.delegate=self;
        [self presentModalViewController:gwc animated:YES];
    }];
//    UIButton *btn = (UIButton *)[spcell viewWithTag:8];
//    [btn addTarget:self action:@selector(clickAddDel:) forControlEvents:UIControlEventTouchUpInside];
//    btn.titleLabel.text = goods.goodsNumber;
    return cell ;
}


-(void)updateTotalPrice
{
    int TotalPrice = 0;
    for (int i=0; i<[_tableArray count]; i++) {
         if ([[selectDictionary objectForKey:[NSString stringWithFormat:@"%d",i]] isEqualToString:@"1"])
         {
             Goods2Cart *goods = (Goods2Cart *)[_tableArray objectAtIndex:i];
             TotalPrice += [goods.goodPrice intValue]*[goods.goodsNumber intValue];
         }
    }
    _zongJiaLabel.text=[[NSString alloc] initWithFormat:@"%d",TotalPrice];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
}

-(IBAction)clickAddDel:(id)sender
{
    UITableViewCell* cell ;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        cell = (UITableViewCell*)[[[sender superview] superview] superview];
    }
    else{
        cell = (UITableViewCell* )[[sender superview] superview];
    }
    selectIndex = [_tableview indexPathForCell:cell];
    Goods2Cart *goods = (Goods2Cart *)[_tableArray objectAtIndex:selectIndex.row];
    gouwucheChooseViewController *gwc = [[gouwucheChooseViewController alloc] initWithNibName:@"gouwucheChooseViewController" bundle:nil];
    gwc.goods = goods;
    gwc.delegate=self;
    [self presentModalViewController:gwc animated:YES];
}


-(void)updateGoodsNum:(Goods2Cart *)goods
{
    for (Goods2Cart *local in _tableArray) {
        if ([goods.goodsId isEqualToString:local.goodsId] &&[goods.goodName isEqualToString:local.goodName]) {
            local.goodsNumber = goods.goodsNumber;
            userInfo *user = [[userInfo alloc] init];
            [user updateToCartDB:local];
        }
    }
    [_tableview reloadData];
    [self updateTotalPrice];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

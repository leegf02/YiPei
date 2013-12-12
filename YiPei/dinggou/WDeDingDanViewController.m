//
//  WDeDingDanViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "WDeDingDanViewController.h"
#import "GuoWuCheViewController.h"
#import "MyBillFunc.h"
#import "userDataManager.h"
#import "allConfig.h"
#import "userInfo.h"
#import "model.h"

@interface WDeDingDanViewController ()

@end

@implementation WDeDingDanViewController
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;

@synthesize ButView=_ButView;
@synthesize sanYueNeiBT=_sanYueNeiBT;
@synthesize sanYueQianBT=_sanYueQianBT;
@synthesize tableview=_tableview;

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
    self.title=@"我的订单";
    
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
    
    userInfo *user= [[userInfo alloc] init];
    myUsrInfoByPid *userDB =  [user getUsrInfoByPidFromDB];
    if (userDB) {
        MyBillFunc *bill = [[MyBillFunc alloc] init];
        bill.delegate=self;
        [bill getMyBillByMonth:@"0" getUID:[userDataManager sharedUserDataManager].uID clientInfo:@"7" time:@"1" p:BILL_ITEM_PER_PAGE];
    }

    
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    UIView *spcell = [cell viewWithTag:2001];
    if (spcell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DeDingCell" owner:self options:nil];
        spcell=[nib objectAtIndex:0];
        [cell addSubview:spcell];
    }
    UILabel *bianHao=(UILabel *)[spcell viewWithTag:1];
    bianHao.text=@"1234567";
    
    UILabel *time=(UILabel *)[spcell viewWithTag:2];
    time.text=@"10月30";
    
    UILabel *jine=(UILabel *)[spcell viewWithTag:3];
    jine.text=@"¥2000";
    
    UILabel *shouxin=(UILabel *)[spcell viewWithTag:4];
    shouxin.text=@"¥2000";
    
    //UIImageView *tupian=(UIImageView *)[spcell viewWithTag:5];
    
    
    
    UILabel *name=(UILabel *)[spcell viewWithTag:6];
    name.text=@"Mobil 美孚金装美孚1号";
    
    UILabel *shuliang=(UILabel *)[spcell viewWithTag:7];
    shuliang.text=@"10";
    
    UILabel *jiage=(UILabel *)[spcell viewWithTag:8];
    jiage.text=@"¥408.00";
    
    UILabel *zongJia=(UILabel *)[spcell viewWithTag:9];
    zongJia.text=@"4080.00";
    return cell;
}






- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}



-(IBAction)ClickAMonth:(id)sender
{
    userInfo *user= [[userInfo alloc] init];
    myUsrInfoByPid *userDB =  [user getUsrInfoByPidFromDB];
    if (userDB) {
        MyBillFunc *bill = [[MyBillFunc alloc] init];
        bill.delegate=self;
        [bill getMyBillByMonth:@"0" getUID:[userDataManager sharedUserDataManager].uID clientInfo:@"7"  time:@"1" p:BILL_ITEM_PER_PAGE];
    }
}

-(IBAction)ClickTMonth:(id)sender
{
    userInfo *user= [[userInfo alloc] init];
    myProfile *userDB =  [user getMyProfile];
    if (userDB) {
        MyBillFunc *bill = [[MyBillFunc alloc] init];
        bill.delegate=self;
        [bill getMyBillByMonth:@"0" getUID:[userDataManager sharedUserDataManager].uID clientInfo:@"7" time:@"2" p:BILL_ITEM_PER_PAGE];
    }
}

- (void) didMyBillByMonthuccess : (id)data
{
    
}

- (void) didMyBillByMonthFailed : (NSString *)err
{}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

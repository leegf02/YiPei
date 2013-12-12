//
//  WDeZhangHaoViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-4.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "allConfig.h"
#import "WDeZhangHaoViewController.h"
#import "GuoWuCheViewController.h"
#import "UserInfoByIdFunc.h"
#import "model.h"
#import "userDataManager.h"
#import "UIHTTPImageView.h"
#import "userInfo.h"

@interface WDeZhangHaoViewController ()

@end

@implementation WDeZhangHaoViewController
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;

@synthesize xinXiView=_xinXiView;
@synthesize gongSiNameLabel=_gongSiNameLabel;

@synthesize MenDianText=_MenDianText;
@synthesize LiXiRenText=_LiXiRenText;
@synthesize LiXiDianHuaText=_LiXiDianHuaText;
@synthesize diZhiText=_diZhiText;

@synthesize myUserInfo=_myUserInfo;
@synthesize gongSiLogoImgView=_gongSiLogoImgView;
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
    self.title=@"淘汽档口";
    
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
    userInfo *db = [[userInfo alloc]init];
    _myUserInfo=[db getUsrInfoByPidFromDB];
    if (_myUserInfo==nil) {
        UserInfoByIdFunc *byid = [[UserInfoByIdFunc alloc] init];
        byid.delegate = self;
        [byid getUserInfoById:[userDataManager sharedUserDataManager].uID];
    }else
    {
        [_gongSiLogoImgView setImageWithURL:[NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://%@/%@",IMAGE_SERVER_ADDR,_myUserInfo.company_logo]]];
        _gongSiNameLabel.text = _myUserInfo.user_name;
        _MenDianText.text = _myUserInfo.company_name;
        _LiXiRenText.text = _myUserInfo.contact;
        _LiXiDianHuaText.text = _myUserInfo.mobile;
        _diZhiText.text = [[NSString alloc] initWithFormat:@"%@%@%@",_myUserInfo.province,_myUserInfo.city,_myUserInfo.district];
    }
}

- (void) didGetUserInfoByIdDataSuccess : (id)data
{
    _myUserInfo = [[myUsrInfoByPid alloc] init];
    _myUserInfo.user_name  = [data objectForKey:@"user_name"];
    _myUserInfo.user_id  = [data objectForKey:@"user_id"];
    _myUserInfo.client_id  = [data objectForKey:@"client_id"];
    _myUserInfo.city = [data objectForKey:@"user_name"];
    _myUserInfo.company_name = [data objectForKey:@"company_name"];
    _myUserInfo.company_logo = [data objectForKey:@"company_logo"];
    _myUserInfo.company_addres = [data objectForKey:@"company_addres"];
    _myUserInfo.province = [data objectForKey:@"province"];
    _myUserInfo.district = [data objectForKey:@"district"];
    _myUserInfo.mobile = [data objectForKey:@"mobile"];
    _myUserInfo.contact = [data objectForKey:@"contact"];
    [_gongSiLogoImgView setImageWithURL:[NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://%@/%@",IMAGE_SERVER_ADDR,_myUserInfo.company_logo]]];
    _gongSiNameLabel.text = _myUserInfo.user_name;
    _MenDianText.text = _myUserInfo.company_name;
    _LiXiRenText.text = _myUserInfo.contact;
    _LiXiDianHuaText.text = _myUserInfo.mobile;
    _diZhiText.text = [[NSString alloc] initWithFormat:@"%@%@%@",_myUserInfo.province,_myUserInfo.city,_myUserInfo.district];
    userInfo *db = [[userInfo alloc]init];
    [db updateUserInfoPidByPidToDB:_myUserInfo];
}
- (void) didGetUserInfoByIdFailed : (NSString *)err
{}

//返回
-(IBAction)clickFanHuiBT:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
}
//购物车
-(IBAction)clickShoppingCartBT:(id)sender{
    GuoWuCheViewController *guowucheVC=[[GuoWuCheViewController alloc]initWithNibName:@"GuoWuCheViewController" bundle:nil];
    [self.navigationController pushViewController:guowucheVC animated:YES];
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

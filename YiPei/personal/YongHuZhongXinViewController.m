//
//  YongHuZhongXinViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-4.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "allConfig.h"
#import "model.h"
#import "YongHuZhongXinViewController.h"
#import "GuoWuCheViewController.h"
#import "WDeZhangHaoViewController.h"
#import "profileFunc.h"
#import "userDataManager.h"
#import "UIHTTPImageView.h"
#import "WDeDingDanViewController.h"

#import "userInfo.h"

@interface YongHuZhongXinViewController ()

@end

@implementation YongHuZhongXinViewController
@synthesize xinXiView=_xinXiView;
@synthesize gongSiLogoImgView=_gongSiLogoImgView;
@synthesize gongSiNameLabel=_gongSiNameLabel;
@synthesize DengJiLabel=_DengJiLabel;
@synthesize JiFenLabel=_JiFenLabel;
@synthesize shouXinImage1=_shouXinImage1;
@synthesize shouXinImage2=_shouXinImage2;
@synthesize shouXinImage3=_shouXinImage3;
@synthesize shouXinImage4=_shouXinImage4;
@synthesize shouXinImage5=_shouXinImage5;

@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;

@synthesize mProfile=_mProfile;

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
    profileFunc *profile = [[profileFunc alloc] init];
    profile.delegate = self;
    [profile getProfileIndex:[userDataManager sharedUserDataManager].uID];//[userDataManager sharedUserDataManager].uID;
}

- (void) didProfileDataSuccess : (id)data
{
    NSDictionary *info = [data objectForKey:@"clients_info"];
    NSDictionary *user = [data  objectForKey:@"user_info"];
    NSDictionary *credit = [data objectForKey:@"client_credit"];
    _mProfile = [[myProfile alloc] init];
    _mProfile.clients_info = [[clientInfo alloc] init];
    _mProfile.user_pro_info = [[userProfileInfo alloc] init];
    _mProfile.client_credit = [[clientCredit alloc] init];
    
    _mProfile.clients_info.name = [info objectForKey:@"name"];
    _mProfile.clients_info.logo = [info objectForKey:@"logo"];
    _mProfile.clients_info.addr = [info objectForKey:@"addr"];
    _mProfile.clients_info.contact = [info objectForKey:@"contact"];
    _mProfile.clients_info.tel = [info objectForKey:@"tel"];
    _mProfile.clients_info.mobile = [info objectForKey:@"mobile"];
    
    _mProfile.user_pro_info.user_id = [user objectForKey:@"user_id"];
    _mProfile.user_pro_info.user_name = [user objectForKey:@"user_name"];
    _mProfile.user_pro_info.level = [user objectForKey:@"level"];
    _mProfile.user_pro_info.rank_points = [user objectForKey:@"rank_points"];
    
    _mProfile.client_credit.level = [credit objectForKey:@"level"];
    _mProfile.client_credit.amounts = [credit objectForKey:@"amounts"];
    
    _gongSiNameLabel.text = _mProfile.clients_info.name;
    [_gongSiLogoImgView setImageWithURL:[NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://%@%@",IMAGE_SERVER_ADDR,_mProfile.clients_info.logo]]];
    _JiFenLabel.text = _mProfile.user_pro_info.rank_points;
    [userDataManager sharedUserDataManager].uID = _mProfile.user_pro_info.user_id;
    userInfo *uinfo =[[userInfo alloc] init];
    [uinfo updateMyProfile:_mProfile];
}

- (void) didProfileDataFailed : (NSString *)err
{
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




-(IBAction)clickdingDanBT:(id)sender{
    NSLog(@"sssddd");
    WDeDingDanViewController *wde = [[WDeDingDanViewController alloc] initWithNibName:@"WDeDingDanViewController" bundle:nil];
    [self.navigationController pushViewController:wde animated:YES];
}

-(IBAction)clickzhangHaoBT:(id)sender{
    NSLog(@"sssddd");
    WDeZhangHaoViewController *account = [[WDeZhangHaoViewController alloc]initWithNibName:@"WDeZhangHaoViewController" bundle:nil];
    [self.navigationController pushViewController:account animated:YES];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

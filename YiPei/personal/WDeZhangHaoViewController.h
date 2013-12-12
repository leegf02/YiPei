//
//  WDeZhangHaoViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-12-4.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIHTTPImageView;
@class myUsrInfoByPid;

@interface WDeZhangHaoViewController : UIViewController
@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

@property(nonatomic,strong)IBOutlet UIView *xinXiView;
@property(nonatomic,strong)IBOutlet UILabel *gongSiNameLabel;
@property(nonatomic,strong)IBOutlet UIHTTPImageView *gongSiLogoImgView;
@property(nonatomic,strong)IBOutlet UITextField *MenDianText;
@property(nonatomic,strong)IBOutlet UITextField *LiXiRenText;
@property(nonatomic,strong)IBOutlet UITextField *LiXiDianHuaText;
@property(nonatomic,strong)IBOutlet UITextField *diZhiText;

@property(nonatomic, strong) myUsrInfoByPid *myUserInfo;

//返回
-(IBAction)clickFanHuiBT:(id)sender;
//购物车
-(IBAction)clickShoppingCartBT:(id)sender;
@end

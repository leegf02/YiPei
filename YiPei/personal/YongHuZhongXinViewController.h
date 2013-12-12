//
//  YongHuZhongXinViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-12-4.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myProfile;
@class UIHTTPImageView;

@interface YongHuZhongXinViewController : UIViewController
@property(nonatomic,strong)IBOutlet UIView *xinXiView;
@property(nonatomic,strong)IBOutlet UIHTTPImageView *gongSiLogoImgView;

@property(nonatomic,strong)IBOutlet UILabel *gongSiNameLabel;
@property(nonatomic,strong)IBOutlet UILabel *DengJiLabel;
@property(nonatomic,strong)IBOutlet UILabel *JiFenLabel;
@property(nonatomic,strong)IBOutlet UIImageView *shouXinImage1;
@property(nonatomic,strong)IBOutlet UIImageView *shouXinImage2;
@property(nonatomic,strong)IBOutlet UIImageView *shouXinImage3;
@property(nonatomic,strong)IBOutlet UIImageView *shouXinImage4;
@property(nonatomic,strong)IBOutlet UIImageView *shouXinImage5;

@property(nonatomic,strong)IBOutlet UIView *butView;
@property(nonatomic,strong)IBOutlet UIButton *dingDanBT;
@property(nonatomic,strong)IBOutlet UIButton *zhangHaoBT;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

@property(nonatomic, strong)myProfile *mProfile;

-(IBAction)clickdingDanBT:(id)sender;

-(IBAction)clickzhangHaoBT:(id)sender;

//返回
-(IBAction)clickFanHuiBT:(id)sender;
//购物车
-(IBAction)clickShoppingCartBT:(id)sender;

@end

//
//  JieSuanZhiFuViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-12-3.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JieSuanZhiFuViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,strong)IBOutlet UIScrollView *ContenrScroll;
@property(nonatomic,strong)IBOutlet UIView *shouHuoInfoView;
@property(nonatomic,strong)IBOutlet UITextField *menDianLa;
@property(nonatomic,strong)IBOutlet UITextField *lianXiRenLa;
@property(nonatomic,strong)IBOutlet UITextField *dianHuaLa;
@property(nonatomic,strong)IBOutlet UITextField *diZhiLa;

@property(nonatomic,strong)IBOutlet UIView *faPiaoInfo;
@property(nonatomic,strong)IBOutlet UIButton *faPiaoBT;
@property(nonatomic,strong)IBOutlet UIView *fapiaoTaiTouView;
@property(nonatomic,strong)IBOutlet UITextField *danWeiText;

@property(nonatomic,strong)IBOutlet UIView *InfoView;
@property(nonatomic,strong)IBOutlet UIView *zhiFuInfoView;
@property(nonatomic,strong)IBOutlet UIButton *huoDaoZhiFuBT;
@property(nonatomic,strong)IBOutlet UIButton *zaiXianZhiFuBT;
@property(nonatomic,strong)IBOutlet UILabel *shiYongshouXinEduLa;
@property(nonatomic,strong)IBOutlet UIButton *shiYongshouXinEduBT;
@property(nonatomic,strong)IBOutlet UILabel *shangPingJinELa;
@property(nonatomic,strong)IBOutlet UIImageView *fuWuImage;
@property(nonatomic,strong)IBOutlet UILabel *fuWuPeiSongLa;
@property(nonatomic,strong)IBOutlet UIImageView *shouXinImage;
@property(nonatomic,strong)IBOutlet UILabel *shouXinEduLa;
@property(nonatomic,strong)IBOutlet UILabel *yingFuJinEla;

@property(nonatomic,strong)IBOutlet UIView *butView;
@property(nonatomic,strong)IBOutlet UIButton *yinLianZhiFuBT;
@property(nonatomic,strong)IBOutlet UIButton *weiXinZhiFuBT;


@property(nonatomic,strong)UIButton *leftitem;

@property(nonatomic, strong)NSMutableArray *jieArray;


//返回
-(void)clickFanHuiBT:(id)sender;

//是否要发票
-(IBAction)clickfaPiaoBT:(id)sender;

//是否是货到付款
-(IBAction)clickhuoDaoZhiFuBT:(id)sender;

//在线支付
-(IBAction)clickzaiXianZhiFuBT:(id)sender;

//是否使用授信额度
-(IBAction)clickshiYongshouXinEduBT:(id)sender;

-(IBAction)clickyinLianZhiFuBT:(id)sender;

-(IBAction)clickweiXinZhiFuBT:(id)sender;

@end

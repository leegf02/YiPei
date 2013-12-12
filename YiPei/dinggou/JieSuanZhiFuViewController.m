//
//  JieSuanZhiFuViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-3.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "model.h"
#import "JieSuanZhiFuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "userDataManager.h"

@interface JieSuanZhiFuViewController (){
    BOOL isFaPiao;
    BOOL isHuoDaoFuKuan;
    BOOL isZaiXianZhiFu;
    BOOL isShouXinEdu;
}

@end

@implementation JieSuanZhiFuViewController
@synthesize ContenrScroll=_ContenrScroll;
@synthesize shouHuoInfoView=_shouHuoInfoView;
@synthesize menDianLa=_menDianLa;
@synthesize lianXiRenLa=_lianXiRenLa;
@synthesize dianHuaLa=_dianHuaLa;
@synthesize diZhiLa=_diZhiLa;

@synthesize faPiaoInfo=_faPiaoInfo;
@synthesize faPiaoBT=_faPiaoBT;
@synthesize fapiaoTaiTouView=_fapiaoTaiTouView;
@synthesize danWeiText=_danWeiText;

@synthesize InfoView=_InfoView;
@synthesize zhiFuInfoView=_zhiFuInfoView;
@synthesize huoDaoZhiFuBT=_huoDaoZhiFuBT;
@synthesize zaiXianZhiFuBT=_zaiXianZhiFuBT;
@synthesize shiYongshouXinEduLa=_shiYongshouXinEduLa;
@synthesize shiYongshouXinEduBT=_shiYongshouXinEduBT;
@synthesize shangPingJinELa=_shangPingJinELa;
@synthesize fuWuImage=_fuWuImage;
@synthesize fuWuPeiSongLa=_fuWuPeiSongLa;
@synthesize shouXinImage=_shouXinImage;
@synthesize shouXinEduLa=_shouXinEduLa;
@synthesize yingFuJinEla=_yingFuJinEla;

@synthesize butView=_butView;
@synthesize yinLianZhiFuBT=_yinLianZhiFuBT;
@synthesize weiXinZhiFuBT=_weiXinZhiFuBT;

@synthesize leftitem=_leftitem;
@synthesize jieArray=_jieArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    isFaPiao=YES;
    _fapiaoTaiTouView.hidden=YES;
    _InfoView.frame=CGRectMake(0, 368-45, 320, 320);
    isHuoDaoFuKuan=YES;
    isZaiXianZhiFu=YES;
    isShouXinEdu=YES;
    float height=[[UIScreen mainScreen] bounds].size.height-20;
    _ContenrScroll.frame=CGRectMake(0, 0, 320, height-45-45);
    _butView.frame=CGRectMake(0,height-45-45, 320, 45);

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
    self.title=@"计算支付";
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    [_ContenrScroll setContentSize:CGSizeMake(320, 640+45)];
    _shouHuoInfoView.layer.cornerRadius = 6;
    _faPiaoInfo.layer.cornerRadius=6;
    _zhiFuInfoView.layer.cornerRadius=6;
    _danWeiText.delegate=self;
    
    _menDianLa.delegate=self;
    _lianXiRenLa.delegate=self;
    _dianHuaLa.delegate=self;
    _diZhiLa.delegate=self;
    
    _menDianLa.text=[userDataManager sharedUserDataManager].ver.companyName;
    _lianXiRenLa.text = [userDataManager sharedUserDataManager].ver.contact;
    _dianHuaLa.text=[userDataManager sharedUserDataManager].ver.mobile;
    _diZhiLa.text =[[NSString alloc] initWithFormat:@"%@%@%@",[userDataManager sharedUserDataManager].ver.province,[userDataManager sharedUserDataManager].ver.city,[userDataManager sharedUserDataManager].ver.district];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_menDianLa resignFirstResponder];
    [_lianXiRenLa resignFirstResponder];
    [_dianHuaLa resignFirstResponder];
    [_diZhiLa resignFirstResponder];

}

-(IBAction)backgroundTap:(id)sender
{
    [_menDianLa resignFirstResponder];
    [_lianXiRenLa resignFirstResponder];
    [_dianHuaLa resignFirstResponder];
    [_diZhiLa resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_danWeiText resignFirstResponder];
    [_menDianLa resignFirstResponder];
    [_lianXiRenLa resignFirstResponder];
    [_dianHuaLa resignFirstResponder];
    [_diZhiLa resignFirstResponder];
    return YES;
}

//返回
-(void)clickFanHuiBT:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
}


//是否要发票
-(IBAction)clickfaPiaoBT:(id)sender
{
    if (isFaPiao) {
        isFaPiao=NO;
        [_faPiaoBT setBackgroundImage:[UIImage imageNamed:@"input_choose_press.png"] forState:UIControlStateNormal];
        _fapiaoTaiTouView.hidden=NO;
        _InfoView.frame=CGRectMake(0, 368, 320, 320);
    }else{
        isFaPiao=YES;
        _fapiaoTaiTouView.hidden=YES;
        _InfoView.frame=CGRectMake(0, 368-45, 320, 320);
      [_faPiaoBT setBackgroundImage:[UIImage imageNamed:@"input_choose.png"] forState:UIControlStateNormal];
    }
}

//是否是货到付款
-(IBAction)clickhuoDaoZhiFuBT:(id)sender
{
    if (isHuoDaoFuKuan) {
        [_huoDaoZhiFuBT setBackgroundImage:[UIImage imageNamed:@"input_radio_press.png"] forState:UIControlStateNormal];
        isHuoDaoFuKuan=NO;
        if (isZaiXianZhiFu) {
            [_zaiXianZhiFuBT setBackgroundImage:[UIImage imageNamed:@"input_radio.png"] forState:UIControlStateNormal];
        }
    }else{
        [_huoDaoZhiFuBT setBackgroundImage:[UIImage imageNamed:@"input_radio.png"] forState:UIControlStateNormal];
        isHuoDaoFuKuan=YES;
    }
}

//在线支付
-(IBAction)clickzaiXianZhiFuBT:(id)sender{
    if (isZaiXianZhiFu) {
        if (isHuoDaoFuKuan) {
           [_huoDaoZhiFuBT setBackgroundImage:[UIImage imageNamed:@"input_radio.png"] forState:UIControlStateNormal];
        }
        [_zaiXianZhiFuBT setBackgroundImage:[UIImage imageNamed:@"input_radio_press.png"] forState:UIControlStateNormal];
        isZaiXianZhiFu=NO;
    }else{
        [_zaiXianZhiFuBT setBackgroundImage:[UIImage imageNamed:@"input_radio.png"] forState:UIControlStateNormal];
        isZaiXianZhiFu=YES;
    }
}

//是否使用授信额度
-(IBAction)clickshiYongshouXinEduBT:(id)sender{
    if (isShouXinEdu) {
        isShouXinEdu=NO;
        [_shiYongshouXinEduBT setBackgroundImage:[UIImage imageNamed:@"input_choose_press.png"] forState:UIControlStateNormal];
    }else{
        isShouXinEdu=YES;
        [_shiYongshouXinEduBT setBackgroundImage:[UIImage imageNamed:@"input_choose.png"] forState:UIControlStateNormal];
    }
}

-(IBAction)clickyinLianZhiFuBT:(id)sender{
    NSLog(@"jdkasdjfk");

}

-(IBAction)clickweiXinZhiFuBT:(id)sender{
    NSLog(@"jdkasdjfk");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

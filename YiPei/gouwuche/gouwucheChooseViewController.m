//
//  gouwucheChooseViewController.m
//  YiPei
//
//  Created by lee on 13-12-9.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "gouwucheChooseViewController.h"
#import "model.h"

@interface gouwucheChooseViewController (){
    int number;
}
@end

@implementation gouwucheChooseViewController
@synthesize JiaNumBT=_JiaNumBT;
@synthesize JianNumBT=_JianNumBT;
@synthesize geShu=_geShu;
@synthesize quexiaoBT=_quexiaoBT;
@synthesize quDingBT=_quDingBT;
@synthesize goods=_goods;
@synthesize delegate;

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
    // Do any additional setup after loading the view from its nib.
    number=[_goods.goodsNumber intValue];
    _geShu.text=[NSString stringWithFormat:@"%d",number];

}

//加
-(IBAction)clickJiaNumBT:(id)sender{
    number=number+1;
    _geShu.text=[NSString stringWithFormat:@"%d",number];
    
}

//减
-(IBAction)clickJianNumBT:(id)sender{
    if (number==1) {
        _JianNumBT.userInteractionEnabled=NO;
        [_JianNumBT setBackgroundImage:[UIImage imageNamed:@"probtn_sub_disable.png"] forState:UIControlStateNormal];
        return;
    }
    [_JianNumBT setBackgroundImage:[UIImage imageNamed:@"probtn_sub.png"] forState:UIControlStateNormal];
    number=number-1;
    _geShu.text=[NSString stringWithFormat:@"%d",number];
    
}
//取消
-(IBAction)clickquexiaoBT:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}
//确定
-(IBAction)clickquDingBT:(id)sender{
    _goods.goodsNumber = [[NSString alloc] initWithFormat:@"%d",number];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(updateGoodsNum:)]) {
        [self.delegate performSelector:@selector(updateGoodsNum:) withObject:_goods];
    }
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

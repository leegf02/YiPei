//
//  gouwucheChooseViewController.h
//  YiPei
//
//  Created by lee on 13-12-9.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Goods2Cart;

@protocol numberCallback <NSObject>

-(void)updateGoodsNum:(Goods2Cart *)goods;

@end

@interface gouwucheChooseViewController : UIViewController
{
    id<numberCallback>delegate;
}

@property(nonatomic,strong)IBOutlet UIButton *JiaNumBT;
@property(nonatomic,strong)IBOutlet UIButton *JianNumBT;
@property(nonatomic,strong)IBOutlet UILabel *geShu;
@property(nonatomic,strong)IBOutlet UIButton *quexiaoBT;
@property(nonatomic,strong)IBOutlet UIButton *quDingBT;

@property(nonatomic,strong) Goods2Cart *goods;
@property(nonatomic,strong) id delegate;
-(IBAction)clickJiaNumBT:(id)sender;//加

-(IBAction)clickJianNumBT:(id)sender;//减

-(IBAction)clickquexiaoBT:(id)sender;//取消

-(IBAction)clickquDingBT:(id)sender;//确定
@end

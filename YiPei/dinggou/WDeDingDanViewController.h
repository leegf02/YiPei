//
//  WDeDingDanViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WDeDingDanViewController : UIViewController
@property(nonatomic,strong)IBOutlet UIView *ButView;
@property(nonatomic,strong)IBOutlet UIButton *sanYueNeiBT;
@property(nonatomic,strong)IBOutlet UIButton *sanYueQianBT;

@property(nonatomic,strong)IBOutlet UITableView *tableview;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

//返回
-(IBAction)clickFanHuiBT:(id)sender;
//购物车
-(IBAction)clickShoppingCartBT:(id)sender;

-(IBAction)ClickAMonth:(id)sender;
-(IBAction)ClickTMonth:(id)sender;

@end

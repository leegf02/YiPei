//
//  JinRiFaBuViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-12-1.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class todayNewfunc;

@interface JinRiFaBuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *todayNewData;

}
@property(nonatomic,strong)IBOutlet UITableView *tableview;
@property(nonatomic,strong)IBOutlet UIButton *moRenBT;//默认
@property(nonatomic,strong)IBOutlet UIButton *xiaoLiangBT;//销量
@property(nonatomic,strong)IBOutlet UIImageView *xiaoLiangImage;
@property(nonatomic,strong)IBOutlet UIButton *jiaGeBT;//价格
@property(nonatomic,strong)IBOutlet UIImageView *jiaGeImage;//

@property(nonatomic,strong) NSMutableArray *todayNewData;//


@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

//默认按钮
-(IBAction)clickmoRenBT:(id)sender;

//销量
-(IBAction)clickxiaoLiangBT:(id)sender;

//价格
-(IBAction)clickjiaGeBT:(id)sender;


@end

//
//  GuoWuCheViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuoWuCheViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSIndexPath *selectIndex;
}
@property(nonatomic,strong)IBOutlet UITableView *tableview;
@property(nonatomic,strong)IBOutlet UIButton *quanXuanBT;
@property(nonatomic,strong)IBOutlet UIView *infoView;
@property(nonatomic,strong)IBOutlet UILabel *zongJiaLabel;
@property(nonatomic,strong)IBOutlet UIButton *shanChuBT;
@property(nonatomic,strong)IBOutlet UIButton *jieSuanBT;



@property(nonatomic,strong) NSMutableArray *tableArray;

@property(nonatomic,strong)UIButton *leftitem;
//返回
-(void)clickFanHuiBT:(id)sender;

-(IBAction)clickquanXuanBT:(id)sender;//全选

-(IBAction)clickshanChuBT:(id)sender;//删除

-(IBAction)clickjieSuanBT:(id)sender;//结算



-(IBAction)clickAddDel:(id)sender;
//是否选中
-(void)selectShangping:(id)sender;

@end

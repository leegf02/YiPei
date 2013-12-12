//
//  ShouSuoViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "searchFunc.h"

@interface ShouSuoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,dataSearchGoodsProcessProtocol>
{
	NSString *newString;

}
@property(nonatomic,strong)IBOutlet UIImageView *shouSuoImage;
@property(nonatomic,strong)IBOutlet UITextField *textfield;
@property(nonatomic,strong)IBOutlet UIButton *quxiaoBT;
@property(nonatomic,strong)IBOutlet UITableView *tableview;
@property(nonatomic,strong)IBOutlet UITableView *keytableview;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

@property(nonatomic,strong)NSMutableArray *resArray;
//@property(nonatomic,strong)NSMutableArray *keyArray;


-(IBAction)clickQuXiaoBT:(id)sender;

//返回
-(IBAction)clickFanHuiBT:(id)sender;
//购物车
-(IBAction)clickShoppingCartBT:(id)sender;

- (IBAction)editingChanged:(id)sender;

@end

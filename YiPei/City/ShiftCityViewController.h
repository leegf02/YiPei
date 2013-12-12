//
//  ShiftCityViewController.h
//  YiPei
//
//  Created by lee on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"
#import "ELCityOrientation.h"
@class citySiteFunc;

@interface ShiftCityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,dataCitySiteProcessProtocol,ELCityOrientationDelegate>

@property(nonatomic,strong)UITableView *eCitytab;//城市列表
@property(nonatomic,strong)citySiteFunc *eCityList;//城市列表数据
@property(nonatomic,strong)NSMutableArray *eCityitemarray;
//@property(nonatomic,strong)NSMutableArray *eCityletter;//城市名字首字母
@property(nonatomic,strong)ELCityOrientation *eCityOrientation;//城市定位
@property(nonatomic,strong)NSString *eCityPinyin;
//网络链接成功
-(void)hxzLoadHomeNetData;
//网络链接失败
-(void)hxzCloseFirstViewCallback;
//2g/3g网络提醒
-(void)hxzChkNetViaWWAN;
//无线网络提醒
-(void)hxzChkNetViaWiFi;
@end

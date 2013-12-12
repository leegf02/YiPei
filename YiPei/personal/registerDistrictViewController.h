//
//  registerDistrictViewController.h
//  YiPei
//
//  Created by lee on 13-12-10.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"

@interface registerDistrictViewController : UIViewController<dataReqionInfoProtocol>
@property (nonatomic, retain) NSMutableArray *districArray;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString *proviceID;
@property (nonatomic, strong) NSString *provName;

@property (nonatomic, strong) NSString *cityID;
@property (nonatomic, strong)NSString *cityName;
@property (nonatomic, strong)NSString *district;
@property (nonatomic, strong)NSString *districtName;

@end

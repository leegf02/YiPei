//
//  registerCityViewController.h
//  YiPei
//
//  Created by lee on 13-12-10.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"

@interface registerCityViewController : UIViewController<dataReqionInfoProtocol>
@property (nonatomic, retain) NSMutableArray *arForDetail;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@end

//
//  CarSortWithNameViewController.h
//  YiPei
//
//  Created by daichuanning on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class fenLeiFunc;
#import "dataProcessProtocol.h"

//车型筛选的页面
@interface CarSortWithNameViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,dataGoodsListProcessProtocol>
{
    NSMutableArray * sortWithNameArray;
    
              fenLeiFunc *feiLFunction;
    BOOL isClick;
    
    NSMutableArray * clickArray;
    
    
}

@property(nonatomic, strong) IBOutlet UITableView * sortWithNameTableView;
@property(nonatomic, strong) NSString * carModel;
@end

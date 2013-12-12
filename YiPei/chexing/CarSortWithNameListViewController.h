//
//  CarSortWithNameListViewController.h
//  YiPei
//
//  Created by daichuanning on 13-12-1.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "dataProcessProtocol.h"

//点击第四级的列表的跳转的页面
@class fenLeiFunc;
@interface CarSortWithNameListViewController : UIViewController

<UITableViewDataSource,UITableViewDelegate,dataGoodsListProcessProtocol>{
    NSMutableArray * sortWithNameListArray;
    NSMutableArray * smallTableArray;
    
    BOOL isSort;
    //    BOOL isFilter;
    
          fenLeiFunc *feiLFunction;
}

@property(nonatomic, strong) NSString * carModel;

@property(nonatomic, strong) IBOutlet UITableView * sortWithNameListTableView;

@property(nonatomic, strong) IBOutlet UITableView * smallTableView;

@property(nonatomic, strong) IBOutlet UIButton * sortButton;
@property(nonatomic, strong) IBOutlet UIButton * filterButton;


@property(nonatomic, strong) IBOutlet UIView * blckView;

 
@end

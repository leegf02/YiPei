//
//  PinpaiFenLeiListViewController.h
//  YiPei
//
//  Created by daichuanning on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataProcessProtocol.h"
@class fenLeiFunc;
@interface PinpaiFenLeiListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,dataGoodsListProcessProtocol>{
    NSMutableArray * fenLeiListArray;
    NSMutableArray * smallTableArray;
    fenLeiFunc *feiLFunction;
    BOOL isSort;
    //    BOOL isFilter;
}
@property(nonatomic, strong) NSString * categoryId;
@property(nonatomic, strong)NSString * brandId;

@property(nonatomic, strong) IBOutlet UITableView * fenLeiListTableView;

@property(nonatomic, strong) IBOutlet UITableView * smallTableView;

@property(nonatomic, strong) IBOutlet UIButton * sortButton;
@property(nonatomic, strong) IBOutlet UIButton * filterButton;


@property(nonatomic, strong) IBOutlet UIView * blckView;


@end

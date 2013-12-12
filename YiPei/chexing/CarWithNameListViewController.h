//
//  CarWithNameListViewController.h
//  YiPei
//
//  Created by daichuanning on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
//点击第二级列表的列表

@interface CarWithNameListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * listArray;
}
@property(nonatomic, strong) IBOutlet UITableView * listTableView;
@property(nonatomic, strong)NSString *  barndId;

@end

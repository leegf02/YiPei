//
//  cheXingViewController.h
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cheXingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
  
//    NSMutableArray * letterArray;

    NSMutableArray * filterLetterArray;//分离的字母
    NSMutableDictionary * filterLetterDic;//盛放索引的关键字，但是这个key 是indexPath.row
    NSMutableArray * indexTitleCountArray;//索引的时候用于关联多少的数组
    
    
}

@property(nonatomic, strong) NSMutableArray * reloadArray;//用中间变量刷新table避免了判断

@property(nonatomic, strong) IBOutlet UITableView * carTypeTableView;


@end

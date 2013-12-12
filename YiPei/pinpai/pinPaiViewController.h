//
//  pinPaiViewController.h
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pinPaiViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * brandArray;
    NSMutableArray * letterArray;
    NSMutableArray * reloadArray;//用中间变量刷新table避免了判断  由于两个列表不一样的风格，这个功能没有实现好
    
    BOOL isHotOrLetter;
    
    
    NSMutableArray * filterLetterArray;//分离的字母
    NSMutableDictionary * filterLetterDic;//盛放索引的关键字，但是这个key 是indexPath.row
    NSMutableArray * indexTitleCountArray;//索引的时候用于关联多少的数组
    
    
    
}
@property(nonatomic, strong) NSMutableArray * reloadArray;//用中间变量刷新table避免了判断

@property(nonatomic, strong) IBOutlet UITableView * brandTableView;

@property(nonatomic, strong) IBOutlet UIButton * brandButton;

@property(nonatomic, strong) IBOutlet UIButton * letterButton;

@end

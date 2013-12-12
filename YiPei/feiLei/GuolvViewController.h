//
//  GuolvViewController.h
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuolvViewController : UIViewController
{
    NSMutableArray * typeArray;
    
    NSMutableArray * universalArray;
    NSInteger selectRow;
    
    
    NSMutableArray * selectIndexPathArray;//点击了那一个，现实什么内容  应为tableview重用，所以要添加一个标示点击的内容
    
    NSMutableArray * didSelectArray;
    
}
@property(nonatomic,strong) IBOutlet UIScrollView * filterScrollView;
@property(nonatomic,strong) IBOutlet UITableView * typeTableView;

@property(nonatomic,strong) IBOutlet UIView * universalView;
@property(nonatomic,strong) IBOutlet UITableView * universalTableView;//通用

@property(nonatomic,strong) IBOutlet UIView * lineView;

@property(nonatomic,strong) IBOutlet UIButton * choseCarButton;
@property(nonatomic,strong) IBOutlet UIButton * universalButton;

@property(nonatomic, strong) NSString * categoryId ;

@end

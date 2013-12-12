//
//  GuolvDetailViewController.h
//  YiPei
//
//  Created by daichuanning on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
//过滤详情  如选择了品牌进入品牌的列表

@protocol GuolvListViewControllerDelegate <NSObject>

-(void )didFinishSelectTableview:(NSMutableArray *)data;

@end
@interface GuolvListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * datailArray;
    NSMutableArray * dataArray;//存放每一步的数据
    NSInteger step;//纪录每一步
    
    NSIndexPath * indexPa;//选择 了那一个
    
    
    NSMutableArray * selectArray;//选择了那一个
    
}
@property(nonatomic, strong)id<GuolvListViewControllerDelegate>delegate;


@property(nonatomic, strong) IBOutlet UIView * tableHeadView;
@property(nonatomic, strong) IBOutlet UILabel * nameLab;
@property(nonatomic, strong) IBOutlet UITableView * detailTableView;
@property(nonatomic, strong) NSMutableArray * titleArry;//存放第几步骤的标题

@property(nonatomic, strong) NSString * categoryId;


@property(nonatomic, strong) NSMutableArray * stepOneArray;
@property(nonatomic, strong) NSMutableArray * stepTwoArray;
@property(nonatomic, strong) NSMutableArray * stepThreeArray;
@property(nonatomic, strong) NSMutableArray * stepFourArray;
@end

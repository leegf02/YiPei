//
//  scannerVinViewController.m
//  YiPei
//
//  Created by lee on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "scannerVinViewController.h"
#import "GuoWuCheViewController.h"
#import "AppDelegate.h"
#import "CustomTabBar.h"
#define CHEXINGTABLE_TAG 2001
#define INFOTABLE_TAG 2002
#import "Cell1.h"
#import "Cell2.h"

@interface scannerVinViewController (){
    NSMutableDictionary *selectCheXingDictionary;
    NSMutableArray *cheXingArray;
    
    NSMutableArray *peiJianArray;
    NSMutableArray *peijianInfoArray;
    
    float scrollheight;
    float AdditionHeight;
}
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;
@end

@implementation scannerVinViewController
@synthesize ContenrScroll=_ContenrScroll;
@synthesize cheXingView=_cheXingView;
@synthesize cheXingTable=_cheXingTable;
@synthesize cheImage=_cheImage;

@synthesize xiangXiView=_xiangXiView;
@synthesize InfoTable=_InfoTable;

@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;


@synthesize isOpen,selectIndex;

@synthesize resKey=_resKey;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    selectCheXingDictionary=[[NSMutableDictionary alloc]init];
    cheXingArray=[[NSMutableArray alloc]init];
    for (int i=0; i<3; i++) {
        [selectCheXingDictionary setObject:@"0" forKey:[NSString stringWithFormat:@"%d",i]];//选中的车型 0表示没选中 1表示选中 默认为都不选中
    }
    cheXingArray=[[NSMutableArray alloc]initWithObjects:@"奥迪 A4L 2013款 30 TFSI自动舒适型",@"奥迪 A4L 2013款 30 TFSI自动舒适型",@"奥迪 A4L 2013款 30 TFSI自动舒适型",nil];
    peiJianArray=[[NSMutableArray alloc]initWithObjects:@"润滑系", @"润滑系",@"润滑系",@"润滑系",@"润滑系",nil];
    peijianInfoArray=[[NSMutableArray alloc]initWithObjects:@"1", @"2",@"3",@"4",@"5",nil];
    
    [self cheXingTableLayout];
    [self InfoTableLayout];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *app=[AppDelegate shsharedeApp];
    [app.tabBarController bringCustomTabBarToFront];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        //        self.edgesForExtendedLayout = UIRectEdgeNone;
        //        self.extendedLayoutIncludesOpaqueBars = NO;
        //        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"今日发布";
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 50, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
    
    _cheXingTable.delegate=self;
    _cheXingTable.dataSource=self;
    _cheXingTable.rowHeight=40;
    _cheXingTable.backgroundColor=[UIColor clearColor];
    _cheXingTable.separatorColor=[UIColor clearColor];
    _cheXingTable.scrollEnabled=NO;
    _InfoTable.delegate=self;
    _InfoTable.dataSource=self;
    _InfoTable.rowHeight=40;
    _InfoTable.backgroundColor=[UIColor clearColor];
    _InfoTable.scrollEnabled=NO;
}


//返回
-(IBAction)clickFanHuiBT:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

//购物车
-(IBAction)clickShoppingCartBT:(id)sender{
    GuoWuCheViewController *guowucheVC=[[GuoWuCheViewController alloc]initWithNibName:@"GuoWuCheViewController" bundle:nil];
    [self.navigationController pushViewController:guowucheVC animated:YES];
}


//车型信息的布局
-(void)cheXingTableLayout{
    _cheXingTable.frame=CGRectMake(_cheXingTable.frame.origin.x,_cheXingTable.frame.origin.y, _cheXingTable.frame.size.width, 40*3);
    NSLog(@"%F,%f",_cheXingTable.frame.size.height,_cheXingTable.frame.origin.y);
    _cheXingView.frame=CGRectMake(_cheXingView.frame.origin.x, _cheXingView.frame.origin.y, _cheXingView.frame.size.width, _cheXingTable.frame.size.height+_cheXingTable.frame.origin.y);
    scrollheight=_cheXingView.frame.size.height+_cheXingView.frame.origin.y;
}


//详细信息的布局
-(void)InfoTableLayout{
    _InfoTable.frame=CGRectMake(0, 35, 320, 40*[peiJianArray count]);
    _xiangXiView.frame=CGRectMake(_xiangXiView.frame.origin.x, _cheXingView.frame.size.height+_cheXingView.frame.origin.y, _xiangXiView.frame.size.width, 40*[peiJianArray count]+35);
    scrollheight=scrollheight+_xiangXiView.frame.size.height;
    [_ContenrScroll setContentSize:CGSizeMake(320, scrollheight)];
}


-(void)detailedTableFrame:(NSInteger)row{
    AdditionHeight=row*40;
    _InfoTable.frame=CGRectMake(0, 35, 320, 40*[peiJianArray count]+AdditionHeight);
    [_ContenrScroll setContentSize:CGSizeMake(320, scrollheight+AdditionHeight)];
}



//选择车型
-(void)selectCheXing:(id)sender{
    UIButton *but=(UIButton *)sender;
    UITableViewCell* cell = (UITableViewCell* )but.superview.superview.superview;
    NSIndexPath *index = [_cheXingTable indexPathForCell:cell];
    NSString *str=[selectCheXingDictionary objectForKey:[NSString stringWithFormat:@"%d",index.row]];
    if ([str isEqualToString:@"1"]) {
        [selectCheXingDictionary setObject:@"0" forKey:[NSString stringWithFormat:@"%d",index.row]];
    }else{
        [selectCheXingDictionary setObject:@"1" forKey:[NSString stringWithFormat:@"%d",index.row]];
    }
    [_cheXingTable reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag==INFOTABLE_TAG) {
        return [peiJianArray count];
    }
    return 1;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==INFOTABLE_TAG) {
        if (self.isOpen) {
            if (self.selectIndex.section == section) {
                return [peijianInfoArray count]+1;
            }
        }
        return 1;
    }
    if (tableView.tag==CHEXINGTABLE_TAG) {
        return [cheXingArray count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==CHEXINGTABLE_TAG) {
        static NSString *identifier = @"mycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.backgroundColor=[UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        UIView *spcell = [cell viewWithTag:1000];
        if (spcell==nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"shouYeCell" owner:self options:nil];
            spcell=[nib objectAtIndex:1];
            [cell addSubview:spcell];
        }
        
        UIButton *but=(UIButton *)[spcell.subviews objectAtIndex:0];
        if ([cheXingArray count]==1) {
            but.hidden=YES;
        }else{
            but.hidden=NO;
            [but addTarget:self action:@selector(selectCheXing:) forControlEvents:UIControlEventTouchUpInside];
            if ([[selectCheXingDictionary objectForKey:[NSString stringWithFormat:@"%d",indexPath.row]] isEqualToString:@"1"]) {
                [but setBackgroundImage:[UIImage imageNamed:@"input_radio_press.png"] forState:UIControlStateNormal];
            }else{
                [but setBackgroundImage:[UIImage imageNamed:@"input_radio.png"] forState:UIControlStateNormal];
            }
        }
        
        UILabel *namela=(UILabel *)[spcell viewWithTag:2];
        namela.text=[cheXingArray objectAtIndex:indexPath.row];
        return cell;
    }
    if (tableView.tag==INFOTABLE_TAG) {
        if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0) {
            static NSString *CellIdentifier = @"Cell2";
            Cell2 *cell = (Cell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
                cell.backgroundColor=[UIColor clearColor];
            }
            cell.titleLabel.textColor=[UIColor darkGrayColor];
            cell.titleLabel.text = [peijianInfoArray objectAtIndex:indexPath.row-1];
            return cell;
        }else
        {
            static NSString *CellIdentifier = @"Cell1";
            Cell1 *cell = (Cell1*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
                cell.backgroundColor=[UIColor clearColor];
            }
            NSString *name = [peiJianArray objectAtIndex:indexPath.section] ;
            cell.titleLabel.textColor=[UIColor darkGrayColor];
            cell.titleLabel.text = name;
            cell.textLabel.font=[UIFont systemFontOfSize:14];
            cell.textLabel.textColor=[UIColor darkGrayColor];
            [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
            return cell;
        }
        
    }
    return nil;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==INFOTABLE_TAG) {
        if (indexPath.row == 0) {
            if ([indexPath isEqual:self.selectIndex]) {
                self.isOpen = NO;
                [self didSelectCellRowFirstDo:NO nextDo:NO];
                self.selectIndex = nil;
                
            }else
            {
                if (!self.selectIndex) {
                    self.selectIndex = indexPath;
                    [self didSelectCellRowFirstDo:YES nextDo:NO];
                }else
                {
                    [self didSelectCellRowFirstDo:NO nextDo:YES];
                }
            }
            
        }else
        {
            
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}

- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    Cell1 *cell = (Cell1 *)[_InfoTable cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    [_InfoTable beginUpdates];
    
    int section = self.selectIndex.section;
    int contentCount = [peijianInfoArray count];
    if (self.isOpen) {
        [self detailedTableFrame:contentCount];
    }else{
        [self detailedTableFrame:0];
    }
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_InfoTable insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_InfoTable deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	[_InfoTable endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_InfoTable indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    if (self.isOpen) [_InfoTable scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end

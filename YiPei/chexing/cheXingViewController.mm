//
//  cheXingViewController.m
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "cheXingViewController.h"


#import "fenLeiFunc.h"
#import "Utils.h"

#import  "UINavigationView.h"
#import "FenLeiCell.h"
#import  "FenLeiCell2.h"
#import "GuolvViewController.h"
#import "FenLeiListViewController.h"
#import "CarWithNameListViewController.h"
@interface cheXingViewController ()
@property(nonatomic,strong) IBOutlet UINavigationView * headNav;
@property(nonatomic,strong) fenLeiFunc *feiLFunction;
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@end

@implementation cheXingViewController



@synthesize feiLFunction =_feiLFunction;
@synthesize headNav = _headNav;

@synthesize isOpen = _isOpen;
@synthesize selectIndex = _selectIndex;

@synthesize carTypeTableView = _carTypeTableView;



@synthesize reloadArray =_reloadArray;

static  NSString * letterStr = nil;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:nil tag:3];
//        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"menu_car_press.png"]
//             withFinishedUnselectedImage:[UIImage imageNamed:@"menu_car.png"]];
//        self.tabBarItem = item;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    
    [self initRightBarButtonItem];
    
    _headNav = [[UINavigationView alloc] init];
    //self.navigationItem.leftBarButtonItem=[self setLeftBarButtonItem];
        self.navigationItem.rightBarButtonItem=[self setRightBarButtonItem];
    
    _feiLFunction = [[fenLeiFunc alloc] init];
    _feiLFunction.delegateCarInfoByPid = self;
    [_feiLFunction loadCarInfoByPid:@"0"];
    
   
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
}
-(UIBarButtonItem*)setRightBarButtonItem{
    return [_headNav setWithRightBarItemWithFrame:CGRectMake(280,7, 30, 30)  withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_cart.png"] withHighlighted:nil withTarget:self];
    
    
    
}
-(void)initTableScrollViewFrame{
    
}

- (void) didLoadCarInfoByPidDataSuccess : (id)data
{
     NSMutableArray * tempArray = [[NSMutableArray alloc] initWithArray:(NSArray *)data];
    _reloadArray = [[NSMutableArray alloc]initWithArray:[tempArray sortedArrayUsingFunction:nickNameSort context:NULL]];
    
    [self filterLetterArrayFromDataArray];
    [self filterLetterDicCount];
    
    [_carTypeTableView reloadData];
}
- (void) didGoodsCategoryByPidDataSuccess : (id)data
{
    NSLog(@"didGoodsCategoryByPidDataSuccess!");
    self.isOpen = NO;
    
    NSArray *cbData = (NSArray *)data;
    _reloadArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    NSMutableArray  * arry;
    
    NSMutableArray * tempArray = [[NSMutableArray alloc] init];
    for (int i=0; i<cbData.count; i++) {
        
        arry = [[NSMutableArray alloc] init];
        dic = [[NSMutableDictionary alloc] init];
        [dic setValue:arry forKey:[[NSString alloc] initWithFormat:@"%d",i]];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"cat_name"] forKey:@"name"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"cat_id"] forKey:@"cat_id"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"category_img"] forKey:@"category_img"];
        
        [tempArray addObject:dic];
        
    }

    
    _reloadArray = [[NSMutableArray alloc]initWithArray:[tempArray sortedArrayUsingFunction:nickNameSort context:NULL]];
    
    [self filterLetterArrayFromDataArray];
    [self filterLetterDicCount];
    
    [_carTypeTableView reloadData];
//    _carTypeTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
}

-(void)filterLetterArrayFromDataArray{
    indexTitleCountArray = [[NSMutableArray alloc] init];
    filterLetterArray = [[NSMutableArray alloc] init];
    filterLetterDic = [[NSMutableDictionary alloc] init];
    for (int i = 0;i<_reloadArray.count;i++){
        NSMutableDictionary *dic = [_reloadArray objectAtIndex:i];
        NSString *s = [Utils firstLatter:[dic objectForKey:@"name"]];
        NSMutableArray *array = [filterLetterDic objectForKey:s];
        if (!array) {
            array = [[NSMutableArray alloc] init];
            [filterLetterArray addObject:s];
            
           
            NSString * indexStr = [NSString stringWithFormat:@"%i",i];
            
            [filterLetterDic setObject:array forKey:s];
            [filterLetterDic setObject:s  forKey:indexStr];
            [indexTitleCountArray addObject:indexStr];
        }
        
    }
    
}
//主要是定位索引的时候用到 indexTitleCountArray

-(void)filterLetterDicCount{
    int i;


    NSMutableArray * tempArray = [[NSMutableArray alloc] init];
    
    for ( i=0 ; i<indexTitleCountArray.count -1&i>-1; i++) {

        NSString * str2 = [indexTitleCountArray objectAtIndex:i+1];
        [tempArray addObject:str2];
        
    }
    NSString * obj = [NSString stringWithFormat:@"%i",[_reloadArray count]];
    [tempArray addObject:obj];
    
    indexTitleCountArray = tempArray;
    
}
NSInteger nickNameSort(id user1, id user2, void *context)
{
    NSMutableDictionary *u1,*u2;
    //类型转换
    u1 = (NSMutableDictionary*)user1;
    u2 = (NSMutableDictionary*)user2;
    NSString * name1 =[u1 objectForKey:@"name"];
    NSString * name2 = [u2 objectForKey:@"name"];
   

    return  [name1 localizedCompare:name2];
}





-(void)initRightBarButtonItem{
    
//    [_headNav initWithRightBarItemWithTitle:@"" withFrame:CGRectMake(280,7, 30, 30)  withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_cart.png"] withHighlighted:nil withTarget:self];
    
    
}
-(void)rightBarItemClick{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isOpen) {
        if (self.selectIndex.section == indexPath.section) {
            if(indexPath.row==0){
                return 64;
            }
            return 45;;
        }
    }
    
    return 64;
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView                                                    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
{
    return filterLetterArray;//索引的标示 符号 如abcd......
    
}



- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index  // tell table which section corresponds to section title/index (e.g. "B",1))
{
//    return filterLetterArray.count;
    NSString * count = [indexTitleCountArray objectAtIndex:index];
    int i = [count intValue];
    
    return i;
}

//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_reloadArray count];//
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section    // fixed font style. use custom view (UILabel) if you want something different
{

  
    NSString * keyS = [NSString stringWithFormat:@"%i",section];
   
    return [filterLetterDic objectForKey:keyS];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return [fenLeiDataArray count];
    if (self.isOpen) {
        if (self.selectIndex.section == section) {
            NSString * rowStr = [NSString stringWithFormat:@"%i",section];
            NSMutableDictionary * dic = [_reloadArray objectAtIndex:section];
            NSMutableArray * array = [dic objectForKey:rowStr];
            return [array count]+1;;
        }
    }
    return 1;
    //    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0) {
        static NSString *CellIdentifier = @"FenLeiCell2";
        FenLeiCell2 *cell = (FenLeiCell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            UIImageView * backIamge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteColor.png"]];
            cell.backgroundView = backIamge;
            
        }
        NSString * str = [NSString stringWithFormat:@"%i",indexPath.section];
        NSMutableDictionary * dic = [_reloadArray objectAtIndex:indexPath.section];
        //         [cell cellBackgroundColor ];
        
        NSArray *list = [dic objectForKey:str];
        
        NSLog(@"%d",indexPath.row-1);
        //
        NSDictionary* category = (NSDictionary*)[list objectAtIndex:indexPath.row-1];
        cell.titleLabel.text = [category objectForKey:@"name"];
        cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
        return cell;
    }else
    {
        static NSString *CellIdentifier = @"FenLeiCell";
        FenLeiCell *cell = (FenLeiCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
        }
        //        cell.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        if (indexPath.row==0) {
            cell.frame = CGRectMake(0, 0, 0, 0);
        }
        
        //        NSString * str = [NSString stringWithFormat:@"%i",indexPath.row+1];//应为第零个不显示
        
        NSMutableDictionary * dic = [_reloadArray objectAtIndex:indexPath.section];
        
        
        //        NSMutableArray * array = [[_fenLeiDataArray objectAtIndex:indexPath.section] objectForKey:str];
        //        NSLog(@"array=%@",array);
        
        NSString *name = [dic objectForKey:@"name"];
        cell.titleLabel.text = name;
        cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
        UIImage * image;
        NSString *imageurl = [dic objectForKey:@"category_img"];
        if (![imageurl isEqualToString:@""]) {
            image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageurl]]];
        }
        else
        {
            image =[UIImage imageNamed:@"bg_brand_hot.png"];
        }
        
        [cell showImage:image];
        [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
        return cell;
    }
}


#pragma mark - Table view delegate
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if ([indexPath isEqual:self.selectIndex]) {
            self.isOpen = NO;
            [self didSelectCellRowFirstDo:NO   nextDo:NO];
            self.selectIndex = nil;
            
        }else
        {
            if (!self.selectIndex) {
                self.selectIndex = indexPath;
                [self didSelectCellRowFirstDo:YES  nextDo:NO];
                
            }else
            {
                
                [self didSelectCellRowFirstDo:NO  nextDo:YES];
            }
        }
        
    }else
    {
        //
        NSString * str = [NSString stringWithFormat:@"%i",indexPath.section];
        NSMutableDictionary * dic = [_reloadArray objectAtIndex:indexPath.section];
        //         [cell cellBackgroundColor ];
        
        NSArray *list = [dic objectForKey:str];
        
        NSLog(@"%d",indexPath.row-1);
        //
        NSDictionary* category = (NSDictionary*)[list objectAtIndex:indexPath.row-1];
        
        CarWithNameListViewController * nameListView = [[CarWithNameListViewController alloc] init];
        nameListView.barndId = [category objectForKey:@"id"];
//        FenLeiListViewController * listView = [[FenLeiListViewController alloc] init];
        [self.navigationController pushViewController:nameListView animated:YES];
        //self.selectIndex = nil;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert  nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    FenLeiCell *cell = (FenLeiCell *)[_carTypeTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [_carTypeTableView beginUpdates];
    
    int section = self.selectIndex.section;
    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section ];
    NSMutableDictionary * dic =[_reloadArray objectAtIndex:self.selectIndex.section];
    
    NSArray * array = [dic objectForKey:str];
    if (array.count == 0) {
        
//        feiLFunction.delegateCarInfoByPid = self;
        
        array = [_feiLFunction loadCarInfoByPidForReturnArray:[dic objectForKey:@"id"]];
        NSMutableDictionary * mutDic = [[NSMutableDictionary alloc] initWithDictionary:dic];
        
        [mutDic setValue:array forKey:str];
        [_reloadArray replaceObjectAtIndex:self.selectIndex.section withObject:mutDic];
    }
    int contentCount = [array count];
    
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_carTypeTableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_carTypeTableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    
    
	
	[_carTypeTableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_carTypeTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_carTypeTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  fenLeiViewController.m
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "model.h"
#import "fenLeiFunc.h"
#import "fenLeiViewController.h"
#import "CheShenFenLeiViewController.h"

#import "FenLeiListViewController.h"
#import "UINavigationView.h"
#import "GuolvViewController.h"

#import "FenLeiCell.h"
#import "FenLeiCell2.h"
#import "allConfig.h"
@interface fenLeiViewController ()
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@property(nonatomic,strong) IBOutlet UINavigationView * headNav;


//kdjjkdjgkfj
@end

@implementation fenLeiViewController


@synthesize isOpen = _isOpen;
@synthesize selectIndex = _selectIndex;

@synthesize fenLeiTableView = _fenLeiTableView;
@synthesize fenLeiDataArray = _fenLeiDataArray;

@synthesize feiLFunction=_feiLFunction;


@synthesize headNav = _headNav;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:nil tag:1];
//        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"menu_class_press.png"]
//             withFinishedUnselectedImage:[UIImage imageNamed:@"menu_class.png"]];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
       self.selectIndex = nil;
    _feiLFunction = [[fenLeiFunc alloc] init];
    _feiLFunction.delegateGoodsCateByPid = self;
    [_feiLFunction getGoodsCateByPid:@"0"];
    self.navigationController.navigationBarHidden = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    
       _fenLeiTableView.backgroundColor = [UIColor clearColor];
}

- (void) didGoodsCategoryByPidDataSuccess : (id)data
{
    NSLog(@"didGoodsCategoryByPidDataSuccess!");
    self.isOpen = NO;
    
    NSArray *cbData = (NSArray *)data;
    _fenLeiDataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    NSMutableArray  * arry;
    
    for (int i=0; i<cbData.count; i++) {
        if (i==0) {
            arry = [[NSMutableArray alloc] initWithObjects: nil];
            dic = [[NSMutableDictionary alloc] init];
            [dic setValue:@"全部分类" forKey:@"name"];
            [_fenLeiDataArray addObject:dic];
//            continue;
        }
        arry = [[NSMutableArray alloc] init];
        dic = [[NSMutableDictionary alloc] init];
        [dic setValue:arry forKey:[[NSString alloc] initWithFormat:@"%d",i]];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"cat_name"] forKey:@"name"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"cat_id"] forKey:@"cat_id"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"category_img"] forKey:@"category_img"];
        
[dic setValue:[[cbData objectAtIndex:i] objectForKey:@"category_thumb"] forKey:@"category_thumb"];
        
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"keywords"] forKey:@"keywords"];
         [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"original_img"] forKey:@"original_img"];
         [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"parent_id"] forKey:@"parent_id"];
         [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"sort_order"] forKey:@"sort_order"];
        [_fenLeiDataArray addObject:dic];

    }

    [_fenLeiTableView reloadData];
//    _fenLeiTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];

}

- (void) didGoodsCategoryByPidDataFailed : (NSString *)err
{
    NSLog(@"shouYeViewController:didDataFailed!");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self initLeftBarButtonItem];
//    [self initRightBarButtonItem];
    _headNav = [[UINavigationView alloc] init];
    self.navigationItem.leftBarButtonItem=[self setLeftBarButtonItem];
    self.navigationItem.rightBarButtonItem=[self setRightBarButtonItem];
    

}
-(UIBarButtonItem*)setLeftBarButtonItem{
    return [_headNav setWithLeftBarItemWithFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(backToFeileiView) withButtonImage:[UIImage imageNamed:@"topbtn_back_press.png"] withHighlighted:nil withTarget:self];
    
    
    
}
-(UIBarButtonItem*)setRightBarButtonItem{
    return [_headNav setWithRightBarItemWithFrame:CGRectMake(10, 7, 30, 30)  withAction:@selector(leftBarItemClick) withButtonImage:[UIImage imageNamed:@"btn_car.png"] withHighlighted:nil withTarget:self];
    
    
    
}

-(void)leftBarItemClick{
    CheShenFenLeiViewController * cheshenView = [[CheShenFenLeiViewController alloc] init];
    [self.navigationController pushViewController:cheshenView animated:YES];
}

-(void)rightBarItemClick{
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section==0) {
//        NSString * str = [NSString stringWithFormat:@"%i",section];
        NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:section];
        return [dic objectForKey:@"name"];
    }
    return nil;
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
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return [_fenLeiDataArray count]-1;//第零个不显示
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [fenLeiDataArray count];
    if (self.isOpen) {
        if (self.selectIndex.section == section) {
            NSString * rowStr = [NSString stringWithFormat:@"%i",section+1];
            NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:section+1];
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
        NSString * str = [NSString stringWithFormat:@"%i",indexPath.section+1];
        NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:indexPath.section+1];
//         [cell cellBackgroundColor ];

        NSArray *list = [dic objectForKey:str];
     
        NSLog(@"%d",indexPath.row-1);
//
        NSDictionary* category = (NSDictionary*)[list objectAtIndex:indexPath.row-1];
        cell.titleLabel.text = [category objectForKey:@"cat_name"];
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

        NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:indexPath.section+1];
    
        
//        NSMutableArray * array = [[_fenLeiDataArray objectAtIndex:indexPath.section] objectForKey:str];
//        NSLog(@"array=%@",array);

        NSString *name = [dic objectForKey:@"name"];
        cell.titleLabel.text = name;
        cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
        UIImage * image;
         NSString * imageUrl = [[NSString alloc]initWithFormat:@"http://%@/%@",IMAGE_SERVER_ADDR,[dic objectForKey:@"category_thumb"]];
//        NSString *imageurl = [dic objectForKey:@"category_img"];
        if (![imageUrl isEqualToString:@""]) {
            image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
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

        NSString * str = [NSString stringWithFormat:@"%i",indexPath.section+1];
        NSMutableDictionary * dic = [_fenLeiDataArray objectAtIndex:indexPath.section+1];
        //         [cell cellBackgroundColor ];
        
        NSArray *list = [dic objectForKey:str];
        
        NSLog(@"%d",indexPath.row-1);
        //
        NSDictionary* category = (NSDictionary*)[list objectAtIndex:indexPath.row-1];
        
        FenLeiListViewController * listView = [[FenLeiListViewController alloc] initWithNibName:@"FenLeiListViewController" bundle:nil];
        NSLog(@"[category objectForKey:]=%@",[category objectForKey:@"cat_id"]);
        listView.categoryId = [category objectForKey:@"cat_id"];
        [self.navigationController pushViewController:listView animated:YES];
        self.selectIndex = nil;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert  nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    FenLeiCell *cell = (FenLeiCell *)[_fenLeiTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [_fenLeiTableView beginUpdates];
    
    int section = self.selectIndex.section;
    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section +1];
    NSMutableDictionary * dic =[_fenLeiDataArray objectAtIndex:self.selectIndex.section+1];
   
    NSArray * array = [dic objectForKey:str];
    if (array.count == 0) {
        array = [_feiLFunction getGoodsSubCateByPId:[dic objectForKey:@"cat_id"]];
        [dic setValue:array forKey:str];
    }
    int contentCount = [array count];
    
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_fenLeiTableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_fenLeiTableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    

	
	[_fenLeiTableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_fenLeiTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_fenLeiTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

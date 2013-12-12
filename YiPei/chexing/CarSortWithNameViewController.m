//
//  CarSortWithNameViewController.m
//  YiPei
//
//  Created by daichuanning on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "CarSortWithNameViewController.h"
#import "UINavigationView.h"
#import "fenLeiFunc.h"
#import "TypeClickCell.h"
#import "TypeCell.h"
@interface CarSortWithNameViewController ()


@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@property(nonatomic,strong) IBOutlet UINavigationView * headNav;

@end

@implementation CarSortWithNameViewController

@synthesize headNav = _headNav;

@synthesize sortWithNameTableView =_sortWithNameTableView;
@synthesize carModel = _carModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    

    
    feiLFunction = [[fenLeiFunc alloc] init];
    feiLFunction.delegateBrandByCarModel = self;
    [feiLFunction getGoodsBrandByCarModel:_carModel];

    
    _sortWithNameTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
   
    
    //    [_universalTableView reloadData];
    
    
  
    clickArray = [[NSMutableArray alloc] init];
    
    [_sortWithNameTableView reloadData];
    
//    [self initLeftBarButtonItem];
//    [self initRightBarButtonItem];
    
    _headNav = [[UINavigationView alloc] init];
    self.navigationItem.leftBarButtonItem=[self setLeftBarButtonItem];
    self.navigationItem.rightBarButtonItem=[self setRightBarButtonItem];


}
- (void) didGoodsBrandByCarModelDataSuccess : (id)data{
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"品牌" forKey:@"values"];
    [dic setValue:(NSArray*)data forKey:@"key"];
    
    NSMutableArray * tempArray = [[NSMutableArray alloc] init];
    [tempArray addObject:dic];
    sortWithNameArray  = [[NSMutableArray alloc] initWithArray:tempArray];
    
    
    feiLFunction.delegateGoodsCateByPid = self;
    [feiLFunction getGoodsCateByPid:@"0"];
    
    
}
- (void) didGoodsBrandByCarModelDataFailed : (NSString *)err{
    
    
   
    
}

- (void) didGoodsCategoryByPidDataSuccess : (id)data
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"分类" forKey:@"values"];
    [dic setValue:(NSArray *)data forKey:@"key"];
    
    
    NSMutableArray * array =[[NSMutableArray alloc] initWithArray:sortWithNameArray];
    [array addObject:dic];
    dic = nil;
    
    sortWithNameArray = [[NSMutableArray alloc] initWithArray:array];
    array = nil;
    
    
}

- (void) didFilterAttrByCateDataSuccess : (id)data{
    //    typeArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
    NSArray * array = (NSArray *)data;
    
    
}

-(UIBarButtonItem*)setLeftBarButtonItem{
    return [_headNav setWithLeftBarItemWithFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(leftBarItemClick) withButtonImage:[UIImage imageNamed:@"btn_back_press.png"] withHighlighted:nil withTarget:self];
    
    
    
}
-(UIBarButtonItem*)setRightBarButtonItem{
    return [_headNav setWithRightBarItemWithFrame:CGRectMake(260,7, 50, 30) withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_complete.png"] withHighlighted:nil withTarget:self];
    
    
    
}
//-(void)initLeftBarButtonItem{
//    
//    [_headNav initWithLeftBarItemWithTitle:@"" withFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(leftBarItemClick) withButtonImage:[UIImage imageNamed:@"btn_back_press.png"] withHighlighted:nil withTarget:self];
//    
//  
//    
//}
- (void)viewWillAppear:(BOOL)animated
{
    
    //    self.navigationController.navigationBarHidden = NO;
}

-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}
//-(void)initRightBarButtonItem{
//    
//    [_headNav initWithRightBarItemWithTitle:@"" withFrame:CGRectMake(260,7, 50, 30) withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_complete.png"] withHighlighted:nil withTarget:self];
//    
//
//    
//}
-(void)rightBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
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
  
 
        return [sortWithNameArray count];
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
        if (self.isOpen) {
            if (self.selectIndex.section == section) {
                NSMutableDictionary * dic =[sortWithNameArray objectAtIndex:self.selectIndex.section];
                
                NSMutableArray * array =[dic objectForKey:@"key"];
                
                return [array count]+1;;
            }
        }
        return 1;
    
    //    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
        if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0) {
            static NSString *CellIdentifier1 = @"TypeClickCell";
            TypeClickCell *cell = (TypeClickCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
            
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier1 owner:self options:nil] objectAtIndex:0];
                [cell cellClickButton];
                cell.delegate = self;
                UIImageView * backIamge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteColor.png"]];
                cell.backgroundView = backIamge;
                
            }
            if ([self objectIsInOnClickArray:indexPath]!=-1) {
                [cell.clickButton setBackgroundImage:[UIImage imageNamed:@"input_choose_press.png"] forState:UIControlStateNormal];
            }else{
                
                [cell.clickButton setBackgroundImage:[UIImage imageNamed:@"input_choose.png"] forState:UIControlStateNormal];
            }
            if (indexPath.section==0) {
                NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
                
                NSArray *list = [dic objectForKey:@"key"];
                NSDictionary * titleDic = [list objectAtIndex:indexPath.row-1];
                
                cell.indexP = indexPath;
                cell.titleLabel.text = [titleDic objectForKey:@"brand_name"];
                
                
            }else if(indexPath.section==1){
                NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
                
                NSArray *list = [dic objectForKey:@"key"];
                NSDictionary * titleDic = [list objectAtIndex:indexPath.row-1];
                
                cell.indexP = indexPath;
                cell.titleLabel.text = [titleDic objectForKey:@"cat_name"];

            }else{
                NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
                
                NSArray *list = [dic objectForKey:@"key"];
                NSDictionary * titleDic = [list objectAtIndex:indexPath.row-1];
                
                cell.indexP = indexPath;
                NSLog(@"titleDic ==%@",titleDic);
                NSLog(@"[titleDic objectForKey:@" "] ==%@",[titleDic objectForKey:@"attr_value"]);

                cell.titleLabel.text = [titleDic objectForKey:@"attr_value"];
            }
           
            
            return cell;
        }else
        {
            static NSString *CellIdentifier = @"TypeCell";
            TypeCell *cell = (TypeCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            }
            cell.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
            
            NSString * str = [NSString stringWithFormat:@"%i",indexPath.row];
            NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
            
            
            //        NSMutableArray * array = [[_fenLeiDataArray objectAtIndex:indexPath.section] objectForKey:str];
            //        NSLog(@"array=%@",array);
            
            NSString *name = [dic objectForKey:@"values"];
            cell.titleLabel.text = name;
            cell.selectNameLab.text = [self titleInClickArray_Section:indexPath];
            
            cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
            UIImage * image =[UIImage imageNamed:@"bg_brand_hot.png"];
            
            
            //        [cell showImage:image];
            [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
            return cell;
        }
        
}

#pragma mark - Table view delegate
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%i,%i",indexPath.section,indexPath.row);

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
            if (indexPath.section==0) {
                
                NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
                
                NSArray *list = [dic objectForKey:@"key"];
                NSDictionary * titleDic = [list objectAtIndex:indexPath.row-1];
                
                
                [self addObjectInClick:indexPath withTitle:[titleDic objectForKey:@"brand_name"] withObjectId:[titleDic objectForKey:@"brand_id"]];
                 [_sortWithNameTableView reloadData];
                
            }else if (indexPath.section==1) {
                if (isClick==NO) {
                    NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
                    
                    NSArray *list = [dic objectForKey:@"key"];
                    NSDictionary * titleDic = [list objectAtIndex:indexPath.row-1];
                    
                    feiLFunction.delegateFilterAtrrByCate = self;
                    NSArray * array= [feiLFunction getGoodsSubCateByPId:[titleDic objectForKey:@"cat_id"]];
                    [self addObjectInClick:indexPath withTitle:[titleDic objectForKey:@"cat_name"] withObjectId:[titleDic objectForKey:@"cat_id"]];
                    [self afterGetGoodsSubCateByPId:array];
                    [_sortWithNameTableView reloadData];
                    isClick = YES;
                    
                }
                else{
                    
                    NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
                    
                    NSArray *list = [dic objectForKey:@"key"];
                    NSDictionary * titleDic = [list objectAtIndex:indexPath.row-1];
                   
                    NSString * cat_idStr =[titleDic objectForKey:@"cat_id"];
                     NSLog(@"cat_idStr = %@",cat_idStr);
//                    cat_name
                    [self addObjectInClick:indexPath withTitle:[titleDic objectForKey:@"cat_name"] withObjectId:[titleDic objectForKey:@"cat_id"]];
                    feiLFunction.delegateFilterAtrrByCate = self;
                    NSArray * array= [feiLFunction getFilterAttrByCategoryReturnData:cat_idStr];
                    [self afterGetFilterAttrByCategoryReturnData:array];
                    [_sortWithNameTableView reloadData];
                    
                    //g关闭第一层的
                    self.isOpen = NO;
                    [self didSelectCellRowFirstDo:NO   nextDo:NO];
                    self.selectIndex = nil;
                    
                }
                
                
            }else{
                NSMutableDictionary * dic = [sortWithNameArray objectAtIndex:indexPath.section];
                
                NSArray *list = [dic objectForKey:@"key"];
                NSDictionary * titleDic = [list objectAtIndex:indexPath.row-1];
//                att_value
                feiLFunction.delegateFilterAtrrByCate = self;
                [self addObjectInClick:indexPath withTitle:[titleDic objectForKey:@"attr_value"] withObjectId:[titleDic objectForKey:@"goods_attr_id"]];
                
//                NSArray * array= [feiLFunction getFilterAttrByCategoryReturnData:[titleDic objectForKey:@"cat_id"]];
//                [self afterGetGoodsSubCateByPId:array];
                [_sortWithNameTableView reloadData];
                isClick = YES;
            }
        }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)afterGetGoodsSubCateByPId:(NSArray*)array{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    [dic setValue:@"分类" forKey:@"values"];
    [dic setValue:array forKey:@"key"];
    [sortWithNameArray replaceObjectAtIndex:1 withObject:dic];
    
    
}

-(void)afterGetFilterAttrByCategoryReturnData:(NSArray*)array{
    NSMutableArray * tempArray = [[NSMutableArray alloc] initWithArray:sortWithNameArray];
    for (int i = tempArray.count; i<2; i--) {
        NSDictionary * dic = [tempArray objectAtIndex:i];
        [tempArray removeObject:dic];
    }
    sortWithNameArray = tempArray;
    
    for (NSDictionary * dic in array) {
        NSMutableDictionary * addDic = [[NSMutableDictionary alloc] init];
        [addDic setValue:[dic objectForKey:@"name"] forKey:@"values"];
        [addDic setValue:[dic objectForKey:@"values"] forKey:@"key"];
        [sortWithNameArray addObject:addDic];
    }
    
    
}
-(void)typeClickCellDelegate:(NSIndexPath *)indexP{
    
    NSLog(@"indexP ====%@",indexP);
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert  nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    TypeCell *cell = (TypeCell *)[_sortWithNameTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [_sortWithNameTableView beginUpdates];
    
    int section = self.selectIndex.section;
    
    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section ];
    NSMutableDictionary * dic =[sortWithNameArray objectAtIndex:self.selectIndex.section];
    
    NSMutableArray * array =[dic objectForKey:@"key"];
    
    int contentCount = [array count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_sortWithNameTableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_sortWithNameTableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    
    
	
	[_sortWithNameTableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_sortWithNameTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_sortWithNameTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

//p判断是否在数组中
-(NSInteger)objectIsInOnClickArray:(NSIndexPath*)path{
    NSLog(@"clickArray====%@",clickArray);
    NSString * pathKey = [NSString stringWithFormat:@"%i,%i",path.section,path.row];
    for (int i = 0; i < clickArray.count; i ++) {
        NSMutableDictionary * dic = [clickArray objectAtIndex:i];
        if ([[dic objectForKey:@"pathKey"]isEqualToString:pathKey]) {
            return i;
        }
    }
    return -1;
}
-(NSInteger)objectIsInOnClickArray_Section:(NSIndexPath*)path{
    NSString * pathKey = [NSString stringWithFormat:@"%i",path.section];
    for (int i = 0; i < clickArray.count; i ++) {
        NSMutableDictionary * dic = [clickArray objectAtIndex:i];
        if ([[dic objectForKey:@"section"]isEqualToString:pathKey]) {
            return i;
        }
    }
    return -1;
    
}

-(void)addObjectInClick:(NSIndexPath *)path withTitle:(NSString *)title withObjectId:(NSString *)objectId{
    NSInteger index = [self objectIsInOnClickArray_Section:path];
     NSString * pathKey = [NSString stringWithFormat:@"%i%i",path.section,path.row];
    NSString * sectionStr = [NSString stringWithFormat:@"%i",path.section];
    
    if (index >-1) {
        NSMutableDictionary * dic  = [[NSMutableDictionary alloc] init];
        [dic  setValue:pathKey forKey:@"pathKey"];
        [dic setValue:title forKey:@"title"];
        [dic setValue:objectId forKey:@"objectId"];
        [dic setValue:sectionStr forKey:@"section"];
        [clickArray replaceObjectAtIndex:index withObject:dic];
    }else{
        NSMutableDictionary * dic  = [[NSMutableDictionary alloc] init];
        [dic  setValue:pathKey forKey:@"pathKey"];
        [dic setValue:title forKey:@"title"];
        [dic setValue:sectionStr forKey:@"section"];
        [dic setValue:objectId forKey:@"objectId"];
        [clickArray addObject:dic];

    }
    
    
}
-(NSString *)titleInClickArray_Section:(NSIndexPath *)path{
    
    NSInteger index = [self objectIsInOnClickArray_Section:path];
    if (index>-1) {
        NSDictionary * dic = [clickArray objectAtIndex:index];
        return [dic objectForKey:@"title"];
    }
    return @"";
    
}
-(NSString *)titleInClickArray:(NSIndexPath *)path{
    
    NSInteger index = [self objectIsInOnClickArray:path];
    if (index>-1) {
        NSDictionary * dic = [clickArray objectAtIndex:index];
        return [dic objectForKey:@"title"];
    }
    return @"";
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

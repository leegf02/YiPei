//
//  pinPaiViewController.m
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "pinPaiViewController.h"
#import "pinPaiFunc.h"
#import "Utils.h"

#import  "UINavigationView.h"
#import "FenLeiCell.h"
#import  "FenLeiCell2.h"
#import "GuolvViewController.h"
#import "PinpaiFenLeiListViewController.h"
#import "allConfig.h"

@interface pinPaiViewController ()
//<dataGoodsListProcessProtocol>
@property(nonatomic,strong) IBOutlet UINavigationView * headNav;
@property(nonatomic,strong) pinPaiFunc *pinPaiFunction;
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@end




@implementation pinPaiViewController
@synthesize pinPaiFunction =_pinPaiFunction;
@synthesize headNav = _headNav;

@synthesize isOpen = _isOpen;
@synthesize selectIndex = _selectIndex;

@synthesize brandTableView = _brandTableView;

@synthesize brandButton = _brandButton;
@synthesize letterButton = _letterButton;

@synthesize reloadArray =_reloadArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:nil tag:1];
//        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"menu_brand_press.png"]
//             withFinishedUnselectedImage:[UIImage imageNamed:@"menu_brand.png"]];
//        self.tabBarItem = item;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
//      [self initRightBarButtonItem];
    _headNav = [[UINavigationView alloc] init];
//    self.navigationItem.leftBarButtonItem=[self setLeftBarButtonItem];
    self.navigationItem.rightBarButtonItem=[self setRightBarButtonItem];
    [_brandButton setBackgroundImage:[UIImage imageNamed:@"bg_brand_hot_press.png"] forState:UIControlStateNormal];
    
    [_letterButton setBackgroundImage:[UIImage imageNamed:@"bg_brand_sort.png"] forState:UIControlStateNormal];
    
    _pinPaiFunction = [[pinPaiFunc alloc] init];
    _pinPaiFunction.delegateAllBrand = self;
    [_pinPaiFunction  getGoodsAllBrand:nil];
    
}
- (void) didGoodsAllBrandDataSuccess : (id)data{
    
    self.isOpen = NO;
    brandArray = [[NSMutableArray alloc] initWithArray:(NSArray *)data];

    if (isHotOrLetter==NO) {
        _reloadArray = [[NSMutableArray alloc] initWithArray:brandArray];
        
        [_brandTableView reloadData];
        _brandTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    }else{
        _reloadArray = [[NSMutableArray alloc]initWithArray:[brandArray sortedArrayUsingFunction:nickNameSort context:NULL]];
//         _reloadArray = [[NSMutableArray alloc] initWithArray:brandArray];
        [self filterLetterArrayFromDataArray];
        [self filterLetterDicCount];
        
        
        [_brandTableView reloadData];

    }
   
    
}
- (void) didGoodsAllBrandDataFailed : (NSString *)err{
}
- (void) didGoodsCategoryByPidDataSuccess : (id)data
{
    NSLog(@"didGoodsCategoryByPidDataSuccess!");
    self.isOpen = NO;
    
    NSArray *cbData = (NSArray *)data;
    brandArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    NSMutableArray  * arry;
    
    for (int i=0; i<cbData.count; i++) {
        
        arry = [[NSMutableArray alloc] init];
        dic = [[NSMutableDictionary alloc] init];
        [dic setValue:arry forKey:[[NSString alloc] initWithFormat:@"%d",i]];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"cat_name"] forKey:@"name"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"cat_id"] forKey:@"cat_id"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"category_img"] forKey:@"category_img"];
        
        [brandArray addObject:dic];
        
    }
    _reloadArray = [[NSMutableArray alloc] initWithArray:brandArray];
    
    
    
    
    
        [_brandTableView reloadData];
    _brandTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
}
-(UIBarButtonItem*)setRightBarButtonItem{
    return [_headNav setWithRightBarItemWithFrame:CGRectMake(280,7, 30, 30)  withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_cart.png"] withHighlighted:nil withTarget:self];
    
    
    
}
-(IBAction)brandOrLetter:(id)sender{
    UIButton * but = (UIButton *)sender;
    if (but.tag ==1) {
        [_brandButton setBackgroundImage:[UIImage imageNamed:@"bg_brand_hot_press.png"] forState:UIControlStateNormal];
        [_letterButton setBackgroundImage:[UIImage imageNamed:@"bg_brand_sort.png"] forState:UIControlStateNormal];
        isHotOrLetter = NO;
        _pinPaiFunction.delegateAllBrand = self;
        [_pinPaiFunction  getGoodsAllBrand:nil];
    }else{
        [_brandButton setBackgroundImage:[UIImage imageNamed:@"bg_brand_hot.png"] forState:UIControlStateNormal];
        [_letterButton setBackgroundImage:[UIImage imageNamed:@"bg_brand_sort_press.png"] forState:UIControlStateNormal];
        isHotOrLetter = YES;
        _pinPaiFunction.delegateAllBrand = self;
        [_pinPaiFunction  getGoodsAllBrand:@"1"];
    }
}
//-(void)initRightBarButtonItem{
//    
//    [_headNav initWithRightBarItemWithTitle:@"" withFrame:CGRectMake(280,7, 30, 30)  withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_cart.png"] withHighlighted:nil withTarget:self];
//    
//    
//}
-(void)rightBarItemClick{
}
-(void)filterLetterArrayFromDataArray{
    indexTitleCountArray = [[NSMutableArray alloc] init];
    filterLetterArray = [[NSMutableArray alloc] init];
    filterLetterDic = [[NSMutableDictionary alloc] init];
    for (int i = 0;i<_reloadArray.count;i++){
        NSMutableDictionary *dic = [_reloadArray objectAtIndex:i];
        NSString *s = [Utils firstLatter:[dic objectForKey:@"brand_name"]];
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
    NSString * name1 =[u1 objectForKey:@"brand_name"];
    NSString * name2 = [u2 objectForKey:@"brand_name"];
    
    
    return  [name1 localizedCompare:name2];
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
    return [_reloadArray count];//
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView                                                    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
{
    if (isHotOrLetter) {
        return filterLetterArray;//索引的标示 符号 如abcd......

    }
    return nil;
    
}



- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index  // tell table which section corresponds to section title/index (e.g. "B",1))
{
    //    return filterLetterArray.count;
    NSString * count = [indexTitleCountArray objectAtIndex:index];
    int i = [count intValue];
    NSLog(@"i====%i",i);
    return i;
}





- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section    // fixed font style. use custom view (UILabel) if you want something different
{
    
    if (isHotOrLetter) {
        NSString * keyS = [NSString stringWithFormat:@"%i",section];
        
        return [filterLetterDic objectForKey:keyS];
    }
    
    return @"";
    
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
        
        NSMutableDictionary * dic = [_reloadArray objectAtIndex:indexPath.section];
        
        
       
        
        NSString *name = [dic objectForKey:@"brand_name"];
        cell.titleLabel.text = name;
        cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];

        UIImage * image;
        NSString * imageUrl = [[NSString alloc]initWithFormat:@"http://%@/%@",IMAGE_SERVER_ADDR,[dic objectForKey:@"brand_logo"]];
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
        
        
        NSString * str = [NSString stringWithFormat:@"%i",indexPath.section];
        NSMutableDictionary * dic = [_reloadArray objectAtIndex:indexPath.section];
        //         [cell cellBackgroundColor ];
        
        NSArray *list = [dic objectForKey:str];
        
        NSLog(@"%d",indexPath.row-1);
        NSLog(@"dic===%@",dic);
        //
        NSDictionary* category = (NSDictionary*)[list objectAtIndex:indexPath.row-1];
       [category objectForKey:@"cat_name"];
        
        NSMutableDictionary * dic2 =[_reloadArray objectAtIndex:self.selectIndex.section];
     
        
         PinpaiFenLeiListViewController * pinpaiFenlistView = [[PinpaiFenLeiListViewController alloc] init];
        
        pinpaiFenlistView.categoryId = [category objectForKey:@"cat_id"];
        pinpaiFenlistView.brandId = [dic2 objectForKey:@"brand_id"];
        NSLog(@"[category objectForKey:@""] =%@",[category objectForKey:@"cat_id"]);
        [self.navigationController pushViewController:pinpaiFenlistView animated:YES];
        self.selectIndex = nil;
      
        
    
        
        

       
//        self.selectIndex = nil;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert  nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    FenLeiCell *cell = (FenLeiCell *)[_brandTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [_brandTableView beginUpdates];
    
    int section = self.selectIndex.section;
    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section ];
    NSMutableDictionary * dic =[_reloadArray objectAtIndex:self.selectIndex.section];
    
    NSArray * array = [dic objectForKey:str];
    if (array.count == 0) {
        array = [_pinPaiFunction getGoodsCategoryByBrand:[dic objectForKey:@"brand_id"]];
        [dic setValue:array forKey:str];
    }
    int contentCount = [array count];
    
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_brandTableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_brandTableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    
    
	
	[_brandTableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_brandTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_brandTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void) didGoodsCategoryByBrandDataSuccess : (id)data{
}
- (void) didGoodsCategoryByBrandDataFailed : (NSString *)err{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

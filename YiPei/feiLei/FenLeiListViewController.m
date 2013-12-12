//
//  FenLeiListViewController.m
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//


@interface FenLeiListModel : NSString
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * onSale;

@property(nonatomic, strong)NSString * value;

@end


@implementation FenLeiListModel

@synthesize name = _name;
@synthesize onSale = _onSale;
@synthesize value = _value;

@end



@interface FenLeiListSortModel : NSString
@property(nonatomic, strong)NSString * name;


@end


@implementation FenLeiListSortModel

@synthesize name = _name;


@end

#import "GuolvViewController.h"
#import "FenLeiListViewController.h"
#import "UINavigationView.h"
#import "fenLeiFunc.h"

#import "allConfig.h"

#import "ProductDetailsViewController.h"

#define MAINVIEW_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define MAINVIEW_WIDTH [[UIScreen mainScreen]bounds].size.width

@interface FenLeiListViewController ()

@property(nonatomic,strong) IBOutlet UINavigationView * headNav;

@end





@implementation FenLeiListViewController


@synthesize fenLeiListTableView = _fenLeiListTableView;
@synthesize smallTableView = _smallTableView;
@synthesize sortButton = _sortButton;
@synthesize filterButton = _filterButton;


@synthesize blckView = _blckView;


@synthesize headNav = _headNav;
@synthesize categoryId = _categoryId;


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
    
    
   
    
    
    fenLeiListArray = [[NSMutableArray alloc] init];
    FenLeiListModel * model = [[FenLeiListModel alloc ] init ];
    
    feiLFunction = [[fenLeiFunc alloc] init];
    feiLFunction.delegateGoodsList = self;
    [feiLFunction getGoodsSubCateByCategoryId:_categoryId
                                 withCarModel:nil
                               withCarGeneral:nil
                                  withBrandId:nil
                               withFilterAttr:nil
                                withSortPrice:nil
                                 withSortSale:nil
                                    withIndex:nil];
   model.name = @"世博";
    model.onSale = @"世博1";
    model.value = @"100";
//    [fenLeiListArray addObject:model];
    
    _smallTableView.delegate = self;
//    [_fenLeiListTableView reloadData];
    _fenLeiListTableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    
    _smallTableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    _headNav = [[UINavigationView alloc] init];
    self.navigationItem.leftBarButtonItem=[self setLeftBarButtonItem];
//    self.navigationItem.rightBarButtonItem=[self setRightBarButtonItem];
//    [self initLeftBarButtonItem];
    smallTableArray = [[NSMutableArray alloc] initWithObjects:@"默认排序",@"销量：从高到低",@"销量：从低到高",@"价格：从高到低",@"价格：从低到高", nil];
}

-(UIBarButtonItem*)setLeftBarButtonItem{
    return [_headNav setWithLeftBarItemWithFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(backToFeileiView) withButtonImage:[UIImage imageNamed:@"topbtn_back_press.png"] withHighlighted:nil withTarget:self];
    
    
    
}
-(void)initLeftBarButtonItem{
    
//     [_headNav initWithLeftBarItemWithTitle:@"" withFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(backToFeileiView) withButtonImage:[UIImage imageNamed:@"topbtn_back_press.png"] withHighlighted:nil withTarget:self];
    
//    UIButton * leftButton = [[UIButton alloc] init];
//    leftButton.frame = CGRectMake(10,7, 50, 30);
//    
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateNormal];
//    [leftButton addTarget:self action:@selector(backToFeileiView) forControlEvents:UIControlEventTouchDown];
//    UIBarButtonItem * leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton ];
//    
//    
//    
//    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(void)backToFeileiView{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -didGoodsListDelegate

- (void) didGoodsListDataSuccess : (id)data{
    
    fenLeiListArray = [[NSMutableArray alloc] initWithArray:(NSMutableArray *)data];
     [_fenLeiListTableView reloadData];
    
}
- (void) didGoodsListDataFailed : (NSString *)err{
}
-(IBAction)sortClick:(id)sender{
    if (!isSort ) {
        isSort = YES;
//        isFilter = YES;
        
//        FenLeiListSortModel * sortModel = [[FenLeiListSortModel alloc] init];
//        sortModel.name = @"价格";
//        [smallTableArray addObject:sortModel];
        
        [self setBlckViewAndSmarllTable:smallTableArray.count];
        
    }else if(isSort ){
        [self removeBlckViewAndSmarllTable];
        isSort = NO;
    }
    
    
}
-(void)setBlckViewAndSmarllTable:(NSInteger)count{
    
    _blckView.frame = CGRectMake(0, 74, 320, MAINVIEW_HEIGHT-74);
    [self.view addSubview:_blckView];
    _smallTableView.frame = CGRectMake(0, 30, 320, count * 44);
    [self.view addSubview:_smallTableView];
    [_smallTableView reloadData];
}
-(void)removeBlckViewAndSmarllTable{
    if ([self.view.subviews containsObject:_blckView]) {
        [_blckView removeFromSuperview];
    }
    if ([self.view.subviews containsObject:_smallTableView]) {
        [_smallTableView removeFromSuperview];
    }
}
-(void)loadSortData{
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
 
//    self.navigationController.navigationBarHidden = NO;
}
-(IBAction)filterClick:(id)sender{
    GuolvViewController * guolvView = [[GuolvViewController alloc] init];
    guolvView.categoryId = _categoryId;
    
    [self removeBlckViewAndSmarllTable];
    isSort = NO;
    [self.navigationController pushViewController:guolvView animated:YES];
}
-(void)loadFilterData{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_fenLeiListTableView==tableView) {
          return 64;
    }else
        return 44;
  
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//    return @"今日";
//}
//返回TableView中有多少数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return [fenLeiDataArray count];
    if (tableView==_fenLeiListTableView) {
        return [fenLeiListArray count];
    }
    return [smallTableArray count];
    //    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_fenLeiListTableView) {
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor whiteColor];
            imageView.frame = CGRectMake(10, 8, 48, 48);
            imageView.tag = 0x1;
            [cell addSubview:imageView];
            
            UILabel * lab;
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(68, 2, 250, 20);
            lab.backgroundColor = [UIColor clearColor];
            lab.font = [UIFont systemFontOfSize:14];
            lab.tag = 0x2;
            [cell addSubview:lab];
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(68, 22, 250, 20);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x5;
            lab.font = [UIFont systemFontOfSize:14];
            [cell addSubview:lab];
            
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(68, 40, 150, 15);
            lab.backgroundColor = [UIColor clearColor];
            lab.font = [UIFont systemFontOfSize:14];
            lab.tag = 0x3;
            lab.font = [UIFont systemFontOfSize:14.0];
            lab.textColor = [UIColor colorWithRed:98/255.0 green:98/255.0 blue:98/255.0 alpha:1.0];
            [cell addSubview:lab];
            
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(228, 32, 180, 30);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x4;
            lab.textColor = [UIColor colorWithRed:187/255.0 green:54/255.0 blue:60/255.0 alpha:1.0];
            [cell addSubview:lab];
            
        }
//        FenLeiListModel * model = [fenLeiListArray objectAtIndex:indexPath.row];
        NSMutableDictionary * dic = [fenLeiListArray objectAtIndex:indexPath.row];
        
        
        UIImageView * imageV = (UIImageView*)[cell viewWithTag:0x1];
        UILabel * nameLab = (UILabel *)[cell viewWithTag:0x2];
        UILabel * onSaleLab = (UILabel *)[cell viewWithTag:0x3];
        UILabel * valueLab = (UILabel *)[cell viewWithTag:0x4];
        UILabel * formatLab = (UILabel *)[cell viewWithTag:0x5];
        
        NSString * valuestr = [dic objectForKey:@"min_price"];
        NSString * valueSt ;
        if (valuestr.length >1) {
         valueSt = [NSString stringWithFormat:@"¥%@",[dic objectForKey:@"min_price"]];
        }else{
            valueSt = @"¥ 0.0";
//            valueSt = [NSString stringWithFormat:@"¥%@",@"0"];
        }
       
        UIImage * image;
        NSString * imageUrl = [[NSString alloc]initWithFormat:@"http://%@/%@",IMAGE_SERVER_ADDR,[dic objectForKey:@"goods_thumb"]];
        //        NSString *imageurl = [dic objectForKey:@"category_img"];
        if (![imageUrl isEqualToString:@""]) {
            image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
        }
        else
        {
            image =[UIImage imageNamed:@""];
        }
        
        
        
        imageV.image = image;
        NSString * nameS = [NSString stringWithFormat:@"%@",[dic objectForKey:@"goods_name"]];
        NSString * framatStr = [dic objectForKey:@"goods_format"] ;
        formatLab.text = framatStr;
        nameLab.text = nameS;
        NSString * onSale = [dic objectForKey:@"goods_sale_amount"];
        if ([onSale intValue]>=100) {
             onSaleLab.text = onSale;
        }
       
        valueLab.text = valueSt;
        
        return cell;
    }
    else{
        static NSString *CellIdentifier1 = @"CellIdentifier1";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
            
            
            UILabel * lab;
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(60, 7, 250, 30);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x1;
            lab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
            
            [cell addSubview:lab];
            
            
        }
//        FenLeiListModel * model = [smallTableArray objectAtIndex:indexPath.row];
        
        NSString * str = [smallTableArray objectAtIndex:indexPath.row];
        
        UILabel * nameLab = (UILabel *)[cell viewWithTag:0x1];
        NSLog(@"nameLab.text==%@",nameLab.text);
        
        nameLab.text = str;
        
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_smallTableView == tableView) {
        if (indexPath.row==0) {
            [feiLFunction getGoodsSubCateByCategoryId:_categoryId
                                         withCarModel:nil
                                       withCarGeneral:nil
                                          withBrandId:nil
                                       withFilterAttr:nil
                                        withSortPrice:nil
                                         withSortSale:nil
                                            withIndex:nil];
        }else if (indexPath.row==1) {//升序
            [feiLFunction getGoodsSubCateByCategoryId:_categoryId
                                         withCarModel:nil
                                       withCarGeneral:nil
                                          withBrandId:nil
                                       withFilterAttr:nil
                                        withSortPrice:@"1"
                                         withSortSale:nil
                                            withIndex:nil];
            
        }else if (indexPath.row==2) {//降序
            [feiLFunction getGoodsSubCateByCategoryId:_categoryId
                                         withCarModel:nil
                                       withCarGeneral:nil
                                          withBrandId:nil
                                       withFilterAttr:nil
                                        withSortPrice:@"0"
                                         withSortSale:nil
                                            withIndex:nil];
            
            
        }else if (indexPath.row==3) {
            [feiLFunction getGoodsSubCateByCategoryId:_categoryId
                                         withCarModel:nil
                                       withCarGeneral:nil
                                          withBrandId:nil
                                       withFilterAttr:nil
                                        withSortPrice:nil
                                         withSortSale:@"1"
                                            withIndex:nil];
            
            
        }else if (indexPath.row==4) {
            [feiLFunction getGoodsSubCateByCategoryId:_categoryId
                                         withCarModel:nil
                                       withCarGeneral:nil
                                          withBrandId:nil
                                       withFilterAttr:nil
                                        withSortPrice:nil
                                         withSortSale:@"0"
                                            withIndex:nil];
            
            
        }
        [self sortClick:nil];

    }
    else if(_fenLeiListTableView == tableView)
    {
        NSMutableDictionary * dic = [fenLeiListArray objectAtIndex:indexPath.row];
        
        ProductDetailsViewController *pro = [[ProductDetailsViewController alloc] initWithNibName:@"ProductDetailsViewController" bundle:nil];
        pro.pid = [dic objectForKey:@"goods_id"];
        pro.hidesBottomBarWhenPushed=YES;
        [self.navigationController  pushViewController:pro animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

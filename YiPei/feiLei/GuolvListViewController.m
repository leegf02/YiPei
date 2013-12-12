//
//  GuolvDetailViewController.m
//  YiPei
//
//  Created by daichuanning on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//


@interface GuolvDetailModel : NSString
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * letter;

@property(nonatomic, strong)UIImageView * brandImage;

@end


@implementation GuolvDetailModel

@synthesize name = _name;
@synthesize letter = _letter;
@synthesize brandImage = _brandImage;




@end


#import "GuolvListViewController.h"
#import "UINavigationView.h"
#import "SVProgressHUD.h"

#import "allConfig.h"
#define  COLOR_WITH_RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:y/255.0 alpha:1.0]
#import "fenLeiFunc.h"

@interface GuolvListViewController ()<dataFilterAttrByCateProcessProtocol>{
    fenLeiFunc * feiLFunction;
}

@property(nonatomic,strong) IBOutlet UINavigationView * headNav;


@end

@implementation GuolvListViewController

@synthesize  tableHeadView = _tableHeadView;
@synthesize nameLab = _nameLab;
@synthesize detailTableView = _detailTableView;

@synthesize headNav = _headNav;
@synthesize titleArry = _titleArry;

@synthesize categoryId = _categoryId;
@synthesize delegate = _delegate;

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
    
    indexPa = [NSIndexPath indexPathForRow:-1 inSection:0];

//    _tableHeadView.backgroundColor = COLOR_WITH_RGB(45,45,45);
    
   
    _detailTableView.backgroundColor = COLOR_WITH_RGB(45,45,45);
    _detailTableView.separatorColor = COLOR_WITH_RGB(34, 34, 34);
    CGRect frame = _detailTableView.frame;
    _detailTableView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, __MainScreen_Height-100);
    
    datailArray = [[NSMutableArray alloc]init];
    dataArray = [[NSMutableArray alloc]init];
    step = 1;
    
//    GuolvDetailModel * model = [[GuolvDetailModel alloc] init];
//    model.name = @"宝马";
//    model.letter = @"B";
//    model.brandImage = nil;
//    [datailArray addObject:model];
//    [_detailTableView reloadData];
    
    feiLFunction = [[fenLeiFunc alloc] init];
    feiLFunction.delegateCarInfoByPid = self;
    [feiLFunction loadCarInfoByPid:@"0"];
    
    _nameLab.text = [_titleArry objectAtIndex:0];
// _nameLab.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_add1_press.png"]];
    _headNav = [[UINavigationView alloc] init];
    self.navigationItem.leftBarButtonItem=[self setLeftBarButtonItem];
    //    self.navigationItem.rightBarButtonItem=[self setRightBarButtonItem];
    
  
}
-(UIBarButtonItem*)setLeftBarButtonItem{
    return [_headNav setWithLeftBarItemWithFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(back) withButtonImage:[UIImage imageNamed:@"topbtn_back_press.png"] withHighlighted:nil withTarget:self];
    
    
    
}

- (void) didLoadCarInfoByPidDataSuccess : (id)data{
    
    if (step==1) {
        _stepOneArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
        datailArray = _stepOneArray;
    }else if(step==2){
        _stepTwoArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
        datailArray = _stepTwoArray;
    }else if(step==3){
        _stepThreeArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
        datailArray = _stepThreeArray;
    }else if(step==4){
        _stepFourArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
        datailArray = _stepFourArray;
    }
        [_detailTableView reloadData];

}
- (void) didLoadCarInfoByPidDataFailed : (NSString *)err{
    
}
//1
- (void) didGoodsBrandByCateDataSuccess : (id)data{
    _stepOneArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
    datailArray = _stepOneArray;
        [_detailTableView reloadData];
}

- (void) didGoodsBrandByCateDateFailed : (NSString *)err{
    
    
}

//2
- (void) didGoodsCategoryByBrandDataSuccess : (id)data{
    _stepTwoArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
    datailArray = _stepTwoArray;
    [_detailTableView reloadData];
}
- (void) didGoodsCategoryByBrandDataFailed : (NSString *)err{
}

//3
- (void) didGoodsBrandByCarModelDataSuccess : (id)data{
    
    _stepThreeArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
    datailArray = _stepThreeArray;
    [_detailTableView reloadData];
    
}
- (void) didGoodsBrandByCarModelDataFailed : (NSString *)err{
    
}


//4
- (void) didGoodsCategoryByCarModelDataSuccess : (id)data{
    
    _stepFourArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
    datailArray = _stepFourArray;
    [_detailTableView reloadData];
    
}


- (void) didGoodsCategoryByCarModelDataFailed : (NSString *)err{
    
}

-(void)back{
    
    NSLog(@"**********back**********");
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    
//    self.navigationController.navigationBarHidden = NO;
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//上一步
-(IBAction)previous:(id)sender{
    if (step==1) {
//        [SVProgressHUD showErrorWithStatus:@"已经是第一个了"];
        [self dismissModalViewControllerAnimated:YES];
    }
    step --;
    NSString * key = [NSString stringWithFormat:@"%i",step];
    NSMutableDictionary * dic = nil ;
    NSLog(@"%@",dataArray);
   

    for (NSMutableDictionary * dicT in dataArray) {
      
        if ([[dicT objectForKey:@"key"] isEqualToString:key]) {
            dic = [[NSMutableDictionary alloc] initWithDictionary:dicT];
            break;
        }
    }
    if (dic) {
        indexPa = [dic objectForKey:@"path"];
        NSLog(@"index==%i",indexPa.row);
    }
    
    if (step==1) {
        datailArray=_stepOneArray;
    }else if(step==2){
        datailArray=_stepTwoArray;

    }else if(step==3){
        datailArray=_stepThreeArray;

    }else if(step==4){
        datailArray=_stepFourArray;

    }
    [_detailTableView reloadData];
    
//    NSArray * array = [[NSArray alloc] initWithObjects:indexPa, nil];
//    [_detailTableView beginUpdates];
//    [_detailTableView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationNone];
//    [_detailTableView endUpdates];
    
    
}
//返回TableView中有多少数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
       return datailArray.count;


    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIImageView * imageView= [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor whiteColor];
            imageView.frame = CGRectMake(10, 8, 32, 32);
            imageView.tag = 0x1;
            [cell addSubview:imageView];
            
            UILabel * lab;
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(50, 2, 200, 44);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x2;
            lab.textColor = [UIColor whiteColor];
            [cell addSubview:lab];
            
            lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(250, 2, 26, 44);
            lab.backgroundColor = [UIColor clearColor];
            lab.tag = 0x3;
            lab.font = [UIFont systemFontOfSize:14.0];
            lab.textColor = COLOR_WITH_RGB(153, 153, 153);
            
            [cell addSubview:lab];
            
            UIButton * clickBut = [[UIButton alloc] init];
            clickBut.frame = CGRectMake(276, 17, 17, 17);
            clickBut.tag = 0x4;
            
//            clickBut.backgroundColor = [UIColor clearColor];
            clickBut.backgroundColor = [UIColor whiteColor];
//            [clickBut addTarget:self action:@selector() forControlEvents:UIControlEventTouchDown];
             [cell addSubview:clickBut];
            
            
        }
    
        UIImageView * imageV = (UIImageView*)[cell viewWithTag:0x1];
        UILabel * nameLab = (UILabel *)[cell viewWithTag:0x2];
        UILabel * letterLab = (UILabel *)[cell viewWithTag:0x3];
        UIButton * clickbut  = (UIButton *)[cell viewWithTag:0x4];
    NSLog(@"indexPath.row = %i",indexPa.row);
    NSLog(@"indexPath.indexPath.row = %i",indexPath.row);

    if (indexPa.row ==indexPath.row) {
        [clickbut setBackgroundImage:[UIImage imageNamed:@"input_radio_press.png"] forState:UIControlStateNormal];

    }else{
        [clickbut setBackgroundImage:[UIImage imageNamed:@"input_radio.png"] forState:UIControlStateNormal];

    }
    NSDictionary * modelDic = [datailArray objectAtIndex:indexPath.row];
    
    UIImage * image;
    NSString * imageUrl;
    nameLab.text = [modelDic objectForKey:@"name"];
    imageUrl = [[NSString alloc]initWithFormat:@"http://%@/%@",IMAGE_SERVER_ADDR,[modelDic objectForKey:@"logo"]];
    
        image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
    imageV.image = image;
    letterLab.text = [modelDic objectForKey:@"first_letter"];
   
        return cell;
}


-(void)clickButton:(id)sender{
    UITableViewCell * cell;
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0) {
         cell = (UITableViewCell *)[[sender superview] superview];
    }else{
        cell = (UITableViewCell *)[sender superview] ;

    }
    NSIndexPath * indexP = [_detailTableView indexPathForCell:cell];
    
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    UIButton * clickbut  = (UIButton *)[cell viewWithTag:0x4];
    [clickbut setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  indexPa =indexPath;
    
    NSDictionary * dic = [datailArray objectAtIndex:indexPath.row];
    NSString * brandId =[dic objectForKey:@"id"];
     [self removeObjectFromDataArray:indexPath withName:[dic objectForKey:@"name"] withID:[dic objectForKey:@"id"]];
    
    if (step == [_titleArry count]) {
        if ([_delegate respondsToSelector:@selector(didFinishSelectTableview:)]) {
            [_delegate didFinishSelectTableview:dataArray];
        }
        [self dismissModalViewControllerAnimated:YES];
        
        //        [SVProgressHUD showErrorWithStatus:@"已经是最后一步了"];
        return;
    }
    
  
   
    feiLFunction.delegateCarInfoByPid = self;
    [feiLFunction loadCarInfoByPid:brandId];
    
  
    
    _nameLab.text = [_titleArry objectAtIndex:step];
    
   
   

    
    
    step++;
    

}

-(void)removeObjectFromDataArray:(NSIndexPath *)indexPat withName:(NSString*)name withID:(NSString*)objectId{
    BOOL isIn = NO;
    
    for (NSMutableDictionary * dic in dataArray) {
         NSString * key = [NSString stringWithFormat:@"%i",step];
        if ([[dic objectForKey:@"key"]isEqualToString:key]) {
            NSMutableDictionary * mdic = [[NSMutableDictionary alloc] init];
            [mdic setValue:key forKey:@"key"];
            [mdic setValue:indexPa forKey:@"path"];
            [mdic setValue:name forKey:@"name"];
            [mdic setValue:objectId forKey:@"objectId"];
            [dataArray removeObject:dic];
            [dataArray addObject:mdic];
            isIn = YES;
            break;
        }
    }
    if (!isIn) {
        NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
        NSString * key = [NSString stringWithFormat:@"%i",step];
        [dic setValue:key forKey:@"key"];
        [dic setValue:indexPat forKey:@"path"];
        
        [dic setValue:name forKey:@"name"];
        [dic setValue:objectId forKey:@"objectId"];
        [dataArray addObject:dic];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  PinPaiGuoLvViewController.m
//  YiPei
//
//  Created by daichuanning on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "PinPaiGuoLvViewController.h"
#import "GuolvListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "TypeCell.h"
#import "TypeClickCell.h"

#import "UINavigationView.h"
#import "fenLeiFunc.h"



@interface PinPaiGuoLvViewController ()<dataFilterAttrByCateProcessProtocol,GuolvListViewControllerDelegate>{
    fenLeiFunc * feiLFunction;
}
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@property(nonatomic,strong) IBOutlet UINavigationView * headNav;



@end

@implementation PinPaiGuoLvViewController
@synthesize filterScrollView =_filterScrollView;
@synthesize typeTableView = _typeTableView;

@synthesize universalView = _universalView;
@synthesize universalTableView = _universalTableView;

@synthesize isOpen = _isOpen;
@synthesize selectIndex = _selectIndex;

@synthesize choseCarButton = _choseCarButton;
@synthesize universalButton = _universalButton;

@synthesize categoryId =_categoryId;

@synthesize headNav = _headNav;
@synthesize lineView =_lineView;

#define  COLOR_WITH_RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:y/255.0 alpha:1.0]


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
    selectIndexPathArray = [[NSMutableArray alloc] init ];
    
    self.isOpen = NO;
    selectRow = 0;
    
    typeArray = [[NSMutableArray alloc] init];
    
    
    
    _typeTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    _universalTableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    //    [_universalTableView reloadData];
    
    
    universalArray = [[NSMutableArray alloc]initWithObjects:@"选择品牌",@"选择车系",@"选择排量",@"选择年款", nil];
    
    _headNav = [[UINavigationView alloc] init];
    self.navigationItem.leftBarButtonItem=[self setLeftBarButtonItem];
    self.navigationItem.rightBarButtonItem=[self setRightBarButtonItem];
    
    
    feiLFunction = [[fenLeiFunc alloc] init];
    feiLFunction.delegateFilterAtrrByCate = self;
    [feiLFunction getFilterAttrByCategory:_categoryId];
    
    
    //
    //    feiLFunction = [[fenLeiFunc alloc] init];
    //    feiLFunction.delegateFilterAtrrByCate = self;
    //    [feiLFunction getFilterAttrByCategory:_categoryId];
    
    
}

-(void)calculateScrollerViewHeight:(NSArray *)array{
    if (!array) {
        _typeTableView.frame = CGRectMake(0, 0, 320, typeArray.count * 64);
        
        _universalTableView.frame = CGRectMake(0, 58, 320, universalArray.count *58);
        _universalView.frame = CGRectMake(0, typeArray.count * 64 , 320, 60 + universalArray.count * 58);
        
        _universalView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        //    _universalTableView.backgroundColor = [UIColor blackColor];
        //217
        _lineView.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];
        
        CGSize size = CGSizeMake(320, typeArray.count * 64  + 80 + universalArray.count * 58);
        [_filterScrollView setContentSize:size];
        
        
        CGRect frameScroll = _filterScrollView.frame;
        _filterScrollView.frame = CGRectMake(frameScroll.origin.x, frameScroll.origin.y, frameScroll.size.width, frameScroll.size.height);
        
        [_typeTableView reloadData];
        [_universalTableView reloadData];
        
        [self clickChoseCarButtonNotUniversalButtonImage];
        
    }else{
        
        _typeTableView.frame = CGRectMake(0, 0, 320, array.count*45 +typeArray.count * 64);
        
        _universalTableView.frame = CGRectMake(0, 58, 320, universalArray.count *58);
        _universalView.frame = CGRectMake(0,array.count*45 +typeArray.count * 64 , 320, 60 + universalArray.count * 58);
        
        _universalView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        //    _universalTableView.backgroundColor = [UIColor blackColor];
        //217
        _lineView.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];
        
        CGSize size = CGSizeMake(320, typeArray.count * 64 +array.count*45  + 80 + universalArray.count * 58);
        [_filterScrollView setContentSize:size];
        
        
        CGRect frameScroll = _filterScrollView.frame;
        _filterScrollView.frame = CGRectMake(frameScroll.origin.x, frameScroll.origin.y, frameScroll.size.width, frameScroll.size.height);
        
        [_typeTableView reloadData];
        [_universalTableView reloadData];
        
        [self clickChoseCarButtonNotUniversalButtonImage];
        
        
        
    }
    
}

-(UIBarButtonItem*)setLeftBarButtonItem{
    return [_headNav setWithLeftBarItemWithFrame:CGRectMake(10, 7, 50, 30)  withAction:@selector(leftBarItemClick) withButtonImage:[UIImage imageNamed:@"btn_back_press.png"] withHighlighted:nil withTarget:self];
    
    
    
}
-(UIBarButtonItem*)setRightBarButtonItem{
    return [_headNav setWithRightBarItemWithFrame:CGRectMake(260,7, 50, 30) withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_complete.png"] withHighlighted:nil withTarget:self];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    //    self.navigationController.navigationBarHidden = NO;
}

-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)rightBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickChoseCarButtonNotUniversalButtonImage{
    [_choseCarButton setImage:[UIImage imageNamed:@"btn_car_choose_press.png"] forState:UIControlStateNormal];
    [_universalButton setImage:[UIImage imageNamed:@"btn_car_ general.png"] forState:UIControlStateNormal];
}
-(void)clickUniversalButtonImageNotChoseCarButtonNot{
    [_choseCarButton setImage:[UIImage imageNamed:@"btn_car_choose.png"] forState:UIControlStateNormal];
    [_universalButton setImage:[UIImage imageNamed:@"btn_car_ general_press.png"] forState:UIControlStateNormal];
}
-(IBAction)clickChoseCarButton:(id)sender{
    [self clickChoseCarButtonNotUniversalButtonImage];
    _universalTableView.hidden = NO;
    
}
-(IBAction)clickUniversalButton:(id)sender{
    [self clickUniversalButtonImageNotChoseCarButtonNot];
    _universalTableView.hidden = YES;
    
}
- (void) didGoodsBrandByCateDataSuccess : (id)data{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"100" forKey:@"id"];
    [dic setValue:@"品牌" forKey:@"name"];
    [dic setValue:(NSArray *)data forKey:@"values"];
    
    
    [typeArray addObject:dic];
    
    //    feiLFunction = [[fenLeiFunc alloc] init];
    
   
}

- (void) didGoodsBrandByCateDateFailed : (NSString *)err{
    
    
}

- (void) didFilterAttrByCateDataSuccess : (id)data{
    //    typeArray = [[NSMutableArray alloc] initWithArray:(NSArray*)data];
    NSArray * array = (NSArray *)data;
    
    for (int i = 0; i<array.count; i ++) {
        NSMutableDictionary * dic = [array objectAtIndex:i ];
        [typeArray addObject:dic];
    }
    
    NSLog(@"tamarray = %@",typeArray);
    [self calculateScrollerViewHeight:nil];
}
- (void) didFilterAttrByCateDataFailed : (NSString *)err{
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_typeTableView) {
        if (self.isOpen) {
            if (self.selectIndex.section == indexPath.section) {
                if(indexPath.row==0){
                    return 64;
                }
                return 45;;
            }
        }
        
        return 64;
    }else{
        return 58;
    }
    
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView ==_typeTableView) {
        NSLog(@"typeArray.count==%i",typeArray.count);
        return [typeArray count];
    }else
        return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==_typeTableView) {
        if (self.isOpen) {
            if (self.selectIndex.section == section) {
                //                NSString * rowStr = [NSString stringWithFormat:@"%i",section];
                NSMutableDictionary * dic = [typeArray objectAtIndex:section];
                NSMutableArray * array = [dic objectForKey:@"values"];
                NSLog(@"array.count = %i",array.count);
                return [array count]+1;;
            }
        }
        return 1;
    }else
        
        return universalArray.count;
    
    //    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==_typeTableView) {
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
            
            NSMutableDictionary * dic = [typeArray objectAtIndex:indexPath.section];
            
            NSArray *list = [dic objectForKey:@"values"];
            
            cell.indexP = indexPath;
            NSMutableDictionary * attr_valueDic = [list objectAtIndex:indexPath.row-1];
            
            cell.titleLabel.text = [attr_valueDic objectForKey:@"attr_value"];
            NSMutableDictionary * selectDic =[self dataInSelectIndexPathArray:indexPath];
            
            if (selectDic ) {
                NSString * str =[selectDic objectForKey:@"clickRow"];
                NSString * indexPathRowStr = [NSString stringWithFormat:@"%i%i",indexPath.section,indexPath.row];
                if ([str isEqualToString:indexPathRowStr]) {
                    [cell.clickButton setBackgroundImage:[UIImage imageNamed:@"input_choose_press.png"] forState:UIControlStateNormal];
                }
            }
            return cell;
        }else
        {
            
            
            static NSString *CellIdentifier = @"TypeCell";
            //           NSString * CellIdentifier = [NSString stringWithFormat:@"TypeCell%i%i",indexPath.section,indexPath.row];
            TypeCell *cell = (TypeCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            }
            cell.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
            
            NSString * str = [NSString stringWithFormat:@"%i",indexPath.row];
            NSLog(@"typeArray = %@",typeArray);
            
            NSMutableDictionary * dic = [typeArray objectAtIndex:indexPath.section];
            
            
            //        NSMutableArray * array = [[_fenLeiDataArray objectAtIndex:indexPath.section] objectForKey:str];
            //        NSLog(@"array=%@",array);
            
            NSString *name = [dic objectForKey:@"name"];
            cell.titleLabel.text = name;
            cell.titleLabel.textColor = [UIColor colorWithRed:129/255.0 green:129/255.0 blue:129/255.0 alpha:1.0];
            UIImage * image =[UIImage imageNamed:@"bg_brand_hot.png"];
            
            
            NSMutableDictionary * selectDic =[self dataInSelectIndexPathArray:indexPath];
            NSLog(@"selectDic====%@",selectDic);
            
            if (selectDic ) {
                NSString * str =[selectDic objectForKey:@"selectName"];
                cell.selectNameLab.text = str;
                cell.selectNameLab.backgroundColor = COLOR_WITH_RGB(239, 198, 70);
                
                
            }else{
                cell.selectNameLab.text = @"";
                cell.selectNameLab.backgroundColor = [UIColor clearColor];
            }
            
            //        [cell showImage:image];
            [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
            return cell;
        }
    }else{
        
        static NSString *CellIdentifier = @"UITableViewCell";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIView * cellBackView = [[UIView alloc]initWithFrame:CGRectMake(10, 9, 300, 38)];
            cellBackView.tag = 0x1;
            
            [cell addSubview:cellBackView];
            
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(23, 13, 200, 30)];
            lab.textColor = COLOR_WITH_RGB(51, 51, 51);
            lab.tag = 0x2;
            lab.backgroundColor = [UIColor clearColor];
            lab.font = [UIFont systemFontOfSize:18];
            [cell addSubview:lab];
            
            UIButton * button = [[UIButton alloc] init];
            //            button.tag = 0x3;
            //            [button set ]
            
            UIImageView * addImage = [[UIImageView alloc] initWithFrame:CGRectMake(285, 22, 14, 14)];
            addImage.tag = 0x3;
            [cell addSubview:addImage];
            
        }
        
        
        UIView * cellBackView = (UIView*)[cell viewWithTag:0x1];
        UILabel * nameLab = (UILabel *)[cell viewWithTag:0x2];
        UIImageView * addIamge = (UIImageView *)[cell viewWithTag:0x3];
        [self setBordForView:cellBackView withBorder:1 withColor:COLOR_WITH_RGB(202, 202, 202)];
        [self setViewCornerRadius:cellBackView withCornerRadius:6];
        if (didSelectArray) {
            nameLab.text=  [self objectInDidSelectArray:indexPath];
            cellBackView.backgroundColor = [UIColor whiteColor];
            
            addIamge.image = [UIImage imageNamed:@"icon_add1_press.png"];
            
        }else{
            nameLab.text = [universalArray objectAtIndex:indexPath.row];
            if (indexPath.row ==selectRow) {
                cellBackView.backgroundColor = [UIColor whiteColor];
                
                addIamge.image = [UIImage imageNamed:@"icon_add1_press.png"];
            }else
                addIamge.image = [UIImage imageNamed:@"icon_add1.png"];
            
            
        }
        
        
        
        
        return cell;
    }
    
}
-(NSString*)objectInDidSelectArray:(NSIndexPath *)path{
    
    for (NSMutableDictionary * dic in didSelectArray) {
        NSString * key = [NSString stringWithFormat:@"%i",path.row+1];
        if ([[dic objectForKey:@"key"]isEqualToString:key]) {
            
            return [dic objectForKey:@"name"];
            
            break;
        }
    }
    return nil;
    
    
}
-(NSMutableDictionary *)dataInSelectIndexPathArray:(NSIndexPath *)indexPath{
    
    for (NSMutableDictionary * dic in selectIndexPathArray) {
        NSString * str =[dic objectForKey:@"indexPathSection"];
        NSString * sectionStr = [NSString stringWithFormat:@"%i",indexPath.section];
        if ([str isEqualToString:sectionStr])
        {
            //            break;
            return dic;
        }
    }
    return nil;
}
-(void)setBordForView:(UIView*)view withBorder:(NSInteger)border withColor:(UIColor*)color{
    //设置layer
    CALayer *layer=[view layer];
    //是否设置边框以及是否可见
    [layer setMasksToBounds:YES];
    
    //设置边框线的宽
    
    [layer setBorderWidth:border];
    //设置边框线的颜色
    [layer setBorderColor:[color CGColor]];
}

-(void)setViewCornerRadius:(UIView *)view withCornerRadius:(NSInteger)radius{
    view.layer.cornerRadius = radius;
    view.layer.masksToBounds = YES;
}
#pragma mark - Table view delegate
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_typeTableView) {
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
            NSLog(@"dian");
            [self didSelectTableViewIndexPath:indexPath];
            
        }
        
    }else{
        
        if (indexPath.row==0) {
            GuolvListViewController * detaileView = [[GuolvListViewController alloc] init];
            detaileView.titleArry = universalArray;
            detaileView.categoryId = _categoryId;
            detaileView.delegate = self;
            //        [self.navigationController pushViewController:detaileView animated:YES];
            [self presentModalViewController:detaileView animated:YES];
        }
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void )didFinishSelectTableview:(NSMutableArray *)data{
    didSelectArray = [[NSMutableArray alloc] initWithArray:data];
    
    [_universalTableView reloadData];
}
-(void)didSelectTableViewIndexPath:(NSIndexPath *)indexPa{
    
    if ([self dataInSelectIndexPathArray:indexPa]) {
        [self hadDidSelectTableViewIndexPath:indexPa];
    }else{
        [self hadNoDidSelectTableViewIndexPath:indexPa];
    }
    
    [_typeTableView reloadData];
}

-(void)hadNoDidSelectTableViewIndexPath:(NSIndexPath *)indexPa{
    NSString * str = [NSString stringWithFormat:@"%i",indexPa.section ];
    NSMutableDictionary * dic =[typeArray objectAtIndex:indexPa.section];
    
    NSMutableArray * array =[dic objectForKey:@"values"];
    NSLog(@"array = %@",array);
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:indexPa.section];
    
    TypeCell * typeCe =(TypeCell *) [_typeTableView cellForRowAtIndexPath:indexPath];
    NSDictionary * textDic = [array objectAtIndex:indexPa.row-1];
    typeCe.selectNameLab.text = [textDic objectForKey:@"attr_value"];
    
    typeCe.selectNameLab.backgroundColor = COLOR_WITH_RGB(186, 145, 17);
    
    TypeClickCell * typeclickCe =(TypeClickCell *) [_typeTableView cellForRowAtIndexPath:indexPa];
    [typeclickCe.clickButton setBackgroundImage:[UIImage imageNamed:@"input_choose_press.png"] forState:UIControlStateNormal];
    
    NSMutableDictionary * mutableDic = [[NSMutableDictionary alloc] init];
    
    [mutableDic setValue:[textDic objectForKey:@"attr_value"] forKey:@"selectName"];
    NSString * indexpathRowStr = [NSString stringWithFormat:@"%i%i",indexPa.section,indexPa.row];
    NSString * indexpathSectionStr = [NSString stringWithFormat:@"%i",indexPa.section];
    
    [mutableDic setValue:indexpathRowStr forKey:@"clickRow"];
    [mutableDic setValue:indexpathSectionStr forKey:@"indexPathSection"];
    
    [selectIndexPathArray addObject:mutableDic];
    
    NSLog(@"selectIndexPathArray=%@",selectIndexPathArray);
}

-(void)hadDidSelectTableViewIndexPath:(NSIndexPath *)indexPa{
    
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:indexPa.section];
    
    TypeCell * typeCe =(TypeCell *) [_typeTableView cellForRowAtIndexPath:indexPath];
    typeCe.selectNameLab.text = @"";
    
    typeCe.selectNameLab.backgroundColor =[UIColor clearColor];
    
    TypeClickCell * typeclickCe =(TypeClickCell *) [_typeTableView cellForRowAtIndexPath:indexPa];
    [typeclickCe.clickButton setBackgroundImage:[UIImage imageNamed:@"input_choose.png"] forState:UIControlStateNormal];
    
    
    NSMutableDictionary * dic = [self dataInSelectIndexPathArray:indexPa];
    [selectIndexPathArray removeObject:dic];
}
-(void)typeClickCellDelegate:(NSIndexPath *)indexP{
    
    NSLog(@"indexP ====%@",indexP);
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert  nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    TypeCell *cell = (TypeCell *)[_typeTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [_typeTableView beginUpdates];
    
    int section = self.selectIndex.section;
    
    //    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section ];
    NSMutableDictionary * dic =[typeArray objectAtIndex:self.selectIndex.section];
    
    NSMutableArray * array =[dic objectForKey:@"values"];
    //    NSLog(@"array======%@",array);
    int contentCount = [array count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_typeTableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
        [self calculateScrollerViewHeight:array];
    }
	else
    {
        [_typeTableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
        [self calculateScrollerViewHeight:nil];
    }
    
    
	
	[_typeTableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_typeTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_typeTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

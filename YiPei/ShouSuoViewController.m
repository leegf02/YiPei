//
//  ShouSuoViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "ShouSuoViewController.h"
#import "GuoWuCheViewController.h"

#import "ProductDetailsViewController.h"

@interface ShouSuoViewController ()

@end

@implementation ShouSuoViewController
@synthesize shouSuoImage=_shouSuoImage;
@synthesize textfield=_textfield;
@synthesize quxiaoBT=_quxiaoBT;
@synthesize tableview=_tableview;

@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;
//@synthesize keytableview=_keytableview;
@synthesize resArray=_resArray;
//@synthesize keyArray=_keyArray;

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
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"淘汽档口";
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 30, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
    
    [_quxiaoBT setImage:[UIImage imageNamed:@"btn_cancl.png"] forState:UIControlStateNormal];
    [_quxiaoBT setImage:[UIImage imageNamed:@"btn_cancl_press.png"] forState:UIControlStateHighlighted];
    
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.separatorColor=[UIColor darkGrayColor];
    _tableview.rowHeight=45;
    
    _textfield.delegate=self;
    

}



- (BOOL)textField:(UITextField *)aTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
	newString = nil;
	if (range.length == 0) {
		newString = [aTextField.text stringByAppendingString:string];
	} else {
		NSString *headPart = [aTextField.text substringToIndex:range.location];
		NSString *tailPart = [aTextField.text substringFromIndex:range.location+range.length];
		newString = [NSString stringWithFormat:@"%@%@",headPart,tailPart];
	}
    return  YES;
}

- (IBAction)editingChanged:(id)sender
{
    UITextField *tmpTextField = (UITextField *)sender;
    NSString *spacestring =[tmpTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(![newString isEqualToString:spacestring])
    {
        NSLog(@"%@,%@",newString,spacestring);
        
        searchFunc *search = [[searchFunc alloc] init];
        [search getSearchGood:_textfield.text];
    }
}



- (void) didSearchGoodsDataSuccess : (id)data;
{
    _resArray = (NSMutableArray *)data;
    [_tableview reloadData];
}
- (void) didSearchGoodsDataFailed : (NSString *)err
{
    
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


-(IBAction)clickQuXiaoBT:(id)sender{
    _textfield.text=@"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textfield resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
{

    return  YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_resArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier =[NSString stringWithFormat: @"mycell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
    }
    cell.textLabel.font=[UIFont systemFontOfSize:15.0f];
    cell.textLabel.textColor=[UIColor darkGrayColor];

    cell.textLabel.text=[[_resArray objectAtIndex:indexPath.row] objectForKey:@"goods_name"];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductDetailsViewController *pvd = [[ProductDetailsViewController  alloc] initWithNibName:@"ProductDetailsViewController" bundle:nil];
    pvd.pid = [[_resArray objectAtIndex:indexPath.row] objectForKey:@"goods_id"];
    pvd.hidesBottomBarWhenPushed=YES;

    [self.navigationController pushViewController:pvd animated:YES];

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

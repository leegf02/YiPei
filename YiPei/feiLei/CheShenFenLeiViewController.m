//
//  GuolvDetialViewController.m
//  YiPei
//
//  Created by daichuanning on 13-11-28.
//  Copyright (c) 2013年 lee. All rights reserved.
//



@interface CheShenFenLeiModel : NSString
@property(nonatomic, strong)NSString * name;

@property(nonatomic, strong)NSString * value;

@end


@implementation CheShenFenLeiModel

@synthesize name = _name;
@synthesize value = _value;

@end



#import "CheShenFenLeiViewController.h"

#import "UINavigationView.h"
@interface CheShenFenLeiViewController ()
@property(nonatomic,strong) IBOutlet UINavigationView * headNav;

@end

@implementation CheShenFenLeiViewController


@synthesize popupMenu = _popupMenu;
@synthesize carImageView = _carImageView;

@synthesize buttonArray = _buttonArray;

@synthesize carButton = _carButton;

@synthesize suvButton = _suvButton;

@synthesize headNav = _headNav;

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
    for (UIButton *but in  _buttonArray) {
        [but setBackgroundImage:[UIImage imageNamed:@"icon_add.png"] forState:UIControlStateNormal];
        [but setBackgroundImage:[UIImage imageNamed:@"icon_add_press.png"] forState:UIControlStateHighlighted];
    }
     isCarOrSuv = NO;
    
    [_carButton setBackgroundImage:[UIImage imageNamed:@"bg_class1_press.png"] forState:UIControlStateNormal];

    [_suvButton setBackgroundImage:[UIImage imageNamed:@"bg_class2.png"] forState:UIControlStateNormal];

    
    dataArray = [[NSMutableArray alloc] init];
    CheShenFenLeiModel * model ;
    model = [[CheShenFenLeiModel alloc] init];
    model.name = @"油";
    model.value = @"0";
    [dataArray addObject:model];
    
    model = [[CheShenFenLeiModel alloc] init];
    model.name = @"油1";
    model.value = @"1";
    [dataArray addObject:model];
    
    model = [[CheShenFenLeiModel alloc] init];
    model.name = @"油2";
    model.value = @"2";
    [dataArray addObject:model];
    
    model = [[CheShenFenLeiModel alloc] init];
    model.name = @"油3";
    model.value = @"3";
    [dataArray addObject:model];
    
    nameArray = [[NSMutableArray alloc]initWithObjects:@"油", @"油1", @"油2", @"油3", @"油4", nil];
    valueArray = [[NSMutableArray alloc]initWithObjects:@"0", @"1", @"2", @"3", @"4", nil];
    
    
    _headNav = [[UINavigationView alloc] init];
    self.navigationItem.leftBarButtonItem=[self setLeftBarButtonItem];
    self.navigationItem.rightBarButtonItem=[self setRightBarButtonItem];
    
    
// [_headNav initWithLeftBarItemWithTitle:@"" withFrame:CGRectMake(10, 7, 30, 30)  withAction:@selector(leftBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_list.png"] withHighlighted:nil  withTarget:self];
//    
//     [_headNav initWithRightBarItemWithTitle:@"" withFrame:CGRectMake(280,7, 30, 30)  withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_cart.png"] withHighlighted:nil withTarget:self];
}
-(UIBarButtonItem*)setLeftBarButtonItem{
    
    return  [_headNav setWithLeftBarItemWithFrame:CGRectMake(10, 7, 30, 30)  withAction:@selector(leftBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_list.png"] withHighlighted:nil  withTarget:self];
}

-(UIBarButtonItem*)setRightBarButtonItem{
    
    return  [_headNav setWithLeftBarItemWithFrame:CGRectMake(280,7, 30, 30)  withAction:@selector(rightBarItemClick) withButtonImage:[UIImage imageNamed:@"topbtn_cart.png"] withHighlighted:nil withTarget:self];
}
-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)rightBarItemClick{
    
}
-(IBAction)carOrSuvClick:(id)sender{
    UIButton * but = (UIButton *)sender;
    if (but.tag ==1) {
        [_carButton setBackgroundImage:[UIImage imageNamed:@"bg_class1_press.png"] forState:UIControlStateNormal];
        [_suvButton setBackgroundImage:[UIImage imageNamed:@"bg_class2.png"] forState:UIControlStateNormal];
        _carImageView.image = [UIImage imageNamed:@"pic_car1.png"];
        isCarOrSuv = NO;
    }else{
       [_suvButton setBackgroundImage:[UIImage imageNamed:@"bg_class2_press.png"] forState:UIControlStateNormal];
        [_carButton setBackgroundImage:[UIImage imageNamed:@"bg_class1.png"] forState:UIControlStateNormal];
        _carImageView.image = [UIImage imageNamed:@"pic_car2.png"];

        isCarOrSuv = YES;
    }
}
- (void)popupMenuController:(LKPopupMenuController*)popupMenuController didSelectRowAtIndex:(NSUInteger)index
{
   
        CheShenFenLeiModel * model = [dataArray objectAtIndex:index];
    
}


#pragma mark -
#pragma mark Actions
- (void)_popupAt:(CGPoint)location arrangementMode:(LKPopupMenuControllerArrangementMode)arrangementMode
{
    
    if (_popupMenu.popupmenuVisible) {
        [_popupMenu dismiss];
    } else {
        if (_popupMenu == nil) {
            _popupMenu = [LKPopupMenuController popupMenuControllerOnView:self.view];
            _popupMenu.delegate = self;
            _popupMenu.arrangementMode= LKPopupMenuControllerArrangementModeNoTriangle;
        }
        
        
        
        LKPopupMenuAppearance* appearance = [LKPopupMenuAppearance defaultAppearanceWithSize:LKPopupMenuControllerSizeSmall
                                                                                       color:LKPopupMenuControllerColorBlack];
         _popupMenu.autoresizeEnabled = NO;
         _popupMenu.autocloseEnabled = YES;
         _popupMenu.bounceEnabled = YES;
         _popupMenu.multipleSelectionEnabled = NO;
//         _popupMenu.arrangementMode = arrangementMode;
         _popupMenu.animationMode = YES;
         _popupMenu.modalEnabled = YES;
        
        
        
        
        // appearance.menuBackgroundColor = [UIColor grayColor];
        
        appearance.shadowEnabled = YES;
        appearance.triangleEnabled = YES;
        appearance.separatorEnabled = YES;
        appearance.outlineEnabled = YES;
        appearance.titleHighlighted = YES;
        
         _popupMenu.appearance = appearance;
        _popupMenu.appearance.listHeight = 200.0;
        _popupMenu.textList = nameArray;
        _popupMenu.title = titleStr;
        
        [ _popupMenu presentPopupMenuFromLocation:location];
    }
}
- (IBAction)popup:(id)sender {
    if ([sender tag]==1) {
        titleStr = @"油";
       
        CGSize size = ((UIButton*)sender).frame.size;
        CGPoint origin = ((UIButton*)sender).frame.origin;
        CGPoint location = CGPointMake(origin.x+32,
                                       origin.y + size.height+64);
        //在次函数之前要重新读取数据，并且都放在同一个数组中
        
        [self _popupAt:location arrangementMode:LKPopupMenuControllerArrangementModeDown];
        
        
    }else if([sender tag]==2){
        
        titleStr = @"车轮";

        CGSize size = ((UIButton*)sender).frame.size;
        CGPoint origin = ((UIButton*)sender).frame.origin;
        CGPoint location = CGPointMake(origin.x+32,
                                       origin.y + size.height+64);
        [self _popupAt:location arrangementMode:LKPopupMenuControllerArrangementModeDown];
        
    }else if([sender tag]==3){
        titleStr = @"装饰";

        CGSize size = ((UIButton*)sender).frame.size;
        CGPoint origin = ((UIButton*)sender).frame.origin;
        CGPoint location = CGPointMake(origin.x+32,
                                       origin.y + size.height+64);
        [self _popupAt:location arrangementMode:LKPopupMenuControllerArrangementModeDown];
        
    }else if([sender tag]==4){
        titleStr = @"玻璃";

        CGSize size = ((UIButton*)sender).frame.size;
        CGPoint origin = ((UIButton*)sender).frame.origin;
        CGPoint location = CGPointMake(origin.x+32,
                                       origin.y + size.height+64);
        [self _popupAt:location arrangementMode:LKPopupMenuControllerArrangementModeDown];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

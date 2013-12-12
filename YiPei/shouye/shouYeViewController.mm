//
//  shouYeViewController.m
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "model.h"
#import "todayDiscountFunc.h"
#import "ProductDetailsViewController.h"

#import "GuoWuCheViewController.h"

#import "MBProgressHUD.h"
#import "Tesseract.h"
#import <MultiFormatReader.h>
#import "shouYeViewController.h"

#import "scannerVinViewController.h"
#import "ZiDingYiJianPanViewController.h"
#import "registerViewController.h"
#import "ShiYongShuoMingViewController.h"
#import "ZhiFuBangZhuViewController.h"
#import "LianXiWMenViewController.h"

#import "JinRiFaBuViewController.h"

#import "StrikeThroughLabel.h"
#import "allConfig.h"

#import "UIHTTPImageView.h"

#import "ShouSuoViewController.h"

#import "ShiftCityViewController.h"
#import "userDataManager.h"
#import "YongHuZhongXinViewController.h"

//#import "JianCeGengXinViewController.h"


@interface shouYeViewController ()

@end

@implementation shouYeViewController
@synthesize todayDiscount=_todayDiscount;
@synthesize tableview=_tableview;
@synthesize personalInfoView=_personalInfoView;
@synthesize searchView=_searchView;

@synthesize shouyeView=_shouyeView;
@synthesize shouyeBT=_shouyeBT;
@synthesize shouyeImage=_shouyeImage;
@synthesize shouyeLabel=_shouyeLabel;
@synthesize shouyeArrow=_shouyeArrow;

@synthesize useBT=_useBT;
@synthesize useNameLabel=_useNameLabel;
@synthesize useImage=_useImage;
@synthesize useArrow=_useArrow;

@synthesize cartBT=_cartBT;
@synthesize cartLabel=_cartLabel;
@synthesize cartArow=_cartArow;
@synthesize cartImage=_cartImage;
@synthesize shoppingCartNumLabel=_shoppingCartNumLabel;
@synthesize shoppingCartView=_shoppingCartView;

@synthesize InfoView=_InfoView;
@synthesize payBT=_payBT;
@synthesize payLabel=_payLabel;
@synthesize payArow=_payArow;
@synthesize payImage=_payImage;

@synthesize instructionsBT=_instructionsBT;
@synthesize instructionsLabel=_instructionsLabel;
@synthesize instructionsArow=_instructionsArow;
@synthesize instructionsImage=_instructionsImage;

@synthesize contactBT=_contactBT;
@synthesize contactLabel=_contactLabel;
@synthesize contactArow=_contactArow;
@synthesize contactImage=_contactImage;

@synthesize updateBT=_updateBT;
@synthesize updateLabel=_updateLabel;
@synthesize updateArow=_updateArow;
@synthesize updateImage=_updateImage;


@synthesize cityBT=_cityBT;
@synthesize cityArrow=_cityArrow;
@synthesize cityImage=_cityImage;
@synthesize cityLabel=_cityLabel;

@synthesize debtArrow=_debtArrow;
@synthesize debtBT=_debtBT;
@synthesize debtImage=_debtImage;
@synthesize debtLabel=_debtLabel;

@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;

@synthesize todayNewData=_todayNewData;
@synthesize todayDisCountArray =_todayDisCountArray;

@synthesize scrollView=_scrollView;

//@synthesize scanner=_scanner;
@synthesize progressHud=_progressHud;
@synthesize tesseract= _tesseract;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // Custom initialization
        // Set up the tessdata path. This is included in the application bundle
        // but is copied to the Documents directory on the first run.
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentPath = ([documentPaths count] > 0) ? [documentPaths objectAtIndex:0] : nil;
        
        NSString *dataPath = [documentPath stringByAppendingPathComponent:@"tessdata"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // If the expected store doesn't exist, copy the default store.
        if (![fileManager fileExistsAtPath:dataPath]) {
            // get the path to the app bundle (with the tessdata dir)
            NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
            NSString *tessdataPath = [bundlePath stringByAppendingPathComponent:@"tessdata"];
            if (tessdataPath) {
                [fileManager copyItemAtPath:tessdataPath toPath:dataPath error:NULL];
            }
        }
        
        setenv("TESSDATA_PREFIX", [[documentPath stringByAppendingString:@"/"] UTF8String], 1);
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
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 30, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_intercalate.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_intercalate_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickPersonalInfoBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 30, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
    
    _shouyeView.layer.cornerRadius = 6;
    _InfoView.layer.cornerRadius=6;
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.rowHeight=64;
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.hidden=NO;
    _searchView.hidden=NO;
    _personalInfoView.hidden=YES;
    
    [_scrollView addSubview:_personalInfoView];
    [_scrollView setFrame:CGRectMake(0, 0, 320, __MainScreen_Height-88)];
    _scrollView.contentSize = CGSizeMake(320, 568);
//    [_scrollView setContentSize:CGSizeMake(320, 440)];
    _scrollView.hidden=YES;

    _todayDiscount = [[todayDiscountFunc alloc] init];
    _todayDiscount.delegate = self;
    [_todayDiscount getTodayDiscount:@"0" sortPrice:@"0" sortSale:@"0"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initPressview];
}
- (void) didTodayDiscountDataSuccess : (id)data
{
    NSLog(@"shouYeViewController:didDataSuccess!");
    NSArray *trans = (NSArray *)data;
    NSArray *disCount = [trans objectAtIndex:0];
    _todayDisCountArray = [[NSMutableArray alloc] init];
    for (int i=0; i<disCount.count;i++ ) {
        todayDiscountGoods *goods = [[todayDiscountGoods alloc] init];
        goods.min_price = [[disCount objectAtIndex:i]objectForKey:@"min_price"];    //最低价格
        goods.market_price = [[disCount objectAtIndex:i]objectForKey:@"market_price"]; //商品原价
        goods.goods_id = [[disCount objectAtIndex:i]objectForKey:@"goods_id"];     //商品id
        goods.supplier_id = [[disCount objectAtIndex:i]objectForKey:@"supplier_id"];
        goods.warehouse_id = [[disCount objectAtIndex:i]objectForKey:@"warehouse_id"];
        goods.goods_sn = [[disCount objectAtIndex:i]objectForKey:@"goods_sn"];     //商品编号
        goods.factory_code = [[disCount objectAtIndex:i]objectForKey:@"factory_code"];
        goods.barcode = [[disCount objectAtIndex:i]objectForKey:@"barcode"];
        goods.goods_format = [[disCount objectAtIndex:i]objectForKey:@"goods_format"];

        goods.goods_name = [[disCount objectAtIndex:i]objectForKey:@"goods_name"];   //商品名称
        goods.goods_sale_amount = [[disCount objectAtIndex:i]objectForKey:@"goods_sale_amount"];//商品销售量
        goods.package_format = [[disCount objectAtIndex:i]objectForKey:@"package_format"];
        goods.product_company = [[disCount objectAtIndex:i]objectForKey:@"product_company"];
        goods.goods_thumb = [[disCount objectAtIndex:i]objectForKey:@"goods_thumb"];
        goods.goods_img = [[disCount objectAtIndex:i]objectForKey:@"goods_img"];
        goods.original_img = [[disCount objectAtIndex:i]objectForKey:@"original_img"];
        goods.goodsAttrs = [[disCount objectAtIndex:i]objectForKey:@"goodsAttrs"];//商品属性（有多个），基本数据结构如下
        [_todayDisCountArray addObject:goods];
    }
    @try {
        NSDictionary* newDic =  [trans objectAtIndex:1];
        _todayNewData = [[todayNew alloc]init];
        _todayNewData.min_price = [newDic objectForKey:@"min_price"];    //最低价格
        _todayNewData.market_price = [newDic objectForKey:@"market_price"]; //商品原价
        _todayNewData.goods_id = [newDic objectForKey:@"goods_id"];     //商品id
        _todayNewData.supplier_id = [newDic objectForKey:@"supplier_id"];
        _todayNewData.warehouse_id = [newDic objectForKey:@"warehouse_id"];
        _todayNewData.goods_sn = [newDic objectForKey:@"goods_sn"];     //商品编号
        _todayNewData.factory_code = [newDic objectForKey:@"factory_code"];
        _todayNewData.barcode = [newDic objectForKey:@"barcode"];
        _todayNewData.goods_format = [newDic objectForKey:@"goods_format"];
        
        _todayNewData.goods_name = [newDic objectForKey:@"goods_name"];   //商品名称
        _todayNewData.goods_sale_amount = [newDic objectForKey:@"goods_sale_amount"];//商品销售量
        _todayNewData.package_format = [newDic objectForKey:@"package_format"];
        _todayNewData.product_company = [newDic objectForKey:@"product_company"];
        _todayNewData.goods_thumb = [newDic objectForKey:@"goods_thumb"];
        _todayNewData.goods_img = [newDic objectForKey:@"goods_img"];
        _todayNewData.original_img = [newDic objectForKey:@"original_img"];
        _todayNewData.goodsAttrs = [newDic objectForKey:@"goodsAttrs"];//商品属性（有多个），基本数据结构如下
        
    }@catch (NSException *e) {
        NSLog(@"didTodayDiscountDataSuccess err=%@",e);
    }
}

- (void) didTodayDiscountDataFailed:(NSString *)err
{
    NSLog(@"shouYeViewController:didDataFailed!");
}


//搜索
-(IBAction)clickSearchBT:(id)sender{
    ShouSuoViewController *search = [[ShouSuoViewController alloc] initWithNibName:@"ShouSuoViewController" bundle:nil];
    [self.navigationController pushViewController:search animated:YES];
}

//扫一扫
-(IBAction)clickToSweep:(id)sender{
    UIActionSheet* scannerAction = [[UIActionSheet alloc] initWithTitle:@"请选择描述类型"
                                                            delegate:self
                                                   cancelButtonTitle:@""
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"汽车VIN码", @"条形码", nil];
    [scannerAction showInView:self.view];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self takePhoto];
    }else if (buttonIndex == 1){
        [self startScannerZxing];
    }
}


//个人信息
-(void)clickPersonalInfoBT:(id)sender{
    if (_tableview.hidden) {
        _tableview.hidden=NO;
        _searchView.hidden=NO;
        _personalInfoView.hidden=YES;
        _scrollView.hidden=YES;
    }else{
        _tableview.hidden=YES;
        _searchView.hidden=YES;
        _personalInfoView.hidden=NO;
        _scrollView.hidden=NO;

    }
}

//首页按钮
-(IBAction)clickShouYeBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}

-(IBAction)clickCityBT:(id)sender{
    ShiftCityViewController *secity = [[ShiftCityViewController alloc] initWithNibName:@"ShiftCityViewController" bundle:nil];
    [self.navigationController pushViewController:secity animated:YES];
}

-(IBAction)clickDebtBT:(id)sender{
    
}
//个人中心
-(IBAction)clickUseNameBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
    if(![userDataManager  sharedUserDataManager].uID)
    {
        registerViewController *reg=[registerViewController sharedregisterViewController];
        [self.navigationController pushViewController:reg animated:YES];
    }else
    {
        YongHuZhongXinViewController *yonghu = [[YongHuZhongXinViewController alloc] initWithNibName:@"YongHuZhongXinViewController" bundle:nil];
        [self.navigationController pushViewController:yonghu animated:YES];
    }
}

//购物车
-(IBAction)clickShoppingCartBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
    GuoWuCheViewController *guowucheVC=[[GuoWuCheViewController alloc]initWithNibName:@"GuoWuCheViewController" bundle:nil];
    [self.navigationController pushViewController:guowucheVC animated:YES];
}

//支付帮助
-(IBAction)clickPaymentBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
    ZhiFuBangZhuViewController *zfb=[[ZhiFuBangZhuViewController alloc] initWithNibName:@"ZhiFuBangZhuViewController" bundle:nil];
    [self.navigationController pushViewController:zfb animated:YES];
}

//使用说明
-(IBAction)clickInstructionsBt:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
    ShiYongShuoMingViewController *zfb=[[ShiYongShuoMingViewController alloc] initWithNibName:@"ShiYongShuoMingViewController" bundle:nil];
    [self.navigationController pushViewController:zfb animated:YES];
}

//联系我们
-(IBAction)clickContactBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
    LianXiWMenViewController *zfb=[[LianXiWMenViewController alloc] initWithNibName:@"LianXiWMenViewController" bundle:nil];
    [self.navigationController pushViewController:zfb animated:YES];
}

//更新
-(IBAction)clickUpdateBT:(id)sender{
    UIButton *but=(UIButton *)sender;
    [self updateview:but.tag];
}
-(void)initPressview
{
        _shouyeBT.backgroundColor=[UIColor clearColor];
        _shouyeArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _shouyeLabel.textColor=[UIColor whiteColor];
        _shouyeImage.image=[UIImage imageNamed:@"icon_home.png"];
    

        _useBT.backgroundColor=[UIColor clearColor];
        _useArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _useNameLabel.textColor=[UIColor whiteColor];
        _useImage.image=[UIImage imageNamed:@"icon_user.png"];


        _cartBT.backgroundColor=[UIColor clearColor];
        _cartArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _cartLabel.textColor=[UIColor whiteColor];
        _cartImage.image=[UIImage imageNamed:@"icon_cart.png"];
    

        _payBT.backgroundColor=[UIColor clearColor];
        _payArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _payLabel.textColor=[UIColor whiteColor];
        _payImage.image=[UIImage imageNamed:@"icon_pay.png"];
    

        _instructionsBT.backgroundColor=[UIColor clearColor];
        _instructionsArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _instructionsLabel.textColor=[UIColor whiteColor];
        _instructionsImage.image=[UIImage imageNamed:@"icon_use.png"];
    

        _contactBT.backgroundColor=[UIColor clearColor];
        _contactArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _contactLabel.textColor=[UIColor whiteColor];
        _contactImage.image=[UIImage imageNamed:@"icon_contact.png"];
    

        _updateBT.backgroundColor=[UIColor clearColor];
        _updateArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _updateLabel.textColor=[UIColor whiteColor];
        _updateImage.image=[UIImage imageNamed:@"icon_update.png"];
    
        _cityBT.backgroundColor=[UIColor clearColor];
        _cityArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _cityLabel.textColor=[UIColor blackColor];
        _cityImage.image=[UIImage imageNamed:@"icon_update.png"];
        
        _debtBT.backgroundColor=[UIColor clearColor];
        _debtArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _debtLabel.textColor=[UIColor blackColor];
        _debtImage.image=[UIImage imageNamed:@"icon_update.png"];
        
    
    
}
//点击按钮视图的变化
-(void)updateview:(NSInteger)tag{
    if (tag==1) {
        _shouyeBT.backgroundColor=[UIColor yellowColor];
        _shouyeArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _shouyeLabel.textColor=[UIColor blackColor];
        _shouyeImage.image=[UIImage imageNamed:@"icon_home_press.png"];
    }
    if (tag==2) {
        _useBT.backgroundColor=[UIColor yellowColor];
        _useArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _useNameLabel.textColor=[UIColor blackColor];
        _useImage.image=[UIImage imageNamed:@"icon_user_press.png"];
    }    if (tag==3) {
        _cartBT.backgroundColor=[UIColor yellowColor];
        _cartArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _cartLabel.textColor=[UIColor blackColor];
        _cartImage.image=[UIImage imageNamed:@"icon_cart_press.png"];
    }
    if (tag==4) {
        _payBT.backgroundColor=[UIColor yellowColor];
        _payArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _payLabel.textColor=[UIColor blackColor];
        _payImage.image=[UIImage imageNamed:@"icon_pay_press.png"];
    }
    if (tag==5) {
        _instructionsBT.backgroundColor=[UIColor yellowColor];
        _instructionsArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _instructionsLabel.textColor=[UIColor blackColor];
        _instructionsImage.image=[UIImage imageNamed:@"icon_use_press.png"];
    }
    if (tag==6) {
        _contactBT.backgroundColor=[UIColor yellowColor];
        _contactArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _contactLabel.textColor=[UIColor blackColor];
        _contactImage.image=[UIImage imageNamed:@"icon_contact_press.png"];
    }
    if (tag==7) {
        _updateBT.backgroundColor=[UIColor yellowColor];
        _updateArow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _updateLabel.textColor=[UIColor blackColor];
        _updateImage.image=[UIImage imageNamed:@"icon_update_press.png"];
    }
    if(tag==8){
        _cityBT.backgroundColor=[UIColor yellowColor];
        _cityArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _cityLabel.textColor=[UIColor blackColor];
        _cityImage.image=[UIImage imageNamed:@"icon_update_press.png"];

    }
    if(tag==9){
        _debtBT.backgroundColor=[UIColor yellowColor];
        _debtArrow.image=[UIImage imageNamed:@"icon_arrow1_right.png"];
        _debtLabel.textColor=[UIColor blackColor];
        _debtImage.image=[UIImage imageNamed:@"icon_update_press.png"];
        
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 22)];
    headerView.backgroundColor=[UIColor lightGrayColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 60, 22)];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:14.0f];
    label.textColor=[UIColor darkGrayColor];
    [headerView addSubview:label];
    if (section==0) {
        label.text=@"今天发布";
    }else{
        label.text=@"今天特价";
    }
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return _todayDisCountArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    UIView *spcell = [cell viewWithTag:1000];
    if (spcell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"shouYeCell" owner:self options:nil];
        spcell=[nib objectAtIndex:0];
        [cell addSubview:spcell];
    }
    NSString *name;
    NSString *xingHao;
    NSString *yuanjia;
    NSString *price;
    NSString *imageUrl;
    if (indexPath.section  == 0) {
        name = _todayNewData.goods_name;
        xingHao = _todayNewData.goods_format;
        yuanjia = _todayNewData.market_price;
        price = _todayNewData.min_price;
        imageUrl = _todayNewData.goods_thumb;
    }
    else if(indexPath.section == 1)
    {
        todayDiscountGoods *goods = [_todayDisCountArray objectAtIndex:indexPath.row];
        name = goods.goods_name;
        xingHao = goods.goods_format;
        price = goods.min_price;
        imageUrl = goods.goods_thumb;

    }
//    NSImage *image = [[NSImage alloc]initWithContentsOfURL:(NSURL *)];
    UIHTTPImageView *imageView=(UIHTTPImageView *)[spcell viewWithTag:1];
    [imageView setImageWithURL:[NSURL URLWithString:[[NSString alloc]initWithFormat:@"http://%@/%@",IMAGE_SERVER_ADDR,imageUrl]]];
    
    UILabel *NameLa=(UILabel *)[spcell viewWithTag:2];
    NameLa.text=name;//@"MANN 空气滤清器";
    NameLa.textColor=[UIColor blackColor];
    NameLa.font=[UIFont systemFontOfSize:15.0f];
    UILabel *xingHaoLa=(UILabel *)[spcell viewWithTag:3];
    xingHaoLa.text=xingHao;//@"美孚（ow-40）sn 1l装";
    xingHaoLa.textColor=[UIColor darkGrayColor];
    xingHaoLa.font=[UIFont systemFontOfSize:14.0f];
    
    
    UILabel *yuanPrice=(UILabel *)[spcell viewWithTag:5];
    yuanPrice.frame=CGRectMake(yuanPrice.frame.origin.x, 18, yuanPrice.frame.size.width, yuanPrice.frame.size.height);
    yuanPrice.text=[[NSString alloc] initWithFormat:@"¥%@",yuanjia];//@"¥92.00";
    yuanPrice.hidden=NO;
    yuanPrice.textColor=[UIColor darkGrayColor];
    yuanPrice.font=[UIFont systemFontOfSize:14.0f];
    UILabel *priceLabel=(UILabel *)[spcell viewWithTag:4];
    if (yuanPrice.hidden) {
        priceLabel.frame=CGRectMake(priceLabel.frame.origin.x, 25, priceLabel.frame.size.width, priceLabel.frame.size.height);
    }else{
        priceLabel.frame=CGRectMake(priceLabel.frame.origin.x, 42, priceLabel.frame.size.width, priceLabel.frame.size.height);
    }
    priceLabel.hidden=NO;
    priceLabel.text=[[NSString alloc] initWithFormat:@"¥%@",price];//@"¥100.00";
    priceLabel.textColor=[UIColor redColor];
    priceLabel.font=[UIFont systemFontOfSize:15.0f];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    {
        JinRiFaBuViewController *jinri = [[JinRiFaBuViewController alloc] initWithNibName:@"JinRiFaBuViewController" bundle:nil];
        [self.navigationController  pushViewController:jinri animated:YES];

    }
    else if(indexPath.section == 1)
    {
        ProductDetailsViewController *ProductVc=[[ProductDetailsViewController alloc]initWithNibName:@"ProductDetailsViewController" bundle:nil];
        NSLog(@"section=%d,index=%d",indexPath.section,indexPath.row);
        todayDiscountGoods *goods = [_todayDisCountArray objectAtIndex:indexPath.row];
        ProductVc.pid = goods.goods_id;
        [self.navigationController pushViewController:ProductVc animated:YES];
   }

}

- (void)startScannerZxing
{
    ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO];
    MultiFormatReader* qrcodeReader = [[MultiFormatReader alloc] init];
    NSSet *readers = [[NSSet alloc ] initWithObjects:qrcodeReader,nil];
    widController.readers = readers;
    NSBundle *mainBundle = [NSBundle mainBundle];
//    widController.soundToPlay = [NSURL fileURLWithPath:[mainBundle pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];
    [self presentModalViewController:widController animated:YES];

}

#pragma mark -
#pragma mark ZXingDelegateMethods
- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)resultString {
    [self dismissModalViewControllerAnimated:YES];
#if ZXING_DEBUG
    NSLog(@"result has %d actions", actions ? 0 : actions.count);
#endif
    barcode = resultString;
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"查询成功!" message:resultString delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"点击查询", nil];
    [alertView show];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
    }else if (buttonIndex == 1){
        ProductDetailsViewController *ProductVc=[[ProductDetailsViewController alloc]initWithNibName:@"ProductDetailsViewController" bundle:nil];
        ProductVc.barcode = barcode;
        [self.navigationController pushViewController:ProductVc animated:YES];
    }
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller {
    [self dismissModalViewControllerAnimated:YES];
    NSString *returnUrl = [[NSUserDefaults standardUserDefaults] stringForKey:@"returnURL"];
    if (returnUrl != nil) {
        UIAlertView* alert = [[UIAlertView alloc]
                              initWithTitle:@"Return to website?"
                              message:nil
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Return", nil];
        [alert show];
    }

}

//二值化
- (UIImage *)convertToGrayscale:(UIImage*)img{
    
    CGSize size = [img size];
    
    int width = size.width;
    
    int height = size.height;
    
    // the pixels will be painted to this array
    
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [img CGImage]);
    
    int tt = 1;
    
    CGFloat intensity;
    
    int bw;
    
    for(int y = 0; y < height; y++) {
        
        for(int x = 0; x < width; x++) {
            
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            intensity = (rgbaPixel[tt] + rgbaPixel[tt + 1] + rgbaPixel[tt + 2]) / 3. / 255.;
            
            if (intensity > 0.45) {
                
                bw = 255;
                
            } else {
                
                bw = 0;
                
            }
            
            rgbaPixel[tt] = bw;
            
            rgbaPixel[tt + 1] = bw;
            
            rgbaPixel[tt + 2] = bw;
            
        }
        
    }
    
    // create a new CGImageRef from our context with the modified pixels
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    
    CGContextRelease(context);
    
    CGColorSpaceRelease(colorSpace);
    
    free(pixels);
    
    // make a new UIImage to return
    
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    
    // we're done with image now too
    
    CGImageRelease(image);
    
    return resultUIImage;
}


//灰度

-(UIImage *)grayImage:(UIImage *)source
{
    int width = source.size.width;
    int height = source.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  kCGImageAlphaNone);
    
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), source.CGImage);
    
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    
    return grayImage;
}


-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType= UIImagePickerControllerSourceTypeCamera;
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"没有相机");
    }
    
    UIImagePickerController* picker=[[UIImagePickerController alloc] init];
    
    picker.delegate=self;
    picker.allowsEditing=YES;
    picker.sourceType= sourceType;
    
    [self presentModalViewController:picker animated:YES];
    
}



-(void)load:(UIImage*)image
{
    //二值
    UIImage* tmp_img=[self convertToGrayscale:image];
    //灰度
    UIImage *image2 = [self grayImage:tmp_img];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image2];
    
    
//    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);//320 400
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:imageView];
    
    ZiDingYiJianPanViewController *vin = [[ZiDingYiJianPanViewController alloc] initWithNibName:@"ZiDingYiJianPanViewController" bundle:nil];
    vin.img = image2;
    [self.navigationController pushViewController:vin animated:YES];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissModalViewControllerAnimated:YES];
    
    UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    [self load:image];
    
}











- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

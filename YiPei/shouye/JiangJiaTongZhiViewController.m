//
//  JiangJiaTongZhiViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-11-25.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "JiangJiaTongZhiViewController.h"
#import "lowPriceFunc.h"
#import "MyImageUtils.h"
#import "userDataManager.h"
@interface JiangJiaTongZhiViewController ()

@end

@implementation JiangJiaTongZhiViewController
@synthesize PriceLabel=_PriceLabel;
@synthesize caiGouPriceText=_caiGouPriceText;
@synthesize caiGouNumber=_caiGouNumber;
@synthesize fanDian=_fanDian;
@synthesize paiZhaoV=_paiZhaoV;
@synthesize paiZhaoBT=_paiZhaoBT;
@synthesize zhaoPianV=_zhaoPianV;
@synthesize BackImage=_BackImage;
@synthesize zhaoPian=_zhaoPian;
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;
@synthesize myImagePicker = _myImagePicker;
@synthesize uploadImage = _uploadImage;

@synthesize price = _price;
@synthesize pid=_pid;
@synthesize imagepath=_imagepath;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
   
    float height=[[UIScreen mainScreen] bounds].size.height;
    _paiZhaoV.frame=CGRectMake(_paiZhaoV.frame.origin.x, _paiZhaoV.frame.origin.y, _paiZhaoV.frame.size.width, height-283);
    _zhaoPianV.frame=CGRectMake(_zhaoPianV.frame.origin.x, _zhaoPianV.frame.origin.y, _zhaoPianV.frame.size.width, height-283);
    
    if (height==480) {
        _paiZhaoBT.frame=CGRectMake(_paiZhaoBT.frame.origin.x, height-283-160, _paiZhaoBT.frame.size.width, _paiZhaoBT.frame.size.height);
        _BackImage.frame=CGRectMake(58, 0, 207, 114);
        _zhaoPian.frame=CGRectMake(58, 0,207, 114);
    }else{
        _paiZhaoBT.frame=CGRectMake(_paiZhaoBT.frame.origin.x, height-283-190, _paiZhaoBT.frame.size.width, _paiZhaoBT.frame.size.height);
        _BackImage.frame=CGRectMake(28, 5, 267, 204);
        _zhaoPian.frame=CGRectMake(28, 5, 267, 204);
    }
    
    _PriceLabel.text = self.price;
}



//返回
-(IBAction)clickFanHuiBT:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

//完成
-(void)clickWangChangBT:(id)sender{
    lowPriceFunc *low = [[lowPriceFunc alloc] init];
    [low getlowPriceNotify:_pid sysPrice:_price bugPrice:_caiGouPriceText.text buyNo:_caiGouNumber.text buyRebates:_fanDian.text imagePath:_imagepath userID:[userDataManager sharedUserDataManager].uID cityID:[userDataManager sharedUserDataManager].cityID];
    
    
}
- (void) didLowPriceNotifyDataSuccess : (id)data
{
}

- (void) didLowPriceNotifyDataFailed : (NSString *)err
{
    
}

//照相按钮
-(IBAction)ZhaoXiang:(id)sender{
    
    _myImagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        _myImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _myImagePicker.delegate = self;
        _myImagePicker.allowsEditing = YES;
                [self presentModalViewController:_myImagePicker animated:YES];//show the camera
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"不支持相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }

}
#pragma mark -UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    if (image) {
        //压缩图片
       
        _uploadImage = [MyImageUtils scaleImage:image width:265 height:202];
         _zhaoPianV.hidden=NO;
       _paiZhaoV.hidden=YES;
       
        _zhaoPian.image = image;
        
        [self updateHeadImage];
    }
        [self dismissModalViewControllerAnimated:YES];
    _myImagePicker.delegate = nil;
    _myImagePicker = nil;
}
//上传图片
- (void)updateHeadImage{
    NSData *imageData = nil;
    if(!_uploadImage){
        return;
    }
    imageData = UIImagePNGRepresentation(_uploadImage);
 
    if (!imageData) {
        return;
    }
    //    [SVProgressHUD showWithStatus:@"正在提交..."];
    lowPriceFunc *low = [[lowPriceFunc alloc] init];
    [low getImagePath:imageData];
}

- (void) didUploadImageDataSuccess : (id)data{
    _rightitem.hidden=NO;
}
- (void) didUploadImageDataFailed : (NSString *)err
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.modalPresentationCapturesStatusBarAppearance = NO;
//    }
    self.navigationController.navigationBar.backgroundColor=[UIColor darkGrayColor];
    self.title=@"降价通知";
    
    _leftitem=[[UIButton alloc]initWithFrame:CGRectMake(20, 14, 50, 30)] ;
    _leftitem.backgroundColor=[UIColor clearColor];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back.png"] forState:UIControlStateNormal];
    [_leftitem setImage:[UIImage imageNamed:@"topbtn_back_press.png"] forState:UIControlStateHighlighted];
    [_leftitem addTarget:self action:@selector(clickFanHuiBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_leftitem];
    
    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 50, 30)] ;
    _rightitem.tag=3;
    _rightitem.backgroundColor=[UIColor clearColor];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_complete.png"] forState:UIControlStateNormal];
    [_rightitem setImage:[UIImage imageNamed:@"topbtn_complete_press.png"] forState:UIControlStateHighlighted];
    [_rightitem addTarget:self action:@selector(clickWangChangBT:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];
        
//    _rightitem=[[UIButton alloc]initWithFrame:CGRectMake(270, 14, 30, 30)] ;
//    _rightitem.tag=3;
//    _rightitem.backgroundColor=[UIColor clearColor];
//    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart.png"] forState:UIControlStateNormal];
//    [_rightitem setImage:[UIImage imageNamed:@"topbtn_cart_press.png"] forState:UIControlStateHighlighted];
//    [_rightitem addTarget:self action:@selector(clickShoppingCartBT:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightitem];

        _rightitem.hidden=YES;
    _caiGouPriceText.delegate=self;
    _caiGouNumber.delegate=self;
    _fanDian.delegate=self;
    }
    
    
    _paiZhaoV.hidden=NO;
    _zhaoPianV.hidden=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
@end
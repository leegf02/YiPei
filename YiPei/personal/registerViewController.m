//
//  registerViewController.m
//  YiPei
//
//  Created by lee on 13-12-10.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "registerViewController.h"
#import "registerCityViewController.h"
#import "VerifySaveUserFunc.h"

@interface registerViewController ()

@end

@implementation registerViewController
@synthesize regionBtn=_regionBtn;
@synthesize location=_location;

@synthesize storeField=_storeField;
@synthesize addrField=_addrField;
@synthesize contactField=_contactField;
@synthesize mobileField=_mobileField;
@synthesize codeField=_codeField;
@synthesize leftitem=_leftitem;
@synthesize rightitem=_rightitem;
static registerViewController *registerVc;

+(registerViewController*)sharedregisterViewController{
    
    @synchronized(self)
    {
        if (registerVc == nil)
        {
            registerVc = [[self alloc] init];
        }
    }
    return registerVc;
}

+(id) allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (registerVc == nil)
        {
            registerVc = [super allocWithZone:zone];
            return registerVc;
        }
    }
    return nil;
}


-(IBAction)clickRegion :(id)sender
{
    registerCityViewController *cregion = [[registerCityViewController alloc] initWithNibName:@"registerCityViewController" bundle:nil];
    [self.navigationController pushViewController:cregion animated:YES];
}

-(IBAction)clickVerify :(id)sender
{
    if (![_mobileField.text isEqualToString:@""] &&_mobileField.text.length==11) {
        VerifySaveUserFunc *verify = [[VerifySaveUserFunc alloc] init];
        verify.delegate=self;
        [verify getVerifyUser:_mobileField.text];
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([_storeField.text isEqualToString:@""]) {
        _storeField.text=@"门店信息";
    }
    if ([_addrField.text isEqualToString:@""]) {
        _addrField.text=@"详细地址";
    }
    if ([_contactField.text isEqualToString:@""]) {
        _contactField.text=@"联系人";
    }
    if ([_mobileField.text isEqualToString:@""]) {
        _mobileField.text=@"联系电话";
    }
    if ([_codeField.text isEqualToString:@""]) {
        _codeField.text=@"验证码";
    }
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)textFieldStoreBeginEditing:(id)sender
{
    if ([_addrField.text isEqualToString:@""]) {
        _addrField.text=@"详细地址";
    }
    if ([_contactField.text isEqualToString:@""]) {
        _contactField.text=@"联系人";
    }
    if ([_mobileField.text isEqualToString:@""]) {
        _mobileField.text=@"联系电话";
    }
    if ([_codeField.text isEqualToString:@""]) {
        _codeField.text=@"验证码";
    }
    UITextField *field = (UITextField *)sender;
    field.text=@"";
    CGRect frame = field.superview.superview.frame;
    
    int offset = frame.origin.y + frame.size.height - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    
    float height = self.view.frame.size.height;
    
    if(offset > 0)
        
    {
        
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        
        self.view.frame = rect;
        
    }       
    
    [UIView commitAnimations];
}

- (IBAction)textFieldAddrBeginEditing:(id)sender
{
    if ([_storeField.text isEqualToString:@""]) {
        _storeField.text=@"门店信息";
    }
    if ([_contactField.text isEqualToString:@""]) {
        _contactField.text=@"联系人";
    }
    if ([_mobileField.text isEqualToString:@""]) {
        _mobileField.text=@"联系电话";
    }
    if ([_codeField.text isEqualToString:@""]) {
        _codeField.text=@"验证码";
    }
    UITextField *field = (UITextField *)sender;
    field.text=@"";
    CGRect frame = field.superview.superview.frame;
    
    int offset = frame.origin.y + frame.size.height - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    
    float height = self.view.frame.size.height;
    
    if(offset > 0)
        
    {
        
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        
        self.view.frame = rect;
        
    }       
    
    [UIView commitAnimations];
}

- (IBAction)textFieldContactBeginEditing:(id)sender
{
    if ([_storeField.text isEqualToString:@""]) {
        _storeField.text=@"门店信息";
    }
    if ([_addrField.text isEqualToString:@""]) {
        _addrField.text=@"详细地址";
    }

    if ([_mobileField.text isEqualToString:@""]) {
        _mobileField.text=@"联系电话";
    }
    if ([_codeField.text isEqualToString:@""]) {
        _codeField.text=@"验证码";
    }
    UITextField *field = (UITextField *)sender;
    field.text=@"";
    CGRect frame = field.superview.superview.frame;
    
    int offset = frame.origin.y + frame.size.height - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    
    float height = self.view.frame.size.height;
    
    if(offset > 0)
        
    {
        
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        
        self.view.frame = rect;
        
    }       
    
    [UIView commitAnimations];
}

- (IBAction)textFieldMobileBeginEditing:(id)sender
{
    if ([_storeField.text isEqualToString:@""]) {
        _storeField.text=@"门店信息";
    }
    if ([_addrField.text isEqualToString:@""]) {
        _addrField.text=@"详细地址";
    }
    if ([_contactField.text isEqualToString:@""]) {
        _contactField.text=@"联系人";
    }

    if ([_codeField.text isEqualToString:@""]) {
        _codeField.text=@"验证码";
    }
    UITextField *field = (UITextField *)sender;
    field.text=@"";
    CGRect frame = field.superview.superview.frame;
    
    int offset = frame.origin.y + frame.size.height - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    
    float height = self.view.frame.size.height;
    
    if(offset > 0)
        
    {
        
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        
        self.view.frame = rect;
        
    }       
    
    [UIView commitAnimations];
    
}

- (IBAction)textFieldCodeBeginEditing:(id)sender
{
    if ([_storeField.text isEqualToString:@""]) {
        _storeField.text=@"门店信息";
    }
    if ([_addrField.text isEqualToString:@""]) {
        _addrField.text=@"详细地址";
    }
    if ([_contactField.text isEqualToString:@""]) {
        _contactField.text=@"联系人";
    }
    if ([_mobileField.text isEqualToString:@""]) {
        _mobileField.text=@"联系电话";
    }

    UITextField *field = (UITextField *)sender;
    field.text=@"";
    CGRect frame = field.superview.superview.frame;
    
    int offset = frame.origin.y + frame.size.height - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    
    float height = self.view.frame.size.height;
    
    if(offset > 0)
        
    {
        
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        
        self.view.frame = rect;
        
    }       
    
    [UIView commitAnimations];
}


- (void)textContactKeyBoardMoveUp
{
    
}

- (void)textMobileKeyBoardMoveUp
{}

- (void)textCodeKeyBoardMoveUp
{
}

- (void)keyboardWillShow:(NSNotification *)noti
{
    //键盘输入的界面调整
    
    //键盘的高度
    
    float height = 216.0;
    
    CGRect frame = self.view.frame;
    
    frame.size = CGSizeMake(frame.size.width, frame.size.height - height);
    
    [UIView beginAnimations:@"Curl"context:nil];//动画开始
    
    [UIView setAnimationDuration:0.30];
    
    [UIView setAnimationDelegate:self];
    
    [self.view setFrame:frame];
    
    [UIView commitAnimations];
    
}

- (IBAction)backgroundTap:(id)sender {
    [_storeField resignFirstResponder];
    [_addrField resignFirstResponder];
    [_mobileField resignFirstResponder];
    [_contactField resignFirstResponder];
    [_codeField resignFirstResponder];
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    
    self.view.frame = rect;
}
- (void) didVerifyUserSuccess : (id)data
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"恭喜"
                                                       message:@"获取验证码成功！" delegate:self cancelButtonTitle:@"Ok"otherButtonTitles:nil, nil];
    [alertView show];
}
- (void) didVerifyUserFailed : (NSString *)err
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"很遗憾"
                                                       message:@"获取验证码失败！" delegate:self cancelButtonTitle:@"Ok"otherButtonTitles:nil, nil];
    [alertView show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//返回
-(IBAction)clickFanHuiBT:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//完成
-(void)clickWangChangBT:(id)sender
{
    
    if (_location) {
        VerifySaveUserFunc *verify = [[VerifySaveUserFunc alloc] init];
        verify.delegate_save=self;
        [verify saveInitUserInfo:_storeField.text Prov:[_location valueForKey:@"proviceID"] City:[_location valueForKey:@"cityID"]  District:[_location valueForKey:@"disID"] Addr:_addrField.text Mobile:_mobileField.text Contact:_contactField.text Code:_codeField.text];
    }
}
- (void) didSaveUserSuccess : (id)data
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"恭喜"
                                                       message:@"获取验证码成功！" delegate:self cancelButtonTitle:@"Ok"otherButtonTitles:nil, nil];
    [alertView show];
}
- (void) didSaveUserFailed : (NSString *)err
{}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

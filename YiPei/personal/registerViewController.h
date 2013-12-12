//
//  registerViewController.h
//  YiPei
//
//  Created by lee on 13-12-10.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerViewController : UIViewController


@property (nonatomic,strong) IBOutlet UIButton *regionBtn;
@property (nonatomic,strong) IBOutlet UITextField *storeField;
@property (nonatomic,strong) IBOutlet UITextField *addrField;
@property (nonatomic,strong) IBOutlet UITextField *contactField;
@property (nonatomic,strong) IBOutlet UITextField *mobileField;
@property (nonatomic,strong) IBOutlet UITextField *codeField;
@property(nonatomic,strong)NSMutableDictionary *location;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;

+(registerViewController*)sharedregisterViewController;
-(IBAction)clickRegion :(id)sender;
-(IBAction)clickVerify :(id)sender;

- (IBAction)textFiledReturnEditing:(id)sender;

- (IBAction)textFieldStoreBeginEditing:(id)sender;

- (IBAction)textFieldAddrBeginEditing:(id)sender;

- (IBAction)textFieldContactBeginEditing:(id)sender;

- (IBAction)textFieldMobileBeginEditing:(id)sender;

- (IBAction)textFieldCodeBeginEditing:(id)sender;


- (void)textContactKeyBoardMoveUp;

- (void)textMobileKeyBoardMoveUp;

- (void)textCodeKeyBoardMoveUp;

- (IBAction)backgroundTap:(id)sender;
@end

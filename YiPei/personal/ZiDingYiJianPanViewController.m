//
//  ZiDingYiJianPanViewController.m
//  YiPei
//
//  Created by lixiaoxiao on 13-12-5.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "ZiDingYiJianPanViewController.h"
#import "Tesseract.h"
#import "JMWhenTapped.h"
#import "scannerVinViewController.h"
#import "UITabBarController+RotateTabBarController.h"
#import "AppDelegate.h"
#import "CustomTabBar.h"

@interface ZiDingYiJianPanViewController ()

@end

@implementation ZiDingYiJianPanViewController
@synthesize buttonView=_buttonView;
@synthesize button1=_button1;
@synthesize button2=_button2;
@synthesize button3=_button3;
@synthesize button4=_button4;
@synthesize button5=_button5;
@synthesize button6=_button6;
@synthesize button7=_button7;
@synthesize button8=_button8;
@synthesize button9=_button9;
@synthesize buttonQ=_buttonQ;
@synthesize buttonW=_buttonW;
@synthesize buttonE=_buttonE;
@synthesize buttonR=_buttonR;
@synthesize buttonT=_buttonT;
@synthesize buttonY=_buttonY;
@synthesize buttonU=_buttonU;
@synthesize buttonI=_buttonI;
@synthesize buttonO=_buttonO;
@synthesize buttonP=_buttonP;
@synthesize buttonA=_buttonA;
@synthesize buttonS=_buttonS;
@synthesize buttonD=_buttonD;
@synthesize buttonF=_buttonF;
@synthesize buttonG=_buttonG;
@synthesize buttonH=_buttonH;
@synthesize buttonJ=_buttonJ;
@synthesize buttonK=_buttonK;
@synthesize buttonL=_buttonL;
@synthesize buttonZ=_buttonZ;
@synthesize buttonX=_buttonX;
@synthesize buttonC=_buttonC;
@synthesize buttonV=_buttonV;
@synthesize buttonB=_buttonB;
@synthesize buttonN=_buttonN;
@synthesize buttonM=_buttonM;

@synthesize labelView=_labelView;
@synthesize label1=_label1;
@synthesize label2=_label2;
@synthesize label3=_label3;
@synthesize label4=_label4;
@synthesize label5=_label5;
@synthesize label6=_label6;
@synthesize label7=_label7;
@synthesize label8=_label8;
@synthesize label9=_label9;
@synthesize label10=_label10;
@synthesize label11=_label11;
@synthesize label12=_label12;
@synthesize label13=_label13;
@synthesize label14=_label14;
@synthesize label15=_label15;
@synthesize label16=_label16;
@synthesize label17=_label17;

@synthesize labelView1=_labelView1;
@synthesize labelView2=_labelView2;
@synthesize labelView3=_labelView3;
@synthesize labelView4=_labelView4;
@synthesize labelView5=_labelView5;
@synthesize labelView6=_labelView6;
@synthesize labelView7=_labelView7;
@synthesize labelView8=_labelView8;
@synthesize labelView9=_labelView9;
@synthesize labelView10=_labelView10;
@synthesize labelView11=_labelView11;
@synthesize labelView12=_labelView12;
@synthesize labelView13=_labelView13;
@synthesize labelView14=_labelView14;
@synthesize labelView15=_labelView15;
@synthesize labelView16=_labelView16;
@synthesize labelView17=_labelView17;

@synthesize chongPaiBT=_chongPaiBT;
@synthesize queDingBT=_queDingBT;
@synthesize FanHuiBT=_FanHuiBT;
@synthesize img;

//@synthesize tesseract;

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
    
    AppDelegate *appdel = [AppDelegate shsharedeApp];
    [appdel.tabBarController hideCustomTabBar];
    
//    [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeRight animated: YES];
//    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
//	[UIView beginAnimations:nil context:nil];
//	[UIView setAnimationDuration:duration];
//	self.navigationController.view.transform = CGAffineTransformIdentity;
//    self.navigationController.view.transform = CGAffineTransformMakeRotation(M_PI*(90)/180.0);
//    self.navigationController.view.bounds = CGRectMake(0, 0, 480, 320);
//	[UIView commitAnimations];

    [self.navigationController navigationBar].hidden=YES;
    // Do any additional setup after loading the view from its nib.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        __block Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"/tessdata" language:@"eng"];
        
        // Uncomment to only search for alpha-numeric characters.
        [tesseract setVariableValue:@"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" forKey:@"tessedit_char_whitelist"];
        
        [tesseract setImage:self.img];
        [tesseract recognize];
        
        [_button0 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button1 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button2 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button3 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button4 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button5 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button6 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button7 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button8 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button9 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonA addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonB addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonC addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonD addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonE addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonF addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonG addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonH addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonI addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonJ addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonK addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonL addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonM addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonN addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonO addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonP addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonQ addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonR addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonS addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonT addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonU addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonV addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonW addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonX addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonY addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonZ addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.3
                             animations:^{
                             }
                             completion:^(BOOL finished) {
                                 NSLog(@"%@",[tesseract recognizedText]);
                                 NSString *str = [tesseract recognizedText];

                                 _label1.text = [str substringWithRange:NSMakeRange(0,1)];
                                 _label2.text = [str substringWithRange:NSMakeRange(1,1)];
                                 _label3.text = [str substringWithRange:NSMakeRange(2,1)];
                                 _label4.text = [str substringWithRange:NSMakeRange(3,1)];
                                 _label5.text = [str substringWithRange:NSMakeRange(4,1)];
                                 _label6.text = [str substringWithRange:NSMakeRange(5,1)];
                                 _label7.text = [str substringWithRange:NSMakeRange(6,1)];
                                 _label8.text = [str substringWithRange:NSMakeRange(7,1)];
                                 _label9.text = [str substringWithRange:NSMakeRange(8,1)];
                                 _label10.text = [str substringWithRange:NSMakeRange(9,1)];
                                 _label11.text = [str substringWithRange:NSMakeRange(10,1)];
                                 _label12.text = [str substringWithRange:NSMakeRange(11,1)];
                                 _label13.text = [str substringWithRange:NSMakeRange(12,1)];
                                 _label14.text = [str substringWithRange:NSMakeRange(13,1)];
                                 _label15.text = [str substringWithRange:NSMakeRange(14,1)];
                                 _label16.text = [str substringWithRange:NSMakeRange(15,1)];
                                 _label17.text = [str substringWithRange:NSMakeRange(16,1)];
                                 
                                 NSLog(@"_label1.text=%@,_label2.text=%@,_label3.text=%@,_label4.text=%@,_label5.text=%@,_label6.text=%@,_label7.text=%@,_label8.text=%@,_label9.text=%@,_label10.text=%@,_label11.text=%@,_label12.text=%@,_label13.text=%@,_label14.text=%@,_label5.text=%@,_label16.text=%@,_label17.text=%@",_label1.text,_label2.text,_label3.text,_label4.text,_label5.text,_label6.text,_label7.text,_label8.text,_label9.text,_label10.text,_label11.text,_label12.text,
                                       _label13.text,_label14.text,_label15.text,_label15.text,_label16.text,_label17.text
                                       );
                                 
                                 [_labelView1 whenTapped:^{
                                     focusLabelNum=1;
                                 }];
                                 [_labelView2 whenTapped:^{
                                     focusLabelNum=2;
                                 }];
                                 [_labelView3 whenTapped:^{
                                     focusLabelNum=3;
                                 }];
                                 [_labelView4 whenTapped:^{
                                     focusLabelNum=4;

                                 }];
                                 [_labelView5 whenTapped:^{
                                     focusLabelNum=5;

                                 }];
                                 [_labelView6 whenTapped:^{
                                     focusLabelNum=6;

                                 }];
                                 [_labelView7 whenTapped:^{
                                     focusLabelNum=7;

                                 }];
                                 [_labelView8 whenTapped:^{
                                     focusLabelNum=8;

                                 }];
                                 [_labelView9 whenTapped:^{
                                     focusLabelNum=9;

                                 }];
                                 [_labelView10 whenTapped:^{
                                     focusLabelNum=10;

                                 }];
                                 [_labelView11 whenTapped:^{
                                     focusLabelNum=11;

                                 }];
                                 [_labelView12 whenTapped:^{
                                     focusLabelNum=12;

                                 }];
                                 [_labelView13 whenTapped:^{
                                     focusLabelNum=13;

                                 }];
                                 [_labelView14 whenTapped:^{
                                     focusLabelNum=14;

                                 }];
                                 [_labelView15 whenTapped:^{
                                     focusLabelNum=15;

                                 }];
                                 [_labelView16 whenTapped:^{
                                     focusLabelNum=16;

                                 }];
                                 [_labelView17 whenTapped:^{
                                     focusLabelNum=17;

                                 }];
                             }];
        });
    });
}

-(void)pushWord2Label:(NSString *)word;
{
    switch (focusLabelNum) {
        case 1:
            _label1.text=word;
            break;
        case 2:
            _label2.text=word;

            break;
        case 3:
            _label3.text=word;

            break;
        case 4:
            _label4.text=word;

            break;
        case 5:
            _label5.text=word;

            break;
        case 6:
            _label6.text=word;

            break;
        case 7:
            _label7.text=word;

            break;
        case 8:
            _label8.text=word;

            break;
        case 9:
            _label9.text=word;

            break;
        case 10:
            _label10.text=word;

            break;
        case 11:
            _label11.text=word;

            break;
        case 12:
            _label12.text=word;

            break;
        case 13:
            _label13.text=word;

            break;
        case 14:
            _label14.text=word;

            break;
        case 15:
            _label15.text=word;

            break;
        case 16:
            _label16.text=word;

            break;
        case 17:
            _label17.text=word;
            break;
        default:
            break;
    }
}

-(IBAction)clickButton:(id)sender
{
    NSString *word;
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 1:
            word=@"1";
            break;
        case 2:
            word=@"2";
            break;
        case 3:
            word=@"3";

            break;
        case 4:
            word=@"4";

            break;
        case 5:
            word=@"5";

            break;
        case 6:
            word=@"6";

            break;
        case 7:
            word=@"7";

            break;
        case 8:
            word=@"8";

            break;
        case 9:
            word=@"9";

            break;
        case 10:
            word=@"0";

            break;
        case 11:
            word=@"Q";

            break;
        case 12:
            word=@"W";

            break;
        case 13:
            word=@"E";

            break;
        case 14:
            word=@"R";

            break;
        case 15:
            word=@"T";

            break;
        case 16:
            word=@"Y";

            break;
        case 17:
            word=@"U";

            break;
        case 18:
            word=@"I";

            break;
        case 19:
            word=@"O";

            break;
        case 20:
            word=@"P";

            break;
        case 21:
            word=@"A";

            break;
        case 22:
            word=@"S";

            break;
        case 23:
            word=@"D";

            break;
        case 24:
            word=@"F";

            break;
        case 25:
            word=@"G";

            break;
        case 26:
            word=@"H";

            break;
        case 27:
            word=@"J";

            break;
        case 28:
            word=@"K";

            break;
        case 29:
            word=@"L";

            break;
        case 30:
            word=@"Z";

            break;
        case 31:
            word=@"X";

            break;
        case 32:
            word=@"C";

            break;
        case 33:
            word=@"V";

            break;
        case 34:
            word=@"B";

            break;
        case 35:
            word=@"N";

            break;
        case 36:
            word=@"M";

            break;
        default:
            break;
    }
    [self pushWord2Label:word];
}

-(IBAction)clickchongPaiBT:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)clickqueDingBT:(id)sender
{
    scannerVinViewController *sc = [[scannerVinViewController alloc] initWithNibName:@"scannerVinViewController" bundle:nil];
    sc.resKey = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",_label1.text,_label2.text,_label3.text,_label4.text,_label5.text,_label6.text,_label7.text,_label8.text,_label9.text,_label10.text,_label11.text,_label12.text,_label13.text,_label14.text,_label15.text,_label16.text,_label17.text];
    [self.navigationController pushViewController:sc animated:YES];
}

-(IBAction)clickFanHuiBT:(id)sender
{}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

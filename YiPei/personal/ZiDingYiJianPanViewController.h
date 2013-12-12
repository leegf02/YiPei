//
//  ZiDingYiJianPanViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-12-5.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tesseract;

@interface ZiDingYiJianPanViewController : UIViewController{
    int focusLabelNum;
}
@property(nonatomic,strong)IBOutlet UIView *buttonView;
@property(nonatomic,strong)IBOutlet UIButton *button1;
@property(nonatomic,strong)IBOutlet UIButton *button2;
@property(nonatomic,strong)IBOutlet UIButton *button3;
@property(nonatomic,strong)IBOutlet UIButton *button4;
@property(nonatomic,strong)IBOutlet UIButton *button5;
@property(nonatomic,strong)IBOutlet UIButton *button6;
@property(nonatomic,strong)IBOutlet UIButton *button7;
@property(nonatomic,strong)IBOutlet UIButton *button8;
@property(nonatomic,strong)IBOutlet UIButton *button9;
@property(nonatomic,strong)IBOutlet UIButton *button0;
@property(nonatomic,strong)IBOutlet UIButton *buttonQ;
@property(nonatomic,strong)IBOutlet UIButton *buttonW;
@property(nonatomic,strong)IBOutlet UIButton *buttonE;
@property(nonatomic,strong)IBOutlet UIButton *buttonR;
@property(nonatomic,strong)IBOutlet UIButton *buttonT;
@property(nonatomic,strong)IBOutlet UIButton *buttonY;
@property(nonatomic,strong)IBOutlet UIButton *buttonU;
@property(nonatomic,strong)IBOutlet UIButton *buttonI;
@property(nonatomic,strong)IBOutlet UIButton *buttonO;
@property(nonatomic,strong)IBOutlet UIButton *buttonP;
@property(nonatomic,strong)IBOutlet UIButton *buttonA;
@property(nonatomic,strong)IBOutlet UIButton *buttonS;
@property(nonatomic,strong)IBOutlet UIButton *buttonD;
@property(nonatomic,strong)IBOutlet UIButton *buttonF;
@property(nonatomic,strong)IBOutlet UIButton *buttonG;
@property(nonatomic,strong)IBOutlet UIButton *buttonH;
@property(nonatomic,strong)IBOutlet UIButton *buttonJ;
@property(nonatomic,strong)IBOutlet UIButton *buttonK;
@property(nonatomic,strong)IBOutlet UIButton *buttonL;
@property(nonatomic,strong)IBOutlet UIButton *buttonZ;
@property(nonatomic,strong)IBOutlet UIButton *buttonX;
@property(nonatomic,strong)IBOutlet UIButton *buttonC;
@property(nonatomic,strong)IBOutlet UIButton *buttonV;
@property(nonatomic,strong)IBOutlet UIButton *buttonB;
@property(nonatomic,strong)IBOutlet UIButton *buttonN;
@property(nonatomic,strong)IBOutlet UIButton *buttonM;

@property(nonatomic,strong)IBOutlet UIView *labelView;
@property(nonatomic,strong)IBOutlet UILabel *label1;
@property(nonatomic,strong)IBOutlet UILabel *label2;
@property(nonatomic,strong)IBOutlet UILabel *label3;
@property(nonatomic,strong)IBOutlet UILabel *label4;
@property(nonatomic,strong)IBOutlet UILabel *label5;
@property(nonatomic,strong)IBOutlet UILabel *label6;
@property(nonatomic,strong)IBOutlet UILabel *label7;
@property(nonatomic,strong)IBOutlet UILabel *label8;
@property(nonatomic,strong)IBOutlet UILabel *label9;
@property(nonatomic,strong)IBOutlet UILabel *label10;
@property(nonatomic,strong)IBOutlet UILabel *label11;
@property(nonatomic,strong)IBOutlet UILabel *label12;
@property(nonatomic,strong)IBOutlet UILabel *label13;
@property(nonatomic,strong)IBOutlet UILabel *label14;
@property(nonatomic,strong)IBOutlet UILabel *label15;
@property(nonatomic,strong)IBOutlet UILabel *label16;
@property(nonatomic,strong)IBOutlet UILabel *label17;

@property(nonatomic,strong)IBOutlet UIView *labelView1;
@property(nonatomic,strong)IBOutlet UIView *labelView2;
@property(nonatomic,strong)IBOutlet UIView *labelView3;
@property(nonatomic,strong)IBOutlet UIView *labelView4;
@property(nonatomic,strong)IBOutlet UIView *labelView5;
@property(nonatomic,strong)IBOutlet UIView *labelView6;
@property(nonatomic,strong)IBOutlet UIView *labelView7;
@property(nonatomic,strong)IBOutlet UIView *labelView8;
@property(nonatomic,strong)IBOutlet UIView *labelView9;
@property(nonatomic,strong)IBOutlet UIView *labelView10;
@property(nonatomic,strong)IBOutlet UIView *labelView11;
@property(nonatomic,strong)IBOutlet UIView *labelView12;
@property(nonatomic,strong)IBOutlet UIView *labelView13;
@property(nonatomic,strong)IBOutlet UIView *labelView14;
@property(nonatomic,strong)IBOutlet UIView *labelView15;
@property(nonatomic,strong)IBOutlet UIView *labelView16;
@property(nonatomic,strong)IBOutlet UIView *labelView17;

@property(nonatomic,strong)IBOutlet UIButton *chongPaiBT;
@property(nonatomic,strong)IBOutlet UIButton *queDingBT;
@property(nonatomic,strong)IBOutlet UIButton *FanHuiBT;

@property(nonatomic, strong)UIImage *img;
//@property (nonatomic, strong) Tesseract *tesseract;

-(IBAction)clickButton:(id)sender;

-(IBAction)clickchongPaiBT:(id)sender;

-(IBAction)clickqueDingBT:(id)sender;

-(IBAction)clickFanHuiBT:(id)sender;
@end

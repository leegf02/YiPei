//
//  JiangJiaTongZhiViewController.h
//  YiPei
//
//  Created by lixiaoxiao on 13-11-25.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface JiangJiaTongZhiViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)IBOutlet UILabel *PriceLabel;//比较价格
@property(nonatomic,strong)IBOutlet UITextField *caiGouPriceText;//采购价格
@property(nonatomic,strong)IBOutlet UITextField *caiGouNumber;//采购数量
@property(nonatomic,strong)IBOutlet UITextField *fanDian;//返点
@property(nonatomic,strong)IBOutlet UIView *paiZhaoV;
@property(nonatomic,strong)IBOutlet UIButton *paiZhaoBT;
@property(nonatomic,strong)IBOutlet UIView *zhaoPianV;
@property(nonatomic,strong)IBOutlet UIImageView *BackImage;
@property(nonatomic,strong)IBOutlet UIImageView *zhaoPian;

@property(nonatomic,strong)UIButton *leftitem;
@property(nonatomic,strong)UIButton *rightitem;
@property(nonatomic,strong) UIImagePickerController * myImagePicker;
@property(nonatomic,strong) UIImage *uploadImage;

@property(nonatomic,strong) NSString *price;//比较价格
@property(nonatomic,strong) NSString *pid;//商品ID
@property(nonatomic,strong) NSString *imagepath;

//返回
-(IBAction)clickFanHuiBT:(id)sender;

//完成
-(void)clickWangChangBT:(id)sender;

//照相按钮
-(IBAction)ZhaoXiang:(id)sender;


@end

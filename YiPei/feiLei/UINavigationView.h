//
//  UINavigationView.h
//  YiPei
//
//  Created by daichuanning on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationView : UIView


@property(nonatomic, strong) UIButton * leftButton;
@property(nonatomic, strong) UIButton * rightButton;


-(UIBarButtonItem* )setWithLeftBarItemWithFrame:(CGRect)frame withAction:(SEL)action withButtonImage:(UIImage *)image withHighlighted:(UIImage*)highlightedImage withTarget:(UIViewController *)controller;

-(UIBarButtonItem*)setWithRightBarItemWithFrame:(CGRect)frame withAction:(SEL)action withButtonImage:(UIImage *)image withHighlighted:(UIImage*)highlightedImage withTarget:(UIViewController *)controller;

-(void)initWithCenterItemWithTitle:(NSString *)title;


@end

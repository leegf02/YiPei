//
//  AppDelegate.h
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class shouYeViewController;
@class fenLeiViewController;
@class pinPaiViewController;
@class cheXingViewController;
@class CustomTabBar;
@class MyNavigationControllerViewController;

@class  ELSelectCityViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) CustomTabBar *tabBarController;
@property (strong, nonatomic) shouYeViewController *shouYeVc;
@property (strong, nonatomic) fenLeiViewController *fenLeiVc;

@property (strong, nonatomic) pinPaiViewController *pinPaiVc;
@property (strong, nonatomic) cheXingViewController *cheXingVc;
@property (strong, nonatomic) UINavigationController *shouYeNavCtrl;
@property (strong, nonatomic) UINavigationController *fenLeiNavCtrl;
@property (strong, nonatomic) UINavigationController *pinPaiNavCtrl;
@property (strong, nonatomic) UINavigationController *cheXingNavCtrl;
@property (strong, nonatomic) ELSelectCityViewController *selectCity;

@property (strong, nonatomic) MyNavigationControllerViewController *myNavController;

+(AppDelegate *)shsharedeApp;

-(void)citySelected;

@end

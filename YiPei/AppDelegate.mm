//
//  AppDelegate.m
//  YiPei
//
//  Created by lee on 13-11-21.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "allConfig.h"
#import "AppDelegate.h"
#import "shouYeViewController.h"
#import "fenLeiViewController.h"
#import "pinPaiViewController.h"
#import "cheXingViewController.h"
#import "CustomTabBar.h"

#import "ELSelectCityViewController.h"

#import "userInfo.h"

#import "userDataManager.h"
#import "model.h"


@implementation AppDelegate
@synthesize shouYeVc=_shouYeVc;
@synthesize fenLeiVc=_fenLeiVc;
@synthesize pinPaiVc=_pinPaiVc;
@synthesize cheXingVc=_cheXingVc;
@synthesize shouYeNavCtrl=_shouYeNavCtrl;
@synthesize fenLeiNavCtrl=_fenLeiNavCtrl;
@synthesize pinPaiNavCtrl=_pinPaiNavCtrl;
@synthesize cheXingNavCtrl=_cheXingNavCtrl;
@synthesize tabBarController=_tabBarController;

@synthesize selectCity=_selectCity;

static AppDelegate *appDelegate=nil;
+(AppDelegate *)shsharedeApp{
    if (appDelegate==nil) {
        appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return appDelegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    userInfo *userdb = [[userInfo alloc] init];
    [userdb creatDatabase];
    
    citySite *site  = [userdb getCityInfo];
    [userDataManager sharedUserDataManager].cityID = site.cID;
    [userDataManager sharedUserDataManager].cityName = site.cName;
    


    
    _shouYeVc=[[shouYeViewController alloc] initWithNibName:@"shouYeViewController" bundle:nil];
    _shouYeNavCtrl = [[UINavigationController alloc]initWithRootViewController:_shouYeVc];
    _shouYeNavCtrl.navigationBar.hidden=NO;

    _fenLeiVc=[[fenLeiViewController alloc] initWithNibName:@"fenLeiViewController" bundle:nil];
    _fenLeiNavCtrl = [[UINavigationController alloc]initWithRootViewController:_fenLeiVc];
    _fenLeiNavCtrl.navigationBar.hidden=NO;

    _pinPaiVc=[[pinPaiViewController alloc] initWithNibName:@"pinPaiViewController" bundle:nil];
    _pinPaiNavCtrl = [[UINavigationController alloc]initWithRootViewController:_pinPaiVc];
    _pinPaiNavCtrl.navigationBar.hidden=NO;

    _cheXingVc=[[cheXingViewController alloc] initWithNibName:@"cheXingViewController" bundle:nil];
    _cheXingNavCtrl = [[UINavigationController alloc]initWithRootViewController:_cheXingVc];
    _cheXingNavCtrl.navigationBar.hidden=NO;

    NSMutableDictionary *shouImgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [shouImgDic setObject:[UIImage imageNamed:@"menu_home.png"] forKey:@"Default"];
    [shouImgDic setObject:[UIImage imageNamed:@"menu_home.png"] forKey:@"Highlighted"];
    [shouImgDic setObject:[UIImage imageNamed:@"menu_home_press.png"] forKey:@"Seleted"];
    
    NSMutableDictionary *fenImgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [fenImgDic setObject:[UIImage imageNamed:@"menu_class.png"] forKey:@"Default"];
    [fenImgDic setObject:[UIImage imageNamed:@"menu_class.png"] forKey:@"Highlighted"];
    [fenImgDic setObject:[UIImage imageNamed:@"menu_class_press.png"] forKey:@"Seleted"];
    
    NSMutableDictionary *pinImgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [pinImgDic setObject:[UIImage imageNamed:@"menu_brand.png"] forKey:@"Default"];
    [pinImgDic setObject:[UIImage imageNamed:@"menu_brand.png"] forKey:@"Highlighted"];
    [pinImgDic setObject:[UIImage imageNamed:@"menu_brand_press.png"] forKey:@"Seleted"];
    
    NSMutableDictionary *cheImgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [cheImgDic setObject:[UIImage imageNamed:@"menu_car.png"] forKey:@"Default"];
    [cheImgDic setObject:[UIImage imageNamed:@"menu_car.png"] forKey:@"Highlighted"];
    [cheImgDic setObject:[UIImage imageNamed:@"menu_car_press.png"] forKey:@"Seleted"];

//    _tabBarController = [[LeveyTabBarController alloc] initWithViewControllers:array imageArray:imgArr];
//    _tabBarController.delegate = self;
//    _tabBarController.selectedIndex=1;
//    _tabBarController.view.frame=CGRectMake(0, 0,320, 460);
    [[UITabBar appearance] setShadowImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    _tabBarController = [[CustomTabBar alloc] init];
    _tabBarController.viewControllers = [NSArray arrayWithObjects:_shouYeNavCtrl, _fenLeiNavCtrl,_pinPaiNavCtrl,_cheXingNavCtrl, nil];
    _tabBarController.selectedIndex = 0;
    if (!site.cID) {
        _selectCity=[[ELSelectCityViewController alloc]initWithNibName:@"ELSelectCityViewController" bundle:nil];
        _selectCity.view.frame=__MainScreenFrame;
        [self.window addSubview:_selectCity.view];
    }
    else
    {
        self.window.rootViewController = _tabBarController;

    }

    return YES;
}


-(void)citySelected
{
    for (UIView *views in self.window.subviews)
    {
        [views removeFromSuperview];
    }
    if (_selectCity) {
		[_selectCity.view removeFromSuperview];
		_selectCity = nil;
    }

    [self.window addSubview:_tabBarController.view];

//    self.window.rootViewController = _tabBarController;

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

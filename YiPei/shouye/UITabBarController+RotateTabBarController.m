//
//  UITabBarController+RotateTabBarController.m
//  YiPei
//
//  Created by lee on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "UITabBarController+RotateTabBarController.h"

@implementation UITabBarController (RotateTabBarController)

-(BOOL)shouldAutorotate

{
    UINavigationController *vc = (UINavigationController *)self.selectedViewController;
    if ([vc isEqual: [self.viewControllers objectAtIndex:1]]) {
        return YES;
    }
    
    return NO;
}


-(NSUInteger)supportedInterfaceOrientations

{
    UINavigationController *vc = (UINavigationController *)self.selectedViewController;
    if ([vc isEqual: [self.viewControllers objectAtIndex:1]]) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    return UIInterfaceOrientationMaskPortrait;
}
@end

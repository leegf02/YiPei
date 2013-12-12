//
//  MyImageUtils.h
//  YiPei
//
//  Created by daichuanning on 13-12-1.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyImageUtils : NSObject



+ (UIImage *) scaleImage: (UIImage *)image width: (double) width height: (double) height;
+ (float)scaleImageBy:(UIImage *)image width: (double) width height: (double) height;
+ (void)saveImageByPath:(UIImage *)image name:(NSString *)picName;

@end

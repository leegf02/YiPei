//
//  MyImageUtils.m
//  YiPei
//
//  Created by daichuanning on 13-12-1.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "MyImageUtils.h"

@implementation MyImageUtils



+ (UIImage *) scaleImage: (UIImage *)image width: (double) width height: (double) height
{
    float scaleBy = [self scaleImageBy:image width:width height:height];
    CGSize size = CGSizeMake(image.size.width * scaleBy, image.size.height * scaleBy);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    transform = CGAffineTransformScale(transform, scaleBy, scaleBy);
    CGContextConcatCTM(context, transform);
    
    // Draw the image into the transformed context and return the image
    [image drawAtPoint:CGPointMake(0.0f, 0.0f)];
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newimg;
}

//图片压缩比例
+ (float)scaleImageBy:(UIImage *)image width: (double) width height: (double) height
{
    float toSize = 1.0;
    if (image.size.width *toSize > width) {
        toSize = width / image.size.width;
    }
    if (image.size.height *toSize > height) {
        toSize = height / image.size.height;
    }
    return toSize;
}

//保存图片
+ (void)saveImageByPath:(UIImage *)image name:(NSString *)picName
{
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:picName];
    [UIImageJPEGRepresentation(image, 0.9) writeToFile:jpgPath atomically:YES];
}



@end

//
//  userDataManager.m
//  YiPei
//
//  Created by lee on 13-11-30.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "allConfig.h"
#import "ASIHTTPRequest.h"
#import "userDataManager.h"
#import "model.h"

@implementation userDataManager
@synthesize uID;
@synthesize cityName;
@synthesize cityID;
@synthesize myCart;
@synthesize myBuy;
@synthesize myName;
@synthesize clientID;
@synthesize ver;

static userDataManager *user;

+(userDataManager*)sharedUserDataManager{
    
    @synchronized(self)
    {
        if (user == nil)
        {
            user = [[self alloc] init];
        }
    }
    return user;
}

+(id) allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (user == nil)
        {
            user = [super allocWithZone:zone];
            return user;
        }
    }
    return nil;
}

- (void)downImageWithURL:(NSString *)url PID:(NSString *)pid
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachesDirectory = [paths objectAtIndex:0];
    NSString *path = [NSString stringWithFormat:@"%@/%@",cachesDirectory,ImagePath];
    
    NSString *dPath = [NSString stringWithFormat:@"%@/%@", path, pid];
    NSLog(@"%@",dPath);
    NSData *data = [[NSData alloc ] initWithContentsOfFile:dPath];
    if(data == nil)
    {
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
        [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
        [request setSecondsToCache:60 * 60 * 24 * 30];
        
        [request startSynchronous];
        if (![request error]) {
            [request.responseData writeToFile:dPath atomically:NO];
        }
    }
    else {
#if !TARGET_IPHONE_SIMULATOR
//        [self addSkipBackupAttributeToItemAtURL:[NSURL URLWithString:dPath]];
#endif
    }
}

- (UIImage *)getDownImageByPid:(NSString *)pid
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachesDirectory = [paths objectAtIndex:0];
    NSString *path = [NSString stringWithFormat:@"%@/%@",cachesDirectory,ImagePath];
    
    NSString *dPath = [NSString stringWithFormat:@"%@/%@", path, pid];
    NSLog(@"%@",dPath);
    NSData *data = [[NSData alloc ] initWithContentsOfFile:dPath];
    if(data != nil)
    {
        return [UIImage imageWithData:data];
    }
    else {
#if !TARGET_IPHONE_SIMULATOR
//        [self addSkipBackupAttributeToItemAtURL:[NSURL URLWithString:dPath]];
#endif
    }
    return  nil;
}
@end

//
//  lowPriceFunc.m
//  YiPei
//
//  Created by lee on 13-12-3.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "lowPriceFunc.h"
#import "NetCommand.h"

@implementation lowPriceFunc
@synthesize delegateUpImage;
@synthesize delegateLow;

-(void)getImagePath:(NSData *)image
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"uploadImage" forKey:@"a"];
    
    [command execute_post:@"uploadfile" img:image];
    if (command.errorCode == 0) {
        NSLog(@"getCitySite success!");
        NSArray *path= (NSArray *)command.data;
        NSLog(@"citys=%@",path);
        if (self.delegateUpImage &&[self.delegateUpImage respondsToSelector:@selector(didUploadImageDataSuccess:)]) {
            [self.delegateUpImage performSelector:@selector(didUploadImageDataSuccess:) withObject:path];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getCitySite err!");
        if (self.delegateUpImage &&[self.delegateUpImage respondsToSelector:@selector(didUploadImageDataFailed:)]) {
            [self.delegateUpImage performSelector:@selector(didUploadImageDataFailed:) withObject:command.errorMsg];
        }
    }
}

-(void)getlowPriceNotify:(NSString *)goodID sysPrice:(NSString *)sPrice bugPrice:(NSString *)bPrice buyNo:(NSString *)num buyRebates:(NSString *)bates imagePath:(NSString *)path userID:(NSString *)uid cityID:(NSString *)city
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"lowPriceNotify" forKey:@"a"];
    [command.paramDict setObject:goodID forKey:@"goodsId"];
    [command.paramDict setObject:sPrice forKey:@"sysPrice"];
    [command.paramDict setObject:bPrice forKey:@"price"];
    [command.paramDict setObject:num forKey:@"number"];
    [command.paramDict setObject:bates forKey:@"rebates"];
    [command.paramDict setObject:path forKey:@"imgUrl"];
    [command.paramDict setObject:uid forKey:@"uid"];
    [command.paramDict setObject:city forKey:@"city"];

    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getlowPriceNotify success!");
        if (self.delegateLow &&[self.delegateLow respondsToSelector:@selector(didLowPriceNotifyDataSuccess:)]) {
            [self.delegateLow performSelector:@selector(didLowPriceNotifyDataSuccess:) withObject:nil];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getlowPriceNotify err!");
        if (self.delegateLow &&[self.delegateLow respondsToSelector:@selector(didLowPriceNotifyDataFailed:)]) {
            [self.delegateLow performSelector:@selector(didLowPriceNotifyDataFailed:) withObject:command.errorMsg];
        }
    }
}
@end

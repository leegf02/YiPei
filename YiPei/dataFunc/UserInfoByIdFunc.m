//
//  UserInfoByIdFunc.m
//  YiPei
//
//  Created by lee on 13-12-5.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "UserInfoByIdFunc.h"
#import "NetCommand.h"

@implementation UserInfoByIdFunc
@synthesize delegate;

-(void)getUserInfoById:(NSString *)uid
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"Profile" forKey:@"m"];
    [command.paramDict setObject:@"getUserInfoById" forKey:@"a"];
    [command.paramDict setObject:uid forKey:@"uid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getlowPriceNotify success!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didGetUserInfoByIdDataSuccess:)]) {
            [self.delegate performSelector:@selector(didGetUserInfoByIdDataSuccess:) withObject:command.data];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getlowPriceNotify err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didGetUserInfoByIdFailed:)]) {
            [self.delegate performSelector:@selector(didGetUserInfoByIdFailed:) withObject:command.errorMsg];
        }
    }

}

@end

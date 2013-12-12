//
//  profileFunc.m
//  YiPei
//
//  Created by lee on 13-12-5.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "profileFunc.h"
#import "NetCommand.h"

@implementation profileFunc
@synthesize delegate;

-(void) getProfileIndex:(NSString *)uid
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"Profile" forKey:@"m"];
    [command.paramDict setObject:@"index" forKey:@"a"];
    [command.paramDict setObject:uid forKey:@"uid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getlowPriceNotify success!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didProfileDataSuccess:)]) {
            [self.delegate performSelector:@selector(didProfileDataSuccess:) withObject:command.data];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getlowPriceNotify err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didProfileDataFailed:)]) {
            [self.delegate performSelector:@selector(didProfileDataFailed:) withObject:command.errorMsg];
        }
    }

}

@end

//
//  MyBillFunc.m
//  YiPei
//
//  Created by lee on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "MyBillFunc.h"

@implementation MyBillFunc
@synthesize delegate;

-(void)getMyBillByMonth:(NSString *)index getUID:(NSString *)uid clientInfo:(NSString *)clid time:(NSString *)month p:(NSString *)items{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"Profile" forKey:@"m"];
    [command.paramDict setObject:@"getMyOrderLists" forKey:@"a"];
    [command.paramDict setObject:index forKey:@"index"];
    [command.paramDict setObject:uid forKey:@"uid"];
    [command.paramDict setObject:clid forKey:@"clientsId"];
    [command.paramDict setObject:month forKey:@"t"];
    [command.paramDict setObject:items forKey:@"p"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getMyBillByMonth success!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didMyBillByMonthSuccess:)]) {
            [self.delegate performSelector:@selector(didMyBillByMonthSuccess:) withObject:command.data];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getMyBillByMonth err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didMyBillByMonthFailed:)]) {
            [self.delegate performSelector:@selector(didMyBillByMonthFailed:) withObject:command.errorMsg];
        }
    }
    
}

@end

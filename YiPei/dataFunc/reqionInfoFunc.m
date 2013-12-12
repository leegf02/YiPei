//
//  reqionInfoFunc.m
//  YiPei
//
//  Created by lee on 13-12-10.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "reqionInfoFunc.h"
@implementation reqionInfoFunc
@synthesize delegate;

- (void)getRegion:(NSString *)bypid
{
    NetCommand *command = [[NetCommand alloc] init];
    
    [command.paramDict setObject:@"Region" forKey:@"m"];
    [command.paramDict setObject:@"loadReqionInfoByPid" forKey:@"a"];
    [command.paramDict setObject:bypid forKey:@"pid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getMyBillByMonth success!");
        NSArray *arr = command.data;
        NSLog(@"arr =%@",arr);
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didReqionInfoSuccess:)]) {
            [self.delegate performSelector:@selector(didReqionInfoSuccess:) withObject:arr];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getMyBillByMonth err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didReqionInfoFailed:)]) {
            [self.delegate performSelector:@selector(didReqionInfoFailed:) withObject:command.errorMsg];
        }
    }
    

}
- (NSArray *)getRegionDirect:(NSString *)bypid
{
    NSArray *arr =nil;
    
    NetCommand *command = [[NetCommand alloc] init];
    
    [command.paramDict setObject:@"Region" forKey:@"m"];
    [command.paramDict setObject:@"loadReqionInfoByPid" forKey:@"a"];
    [command.paramDict setObject:bypid forKey:@"pid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getMyBillByMonth success!");
        arr =(NSArray *) command.data;
//        NSLog(@"arr =%@",arr);
    }
    else if (command.errorCode==1) {
        NSLog(@"getMyBillByMonth err!");
    }
    return arr;
}
@end

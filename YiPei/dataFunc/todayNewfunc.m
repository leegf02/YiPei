//
//  todayMarketfunc.m
//  YiPei
//
//  Created by lee on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "todayNewfunc.h"
#import "model.h"
#import "dataProcessProtocol.h"

#import "userDataManager.h"

@implementation todayNewfunc
@synthesize delegate;

//@synthesize callback=_callback;


- (void)getTodayNew:(NSString *)index SortPrice:(NSString *)sortp SortSale:(NSString *)sortS;
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"todayNewGoods" forKey:@"a"];
    [command.paramDict setObject:[userDataManager sharedUserDataManager].cityID forKey:@"city"];
    [command.paramDict setObject:index forKey:@"index"];
    [command.paramDict setObject:sortp forKey:@"sortPrice"];
    [command.paramDict setObject:sortS forKey:@"sortSale"];


    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"todayNewfunc success!");
        NSArray *htm = (NSArray *)command.data;
        NSLog(@"htm=%@",htm);
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didTodayNewDataSuccess:)]) {
            [self.delegate performSelector:@selector(didTodayNewDataSuccess:) withObject:htm];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"todayNewfunc err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didTodayNewDataFailed:)]) {
            [self.delegate performSelector:@selector(didTodayNewDataFailed:) withObject:command.errorMsg];
        }
    }
}

@end

//
//  goodInfoDetailFunc.m
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "allConfig.h"
#import "goodInfoDetailFunc.h"
#import "model.h"
#import "userDataManager.h"
@implementation goodInfoDetailFunc
@synthesize delegate;

- (void) getGoodInfoDetail:(NSString *)goodsID
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"getCityGoodsInfo" forKey:@"a"];
    [command.paramDict setObject:goodsID forKey:@"goodsId"];
    [command.paramDict setObject:[userDataManager sharedUserDataManager].cityID forKey:@"city"];
    [command execute];
    if (command.errorCode==0) {
        NSLog(@"getGoodInfoDetail success!");
        NSDictionary *goods = (NSDictionary *)command.data;
        NSLog(@"goods=%@",goods);
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didGoodsInfoDataSuccess:)]) {
            [self.delegate performSelector:@selector(didGoodsInfoDataSuccess:) withObject:goods];
        }
    }else if(command.errorCode==1)
    {
        NSLog(@"getGoodInfoDetail err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didGoodsInfoDataFailed:)]) {
            [self.delegate performSelector:@selector(didGoodsInfoDataFailed:) withObject:(NSString*)command.errorMsg];
        }
    }
}


@end

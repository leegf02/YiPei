//
//  searchFunc.m
//  YiPei
//
//  Created by lee on 13-11-28.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "searchFunc.h"
#import "userDataManager.h" 

@implementation searchFunc
@synthesize delegateSearchGoods;
@synthesize delegateBarcode;

@synthesize delegateVincode;


- (void)getSearchGood:(NSString *)keyword
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"searchGoods" forKey:@"a"];
    
    if (keyword) {
		NSString *stringText = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
																					(CFStringRef)keyword,
																					NULL,
																					CFSTR("!*'();:@&amp;=+$,/?%#[] "),
																					kCFStringEncodingUTF8));
        [command.paramDict setObject:stringText forKey:@"keyword"];
    }
    [command.paramDict setObject:[userDataManager sharedUserDataManager].cityID forKey:@"city"];

    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getSearchGood success!");
        NSArray *goods= (NSArray *)command.data;
        NSLog(@"goods=%@",goods);
        if (self.delegateSearchGoods &&[self.delegateSearchGoods respondsToSelector:@selector(didSearchGoodsDataSuccess:)]) {
            [self.delegateSearchGoods performSelector:@selector(didSearchGoodsDataSuccess:) withObject:goods];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getSearchGood err!");
        if (self.delegateSearchGoods &&[self.delegateSearchGoods respondsToSelector:@selector(didSearchGoodsDataFailed:)]) {
            [self.delegateSearchGoods performSelector:@selector(didSearchGoodsDataFailed:) withObject:command.errorMsg];
        }
    }
}

- (void)getSearchBarcode:(NSString *)barCode
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"searchGoodsByBarCode" forKey:@"a"];
    [command.paramDict setObject:barCode forKey:@"barCode"];
    [command.paramDict setObject:[userDataManager sharedUserDataManager].cityID forKey:@"city"];
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getSearchBarcode success!");
        NSArray *goods= (NSArray *)command.data;
        NSLog(@"goods=%@",goods);
        if (self.delegateBarcode &&[self.delegateBarcode respondsToSelector:@selector(didSearchGoodsByBarCodeDataSuccess:)]) {
            [self.delegateBarcode performSelector:@selector(didSearchGoodsByBarCodeDataSuccess:) withObject:goods];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getSearchBarcode err!");
        if (self.delegateBarcode &&[self.delegateBarcode respondsToSelector:@selector(didSearchGoodsByBarCodeDataFailed:)]) {
            [self.delegateBarcode performSelector:@selector(didSearchGoodsByBarCodeDataFailed:) withObject:command.errorMsg];
        }
    }
}

- (void)getSearchVincode:(NSString *)vinCode
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"searchGoodsByVinCode" forKey:@"a"];
    [command.paramDict setObject:vinCode forKey:@"vinCode"];
    //  [command.paramDict setObject:id forKey:@"city"];
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getSearchVincode success!");
        NSArray *goods= (NSArray *)command.data;
        NSLog(@"goods=%@",goods);
        if (self.delegateVincode &&[self.delegateVincode respondsToSelector:@selector(didSearchGoodsByVinCodeDataSuccess:)]) {
            [self.delegateVincode performSelector:@selector(didSearchGoodsByVinCodeDataSuccess:) withObject:goods];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getSearchVincode err!");
        if (self.delegateVincode &&[self.delegateVincode respondsToSelector:@selector(didSearchGoodsByVinCodeDataFailed:)]) {
            [self.delegateVincode performSelector:@selector(didSearchGoodsByVinCodeDataFailed:) withObject:command.errorMsg];
        }
    }
}
@end

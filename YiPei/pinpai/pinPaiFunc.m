//
//  pinPaiFunc.m
//  YiPei
//
//  Created by daichuanning on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "pinPaiFunc.h"
#import "NetCommand.h"


@implementation pinPaiFunc

@synthesize delegateGoodsCateByBrand;
@synthesize delegateAllBrand;

- (void)getGoodsAllBrand:(NSString *)sortByLetter
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsAllBrand" forKey:@"a"];
    if (sortByLetter.length>0) {
        [command.paramDict setObject:sortByLetter forKey:@"sortByLetter"];
    }
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsCateByPid success!");
        NSArray *goodsCate = [self getGoodsAllBrandCommandData:command.data];
        NSLog(@"goodsCate=%@",goodsCate);
        if (self.delegateAllBrand &&[self.delegateAllBrand respondsToSelector:@selector(didGoodsAllBrandDataSuccess:)]) {
            [self.delegateAllBrand performSelector:@selector(didGoodsAllBrandDataSuccess:) withObject:goodsCate];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        if (self.delegateAllBrand &&[self.delegateAllBrand respondsToSelector:@selector(didGoodsAllBrandDataFailed:)]) {
            [self.delegateAllBrand performSelector:@selector(didGoodsAllBrandDataFailed:) withObject:command.errorMsg];
        }
    }
    
}
-(NSMutableArray*)getGoodsAllBrandCommandData:(id)data{
    NSArray *cbData = (NSArray *)data;
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    if (cbData==NULL) {
        return nil;
    }
    NSMutableDictionary * tempDic ;
    for (int i=0; i<cbData.count; i++) {
        
        dic = [[NSMutableDictionary alloc] init];
        
        tempDic = [[NSMutableDictionary alloc] initWithDictionary:[cbData objectAtIndex:i]];
        
        [dic setValue:[tempDic objectForKey:@"brand_id"] forKey:@"brand_id"];
        [dic setValue:[tempDic objectForKey:@"brand_name"] forKey:@"brand_name"];
        [dic setValue:[tempDic objectForKey:@"first_letter"] forKey:@"first_letter"];
        [dic setValue:[tempDic objectForKey:@"brand_logo"] forKey:@"brand_logo"];
        [dic setValue:[tempDic objectForKey:@"brand_desc"] forKey:@"brand_desc"];
        [dic setValue:[tempDic objectForKey:@"site_url"] forKey:@"site_url"];
                NSLog(@"[tempDic objectForKey:@""]===%@",[tempDic objectForKey:@"values"]);
        
        
        [dataArray addObject:dic];
        
        dic = nil;
        tempDic = nil;
        
    }
    return dataArray;
    
    
}
//根据供应商品牌获取其生产的所有配件分类：
-(NSArray *)getGoodsCategoryByBrand:(NSString *)brandId{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsCategoryByBrand" forKey:@"a"];
    [command.paramDict setObject:@"52" forKey:@"city"];
    if (brandId.length>1) {
        [command.paramDict setObject:brandId forKey:@"brandId"];
        
    }
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByCategoryId success!");
        
        //        NSArray *goodsCate = (NSArray *)command.data;
        NSArray * goodsCate = [self getGoodsCategoryByBrandCommandData:command.data];
        return goodsCate;
        /*
        NSLog(@"goodsCate=%@",goodsCate);
        NSLog(@"%@",goodsCate);
        
        if ([self.delegateGoodsCateByBrand respondsToSelector:@selector(didGoodsCategoryByBrandDataSuccess:)]) {
            [self.delegateGoodsCateByBrand didGoodsCategoryByBrandDataSuccess:goodsCate];
        }
        //        return goodsCate;
         */
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        /*
        if ([self.delegateGoodsCateByBrand respondsToSelector:@selector(didGoodsCategoryByBrandDataFailed:)]) {
            [self.delegateGoodsCateByBrand didGoodsCategoryByBrandDataFailed:command.errorMsg];
        }*/
        
                return nil;
    }
        return nil;
    
}

//根据供应商品牌获取其生产的所有配件分类：
-(NSMutableArray*)getGoodsCategoryByBrandCommandData:(id)data{
    NSArray *cbData = (NSArray *)data;
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    
    NSMutableDictionary * tempDic ;
    for (int i=0; i<cbData.count; i++) {
        
        dic = [[NSMutableDictionary alloc] init];
        
        tempDic = [[NSMutableDictionary alloc] initWithDictionary:[cbData objectAtIndex:i]];
        
        [dic setValue:[tempDic objectForKey:@"cat_id"] forKey:@"cat_id"];
        [dic setValue:[tempDic objectForKey:@"cat_name"] forKey:@"cat_name"];
        [dic setValue:[tempDic objectForKey:@"parent_id"] forKey:@"parent_id"];
        [dic setValue:[tempDic objectForKey:@"filter_attr"] forKey:@"filter_attr"];
        [dic setValue:[tempDic objectForKey:@"category_thumb"] forKey:@"category_thumb"];
        [dic setValue:[tempDic objectForKey:@"category_img"] forKey:@"category_img"];
        
        [dic setValue:[tempDic objectForKey:@"original_img"] forKey:@"original_img"];
        
        
        
        [dataArray addObject:dic];
        
        dic = nil;
        tempDic = nil;
        
    }
    return dataArray;
    
    
}
@end

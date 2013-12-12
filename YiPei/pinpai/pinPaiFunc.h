//
//  pinPaiFunc.h
//  YiPei
//
//  Created by daichuanning on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "dataProcessProtocol.h"
@interface pinPaiFunc : NSObject
{
    id<dataGoodsAllBrandProcessProtocol>delegateAllBrand;
    id<dataGoodsCategoryByBrandProcessProtocol>delegateGoodsCateByBrand;

   
}

@property(nonatomic ,retain) id delegateGoodsCateByBrand;
@property(nonatomic ,retain) id delegateAllBrand;

//sortByLetter 如果不传默认全部         sortByLetter    按照首字母排序（0：降序排列1：升序排列）    可选,不提供，不按照首字母排序
- (void)getGoodsAllBrand:(NSString *)sortByLetter;

//根据供应商品牌获取其生产的所有配件分类：
-(NSArray *)getGoodsCategoryByBrand:(NSString *)brandId;
@end

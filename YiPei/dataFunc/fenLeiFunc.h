//
//  fenLeiFunc.h
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "dataProcessProtocol.h"

@interface fenLeiFunc : NSObject
{
    id<dataLoadCarInfoByPidProcessProtocol>delegateCarInfoByPid;
    id<dataLoadCarInfoByLevelProcessProtocol>delegateCarInfoByLevel;
    id<dataGoodsCategoryByPidProcessProtocol>delegateGoodsCateByPid;
    id<dataGoodsAllBrandProcessProtocol>delegateGoodsAllBrand;
    id<dataGoodsListProcessProtocol>delegateGoodsList;
    id<dataFilterAttrByCateProcessProtocol>delegateFilterAtrrByCate;
    id<dataGoodsCarModelByCateProcessProtocol>delegateGoodsCarByCate;
    id<dataGoodsCategoryByBrandProcessProtocol>delegateGoodsCateByBrand;
    id<dataGoodsBrandByCateProcessProtocol>delegateGoodsBrandByCate;
    
    id<dataGoodsBrandByCarModelProcessProtocol>delegateBrandByCarModel;
    
    id<dataGoodsCategoryByCarModelProcessProtocol>delegateCategoryByCarModel;
//    id<dataGoodsAllBrandProcessProtocol>delegateGoodsAllBrand;
}

@property(nonatomic ,retain) id delegateCarInfoByPid;
@property(nonatomic ,retain) id delegateCarInfoByLevel;

@property(nonatomic ,retain) id delegateGoodsCateByPid;
@property(nonatomic ,retain) id delegateGoodsAllBrand;

@property(nonatomic ,retain) id delegateGoodsList;
@property(nonatomic ,retain) id delegateFilterAtrrByCate;

@property(nonatomic ,retain) id delegateGoodsCarByCate;
@property(nonatomic ,retain) id delegateGoodsCateByBrand;
@property(nonatomic ,retain) id delegateGoodsBrandByCate;
@property(nonatomic, strong) id delegateBrandByCarModel;
@property(nonatomic,strong) id delegateCategoryByCarModel;
- (void)getCarInfoByPid:(NSString *)pid;
- (void)getCarInfoByLevel:(NSString *)level;//level  车型数据等级（1：品牌2：车系3：排量4：年款）
- (void)getGoodsCateByPid:(NSString *)pid;
- (void)getGoodsAllBrand:(NSString *)firstLetter sortBy:(NSString *)sort;//是否按照首字母排序升序排列（0：否1：是）
- (void)getGoodsAllBrand:(NSString *)firstLetter;

- (NSArray *)getGoodsSubCateByPId:(NSString *)pid;


/*
 参数信息：city   当前选择的城市站    integer 必须
 *          categoryId  配件分类id  integer
 *          brandId     配件品牌id  integer
 *          carModel    适用车型id  integer
 *          carGeneral  是否是通用配件（0：否 1：是） 默认是0，不是通用配件
 *          sortPrice   按照价格排序（0：升序 1：降序）默认不按价格排序
 *          sortSale    按照销量排序（0：升序 1：降序）默认不按销量排序
 *          index       分页页码（0：表示第一页）   integer
 *          filterAttr  筛选属性值，注意属性值顺序要跟配件分类设置的属性相同     string  需要根据不同的配件分类传递不同的值，例如：汽机油（配件）具有四个属性，
 *                      分别为：类别，级别，粘度，容量；则每次传入的筛选属性值为：xx.xxx.xxxx.xxxxx，如果没有选中的属性值，设置为0
 *
 
 api.com/index.php?m= GoodsCategory&a=getGoodsList
 &city=城市id&categoryId=配件分类&carModel =车型id
 &carGeneral =是否是通用配件（1：是0：否，取代之前选定的唯一车型）
 &brandId=配件品牌&filterAttr=筛选属性&sortPrice=价格排序（0：降序，1：升序）
 &sortSale=销量（0：降序，1：升序）&index=当前页数（0表示第一页）
 */
-(void )getGoodsSubCateByCategoryId:(NSString *)categoryId withCarModel:(NSString *)carModel
                     withCarGeneral:(NSString *)carGeneral withBrandId:(NSString *)brandId
                     withFilterAttr:(NSString *)filterAttr withSortPrice:(NSString *)sortPrice
                       withSortSale:(NSString*)sortSale withIndex:(NSString*)index;

//根据商品分类获取筛选条件
-(void)getFilterAttrByCategory:(NSString *)categoryId;

//根据商品分类获取筛选条件 这个返回的是一个数组
-(NSArray *)getFilterAttrByCategoryReturnData:(NSString *)categoryId;
//根据配件分类获取生产该类型配件的品牌：

-(void)getGoodsBrandByCategory:(NSString *)categoryId;
//根据供应商品牌获取其生产的所有配件分类：
-(void)getGoodsCategoryByBrand:(NSString *)brandId;

//根据车型获取生产适用于该车型配件的配件品牌：

-(void)getGoodsBrandByCarModel:(NSString*)carModel;

//根据车型获取适用于该车型的配件分类：

-(void)getGoodsCategoryByCarModel :(NSString*)carModel;

//根据车型父级分类，获取该父级分类下面的所有子分类信息
-(void)loadCarInfoByPid:(NSString *)pid;

//根据车型父级分类，获取该父级分类下面的所有子分类信息 用于返回一个新的数组
-(NSArray*)loadCarInfoByPidForReturnArray:(NSString *)pid;


@end

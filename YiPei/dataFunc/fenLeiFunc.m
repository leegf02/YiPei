//
//  fenLeiFunc.m
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "NetCommand.h"
#import "fenLeiFunc.h"

@implementation fenLeiFunc

@synthesize delegateCarInfoByPid;
@synthesize delegateCarInfoByLevel;

@synthesize delegateGoodsCateByPid;
@synthesize delegateGoodsAllBrand;

@synthesize delegateGoodsList;
@synthesize delegateFilterAtrrByCate;

@synthesize delegateGoodsCarByCate;
@synthesize delegateGoodsCateByBrand;

- (void)getGoodsCateByPid:(NSString *)pid
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsCategoryByPid" forKey:@"a"];
    [command.paramDict setObject:pid forKey:@"pid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsCateByPid success!");
        NSArray *goodsCate = (NSArray *)command.data;
        NSLog(@"goodsCate=%@",goodsCate);
        if (self.delegateGoodsCateByPid &&[self.delegateGoodsCateByPid respondsToSelector:@selector(didGoodsCategoryByPidDataSuccess:)]) {
            [self.delegateGoodsCateByPid performSelector:@selector(didGoodsCategoryByPidDataSuccess:) withObject:goodsCate];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        if (self.delegateGoodsCateByPid &&[self.delegateGoodsCateByPid respondsToSelector:@selector(didGoodsCategoryByPidDataFailed:)]) {
            [self.delegateGoodsCateByPid performSelector:@selector(didGoodsCategoryByPidDataFailed:) withObject:command.errorMsg];
        }
    }
 
}

- (NSArray *)getGoodsSubCateByPId:(NSString *)pid
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsCategoryByPid" forKey:@"a"];
    [command.paramDict setObject:pid forKey:@"pid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByPId success!");
        NSArray *goodsCate = (NSArray *)command.data;
        NSLog(@"goodsCate=%@",goodsCate);
        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        return nil;
    }
    return nil;
}

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
                       withSortSale:(NSString*)sortSale withIndex:(NSString*)index{
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsList" forKey:@"a"];
    [command.paramDict setObject:@"52" forKey:@"city"];
    if (categoryId.length>1) {
        [command.paramDict setObject:categoryId forKey:@"categoryId"];

    }
    if (carModel.length>1) {
         [command.paramDict setObject:carModel forKey:@"carModel"];
    }
    if (carGeneral.length>1) {
         [command.paramDict setObject:carGeneral forKey:@"carGeneral"];
    }
    if (brandId.length>1) {
         [command.paramDict setObject:brandId forKey:@"brandId"];
    }
    
    if (filterAttr.length>1) {
         [command.paramDict setObject:filterAttr forKey:@"filterAttr"];
    }
    
    if (sortPrice.length>1) {
         [command.paramDict setObject:sortPrice forKey:@"sortPrice"];
    }
    if (sortSale.length>1) {
         [command.paramDict setObject:sortSale forKey:@"sortSale"];
    }
    if (index.length>1) {
         [command.paramDict setObject:index forKey:@"index"];
    }
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByCategoryId success!");
//        NSArray *goodsCate = (NSArray *)command.data;
        NSArray * goodsCate = [self getGoodsSubCateByCategoryIdCommandData:command.data];
        NSLog(@"goodsCate=%@",goodsCate);
        
        if ([self.delegateGoodsList respondsToSelector:@selector(didGoodsListDataSuccess:)]) {
            [self.delegateGoodsList didGoodsListDataSuccess:goodsCate];
        }
//        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        
        if ([self.delegateGoodsList respondsToSelector:@selector(didGoodsListDataFailed:)]) {
            [self.delegateGoodsList didGoodsListDataFailed:command.errorMsg];
        }
//        return nil;
    }
//    return nil;
    
}
-(NSMutableArray*)getGoodsSubCateByCategoryIdCommandData:(id)data{
    NSArray *cbData = (NSArray *)data;
    
    NSLog(@"cbData ==%@",cbData);
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;

    NSMutableDictionary * tempDic ;
    for (int i=0; i<cbData.count; i++) {
        
        dic = [[NSMutableDictionary alloc] init];
      
        tempDic = [[NSMutableDictionary alloc] initWithDictionary:[cbData objectAtIndex:i]];
        NSString * vualStr;
        vualStr = [tempDic objectForKey:@"min_price"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"min_price"];

            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"market_price"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"market_price"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"goods_id"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"goods_id"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"supplier_id"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"supplier_id"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"goods_sn"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"goods_sn"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"factory_code"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"factory_code"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"barcode"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"barcode"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"goods_format"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"goods_format"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"goods_sale_amount"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"goods_sale_amount"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"package_format"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"package_format"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"product_company"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"product_company"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"goods_thumb"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"goods_thumb"];
            
            vualStr = nil;
        }
        
        vualStr = [tempDic objectForKey:@"goods_name"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"goods_name"];
            
            vualStr = nil;
        }
        
        
        
        vualStr = [tempDic objectForKey:@"goods_img"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"goods_img"];
            
            vualStr = nil;
        }
        vualStr = [tempDic objectForKey:@"original_img"];
        if (![vualStr isEqualToString:@"null" ]) {
            [dic setValue:vualStr forKey:@"original_img"];
            
            vualStr = nil;
        }
//        [dic setValue:[tempDic objectForKey:@"min_price"] forKey:@"min_price"];
//        [dic setValue:[tempDic objectForKey:@"market_price"] forKey:@"market_price"];
//        [dic setValue:[tempDic objectForKey:@"goods_id"] forKey:@"goods_id"];
//        
//        [dic setValue:[tempDic objectForKey:@"supplier_id"] forKey:@"supplier_id"];
//        [dic setValue:[tempDic objectForKey:@"goods_sn"] forKey:@"goods_sn"];
//        [dic setValue:[tempDic objectForKey:@"factory_code"] forKey:@"factory_code"];

//        [dic setValue:[tempDic objectForKey:@"barcode"] forKey:@"barcode"];
//        [dic setValue:[tempDic objectForKey:@"goods_format"] forKey:@"goods_format"];
//        [dic setValue:[tempDic objectForKey:@"goods_name"] forKey:@"goods_name"];
//
//        [dic setValue:[tempDic objectForKey:@"goods_sale_amount"] forKey:@"goods_sale_amount"];
//        [dic setValue:[tempDic objectForKey:@"package_format"] forKey:@"package_format"];
//        [dic setValue:[tempDic objectForKey:@"product_company"] forKey:@"product_company"];
//        [dic setValue:[tempDic objectForKey:@"goods_thumb"] forKey:@"goods_thumb"];
//        [dic setValue:[tempDic objectForKey:@"goods_img"] forKey:@"goods_img"];
//        [dic setValue:[tempDic objectForKey:@"original_img"] forKey:@"original_img"];
        
        
        [dataArray addObject:dic];
        dic = nil;
        tempDic = nil;
    }
    return dataArray;
    

}
//根据车型父级分类，获取该父级分类下面的所有子分类信息
-(void)loadCarInfoByPid:(NSString *)pid{
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CarCategory" forKey:@"m"];
    [command.paramDict setObject:@"loadCarInfoByPid" forKey:@"a"];
    [command.paramDict setObject:pid forKey:@"pid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsCateByPid success!");
        NSArray *goodsCate = [self getCarInfoByPidCommandData:command.data];
        NSLog(@"goodsCate=%@",goodsCate);
        
        NSLog(@"delegate = %@",self.delegateCarInfoByPid);
        if ([self.delegateCarInfoByPid respondsToSelector:@selector(didLoadCarInfoByPidDataSuccess:)]) {
            [self.delegateCarInfoByPid performSelector:@selector(didLoadCarInfoByPidDataSuccess:) withObject:goodsCate];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        if (self.delegateCarInfoByPid &&[self.delegateGoodsCateByPid respondsToSelector:@selector(didLoadCarInfoByPidDataFailed:)]) {
            [self.delegateGoodsCateByPid performSelector:@selector(didLoadCarInfoByPidDataFailed:) withObject:command.errorMsg];
        }
    }
    
//didLoadCarInfoByPidDataFailed
    
    
}

-(NSMutableArray*)getCarInfoByPidCommandData:(id)data{
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
        
        [dic setValue:[tempDic objectForKey:@"id"] forKey:@"id"];
        [dic setValue:[tempDic objectForKey:@"name"] forKey:@"name"];
        [dic setValue:[tempDic objectForKey:@"power"] forKey:@"power"];
        
        
        [dic setValue:[tempDic objectForKey:@"first_word"] forKey:@"first_word"];
        [dic setValue:[tempDic objectForKey:@"sort"] forKey:@"sort"];
        [dic setValue:[tempDic objectForKey:@"pid"] forKey:@"pid"];
        [dic setValue:[tempDic objectForKey:@"series"] forKey:@"series"];
        [dic setValue:[tempDic objectForKey:@"brand"] forKey:@"brand"];
        [dic setValue:[tempDic objectForKey:@"company"] forKey:@"company"];
        [dic setValue:[tempDic objectForKey:@"country"] forKey:@"country"];
        
        
        [dic setValue:[tempDic objectForKey:@"car_type"] forKey:@"car_type"];
        [dic setValue:[tempDic objectForKey:@"car_level"] forKey:@"car_level"];
        [dic setValue:[tempDic objectForKey:@"import_info"] forKey:@"import_info"];
        [dic setValue:[tempDic objectForKey:@"logo"] forKey:@"logo"];
       
       
        NSLog(@"[tempDic objectForKey:@""]===%@",[tempDic objectForKey:@"values"]);
        
        
        [dataArray addObject:dic];
        
        dic = nil;
        tempDic = nil;
        
    }
    return dataArray;
    
    
}


//根据车型父级分类，获取该父级分类下面的所有子分类信息 用于返回一个新的数组
-(NSArray*)loadCarInfoByPidForReturnArray:(NSString *)pid{
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"CarCategory" forKey:@"m"];
    [command.paramDict setObject:@"loadCarInfoByPid" forKey:@"a"];
    [command.paramDict setObject:pid forKey:@"pid"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsCateByPid success!");
        NSArray *goodsCate = [self getCarInfoByPidCommandData:command.data];
        NSLog(@"goodsCate=%@",goodsCate);
        return goodsCate;
        NSLog(@"delegate = %@",self.delegateCarInfoByPid);
        
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        return nil;
    }
    return nil;
    //didLoadCarInfoByPidDataFailed
    
    
}

//根据商品分类获取筛选条件
-(void)getFilterAttrByCategory:(NSString *)categoryId {
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getFilterAttrByCategory" forKey:@"a"];
    [command.paramDict setObject:@"52" forKey:@"city"];
    if (categoryId.length>1) {
        [command.paramDict setObject:categoryId forKey:@"categoryId"];
        
    }
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByCategoryId success!");
        //        NSArray *goodsCate = (NSArray *)command.data;
        NSArray * goodsCate = [self getFilterAttrByCategoryCommandData:command.data];
//        NSLog(@"goodsCate=%@",goodsCate);
        
        if ([self.delegateFilterAtrrByCate respondsToSelector:@selector(didFilterAttrByCateDataSuccess:)]) {
            [self.delegateFilterAtrrByCate didFilterAttrByCateDataSuccess:goodsCate];
        }
        //        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        
        if ([self.delegateFilterAtrrByCate respondsToSelector:@selector(didFilterAttrByCateDataFailed:)]) {
            [self.delegateFilterAtrrByCate didFilterAttrByCateDataFailed:command.errorMsg];
        }
        //        return nil;
    }
    //    return nil;

}

-(NSMutableArray*)getFilterAttrByCategoryCommandData:(id)data{
    NSArray *cbData = (NSArray *)data;
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    
    NSMutableDictionary * tempDic ;
    for (int i=0; i<cbData.count; i++) {
        
        dic = [[NSMutableDictionary alloc] init];
        
        tempDic = [[NSMutableDictionary alloc] initWithDictionary:[cbData objectAtIndex:i]];
        
        [dic setValue:[tempDic objectForKey:@"id"] forKey:@"id"];
        [dic setValue:[tempDic objectForKey:@"name"] forKey:@"name"];
        [dic setValue:[tempDic objectForKey:@"values"] forKey:@"values"];
        
        NSLog(@"[tempDic objectForKey:@""]===%@",[tempDic objectForKey:@"values"]);
      
        
        [dataArray addObject:dic];
        
        dic = nil;
        tempDic = nil;
        
    }
    return dataArray;
    
    
}

//根据商品分类获取筛选条件 这个返回的是一个数组
-(NSArray *)getFilterAttrByCategoryReturnData:(NSString *)categoryId {
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getFilterAttrByCategory" forKey:@"a"];
    [command.paramDict setObject:@"52" forKey:@"city"];
//    if (categoryId.length>1) {
        [command.paramDict setValue:categoryId forKey:@"categoryId"];
        
//    }
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByCategoryId success!");
        //        NSArray *goodsCate = (NSArray *)command.data;
        NSArray * goodsCate = [self getFilterAttrByCategoryCommandData:command.data];
        //        NSLog(@"goodsCate=%@",goodsCate);
        
        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        
        
               return nil;
    }
      return nil;
    
}


//- (void) didFilterAttrByCateDataSuccess : (id)data;
//- (void) didFilterAttrByCateDataFailed : (NSString *)err;
//根据配件分类获取生产该类型配件的品牌：

-(void)getGoodsBrandByCategory:(NSString *)categoryId{
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsBrandByCategory" forKey:@"a"];
    [command.paramDict setObject:@"52" forKey:@"city"];
    if (categoryId.length>1) {
        [command.paramDict setObject:categoryId forKey:@"categoryId"];
        
    }
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByCategoryId success!");
        //        NSArray *goodsCate = (NSArray *)command.data;
        NSArray * goodsCate = [self getGoodsBrandByCategoryCommandData:command.data];
        NSLog(@"goodsCate=%@",goodsCate);
        
        if ([self.delegateGoodsBrandByCate respondsToSelector:@selector(didGoodsBrandByCateDataSuccess:)]) {
            [self.delegateGoodsBrandByCate didGoodsBrandByCateDataSuccess:goodsCate];
        }
        //        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        
        if ([self.delegateGoodsBrandByCate respondsToSelector:@selector(didGoodsBrandByCateDateFailed:)]) {
            [self.delegateGoodsBrandByCate didGoodsBrandByCateDateFailed:command.errorMsg];
        }
        //        return nil;
    }
    //    return nil;
    
    
}


-(NSMutableArray*)getGoodsBrandByCategoryCommandData:(id)data{
    NSArray *cbData = (NSArray *)data;
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    
    NSMutableDictionary * tempDic ;
    for (int i=0; i<cbData.count; i++) {
        
        dic = [[NSMutableDictionary alloc] init];
        
        tempDic = [[NSMutableDictionary alloc] initWithDictionary:[cbData objectAtIndex:i]];
        
//        [dic setValue:[tempDic objectForKey:@"brand_id"] forKey:@"brand_id"];
        [dic setValue:[tempDic objectForKey:@"brand_id"] forKey:@"goods_attr_id"];
//        [dic setValue:[tempDic objectForKey:@"brand_name"] forKey:@"brand_name"];
        [dic setValue:[tempDic objectForKey:@"brand_name"] forKey:@"attr_value"];
        [dic setValue:[tempDic objectForKey:@"first_letter"] forKey:@"first_letter"];
        [dic setValue:[tempDic objectForKey:@"brand_logo"] forKey:@"brand_logo"];
        [dic setValue:[tempDic objectForKey:@"brand_desc"] forKey:@"brand_desc"];
        [dic setValue:[tempDic objectForKey:@"site_url"] forKey:@"site_url"];

        
        
        
        [dataArray addObject:dic];
        
        dic = nil;
        tempDic = nil;
        
    }
    return dataArray;
    
    
}
//根据供应商品牌获取其生产的所有配件分类：
-(void)getGoodsCategoryByBrand:(NSString *)brandId{
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
        NSLog(@"goodsCate=%@",goodsCate);
        NSLog(@"%@",goodsCate);
        
        if ([self.delegateGoodsCateByBrand respondsToSelector:@selector(didGoodsCategoryByBrandDataSuccess:)]) {
            [self.delegateGoodsCateByBrand didGoodsCategoryByBrandDataSuccess:goodsCate];
        }
        //        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        
        if ([self.delegateGoodsCateByBrand respondsToSelector:@selector(didGoodsCategoryByBrandDataFailed:)]) {
            [self.delegateGoodsCateByBrand didGoodsCategoryByBrandDataFailed:command.errorMsg];
        }
        //        return nil;
    }
    //    return nil;

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
//根据车型获取生产适用于该车型配件的配件品牌：

-(void)getGoodsBrandByCarModel:(NSString*)carModel{
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsBrandByCarModel" forKey:@"a"];
    [command.paramDict setObject:@"52" forKey:@"city"];
    if (carModel.length>1) {
        [command.paramDict setObject:carModel forKey:@"carModel"];
        
    }
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByCategoryId success!");
        //        NSArray *goodsCate = (NSArray *)command.data;
        NSArray * goodsCate = [self getGoodsBrandByCarModelCommandData:command.data];
        NSLog(@"goodsCate=%@",goodsCate);
        
        if ([self.delegateBrandByCarModel respondsToSelector:@selector(didGoodsBrandByCarModelDataSuccess:)]) {
            [self.delegateBrandByCarModel didGoodsBrandByCarModelDataSuccess:goodsCate];
        }
        //        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        
        if ([self.delegateBrandByCarModel respondsToSelector:@selector(didGoodsBrandByCarModelDataFailed:)]) {
            [self.delegateBrandByCarModel didGoodsBrandByCarModelDataFailed:command.errorMsg];
        }
        //        return nil;
    }
    //    return nil;
    
}


-(NSMutableArray*)getGoodsBrandByCarModelCommandData:(id)data{
    NSArray *cbData = (NSArray *)data;
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    
    NSMutableDictionary * tempDic ;
    for (int i=0; i<cbData.count; i++) {
        
        dic = [[NSMutableDictionary alloc] init];
        
        tempDic = [[NSMutableDictionary alloc] initWithDictionary:[cbData objectAtIndex:i]];
        
        [dic setValue:[tempDic objectForKey:@"brand_id "] forKey:@"brand_id "];
        [dic setValue:[tempDic objectForKey:@"brand_name"] forKey:@"brand_name"];
        [dic setValue:[tempDic objectForKey:@"first_letter"] forKey:@"first_letter"];
        [dic setValue:[tempDic objectForKey:@"brand_logo"] forKey:@"brand_logo"];
        [dic setValue:[tempDic objectForKey:@"brand_desc"] forKey:@"brand_desc"];
        [dic setValue:[tempDic objectForKey:@"site_url"] forKey:@"site_url"];
        
        
       
        
        [dataArray addObject:dic];
        
        dic = nil;
        tempDic = nil;
        
    }
    return dataArray;
    
    
}


//根据车型获取适用于该车型的配件分类：

-(void)getGoodsCategoryByCarModel :(NSString*)carModel{
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsCategoryByCarModel" forKey:@"a"];
    [command.paramDict setObject:@"52" forKey:@"city"];
    if (carModel.length>1) {
        [command.paramDict setObject:carModel forKey:@"carModel"];
        
    }
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByCategoryId success!");
        //        NSArray *goodsCate = (NSArray *)command.data;
        NSArray * goodsCate = [self getGoodsBrandByCarModelCommandData:command.data];
        NSLog(@"goodsCate=%@",goodsCate);
        
        if ([self.delegateCategoryByCarModel respondsToSelector:@selector(didGoodsCategoryByCarModelDataSuccess:)]) {
            [self.delegateCategoryByCarModel didGoodsCategoryByCarModelDataSuccess:goodsCate];
        }
        //        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        
        if ([self.delegateCategoryByCarModel respondsToSelector:@selector(didGoodsCategoryByCarModelDataFailed:)]) {
            [self.delegateCategoryByCarModel didGoodsCategoryByCarModelDataFailed:command.errorMsg];
        }
        //        return nil;
    }
    //    return nil;
    
}

-(NSMutableArray*)getGoodsCategoryByCarModelCommandData:(id)data{
    NSArray *cbData = (NSArray *)data;
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * dic ;
    
    NSMutableDictionary * tempDic ;
    for (int i=0; i<cbData.count; i++) {
        
        dic = [[NSMutableDictionary alloc] init];
        
        tempDic = [[NSMutableDictionary alloc] initWithDictionary:[cbData objectAtIndex:i]];
        
        [dic setValue:[tempDic objectForKey:@"cat_id "] forKey:@"cat_id "];
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



-(void)getGoodsAllBrand{
    
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"GoodsCategory" forKey:@"m"];
    [command.paramDict setObject:@"getGoodsAllBrand" forKey:@"a"];
    [command.paramDict setObject:@"52" forKey:@"city"];
//    if (carModel.length>1) {
//        [command.paramDict setObject:carModel forKey:@"categoryId"];
//        
//    }
    
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getGoodsSubCateByCategoryId success!");
        //        NSArray *goodsCate = (NSArray *)command.data;
        NSArray * goodsCate = [self getGoodsBrandByCarModelCommandData:command.data];
        NSLog(@"goodsCate=%@",goodsCate);
        
        if ([self.delegateGoodsAllBrand respondsToSelector:@selector(didGoodsAllBrandDataSuccess:)]) {
            [self.delegateGoodsAllBrand didGoodsAllBrandDataSuccess:goodsCate];
        }
        //        return goodsCate;
    }
    else if (command.errorCode==1) {
        NSLog(@"getGoodsCateByPid err!");
        
        if ([self.delegateGoodsAllBrand respondsToSelector:@selector(didGoodsAllBrandDataFailed:)]) {
            [self.delegateGoodsAllBrand didGoodsAllBrandDataFailed:command.errorMsg];
        }
        //        return nil;
    }
    //    return nil;

}

@end

//
//  dataProcessProtocol.h
//  YiPei
//
//  Created by lee on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol dataTodayNewProcessProtocol <NSObject>
@required
- (void) didTodayNewDataSuccess : (id)data;
- (void) didTodayNewDataFailed : (NSString *)err;
@end

@protocol dataTodayDiscountProcessProtocol <NSObject>
@required
- (void) didTodayDiscountDataSuccess : (id)data;
- (void) didTodayDiscountDataFailed : (NSString *)err;
@end

@protocol dataGoodsInfoProcessProtocol <NSObject>
@required
- (void) didGoodsInfoDataSuccess : (id)data;
- (void) didGoodsInfoDataFailed : (NSString *)err;

@end

//@protocol dataGoodsInfoProcessProtocol <NSObject>
//@required
//- (void) didGoodsInfoDataSuccess : (NSString *)data;
//- (void) didGoodsInfoDataFailed : (NSString *)err;
//
//@end

@protocol dataUploadImagedProcessProtocol <NSObject>
@required
- (void) didUploadImageDataSuccess : (id)data;
- (void) didUploadImageDataFailed : (NSString *)err;

@end

@protocol dataLowPriceNotifyProcessProtocol <NSObject>
@required
- (void) didLowPriceNotifyDataSuccess : (id)data;
- (void) didLowPriceNotifyDataFailed : (NSString *)err;
@end

@protocol dataLoadCarInfoByPidProcessProtocol <NSObject>
@required
- (void) didLoadCarInfoByPidDataSuccess : (id)data;
- (void) didLoadCarInfoByPidDataFailed : (NSString *)err;

@end


@protocol dataLoadCarInfoByLevelProcessProtocol <NSObject>
@required
- (void) didLoadCarInfoByLevelDataSuccess : (id)data;
- (void) didLoadCarInfoByLevelDataFailed : (NSString *)err;

@end

@protocol dataGoodsCategoryByPidProcessProtocol <NSObject>
@required
- (void) didGoodsCategoryByPidDataSuccess : (id)data;
- (void) didGoodsCategoryByPidDataFailed : (NSString *)err;

@end

@protocol dataGoodsAllBrandProcessProtocol <NSObject>
@required
- (void) didGoodsAllBrandDataSuccess : (id)data;
- (void) didGoodsAllBrandDataFailed : (NSString *)err;

@end

@protocol dataGoodsListProcessProtocol <NSObject>
@required
- (void) didGoodsListDataSuccess : (id)data;
- (void) didGoodsListDataFailed : (NSString *)err;

@end

@protocol dataFilterAttrByCateProcessProtocol <NSObject>
@required
- (void) didFilterAttrByCateDataSuccess : (id)data;
- (void) didFilterAttrByCateDataFailed : (NSString *)err;

@end

@protocol dataGoodsCarModelByCateProcessProtocol <NSObject>
@required
- (void) didGoodsCarModelByCateDataSuccess : (id)data;
- (void) didGoodsCarModelByCateatDaFailed : (NSString *)err;

@end

@protocol dataGoodsCategoryByBrandProcessProtocol <NSObject>
@required
- (void) didGoodsCategoryByBrandDataSuccess : (id)data;
- (void) didGoodsCategoryByBrandDataFailed : (NSString *)err;

@end

@protocol dataGoodsBrandByCarModelProcessProtocol <NSObject>
@required
- (void) didGoodsBrandByCarModelDataSuccess : (id)data;
- (void) didGoodsBrandByCarModelDataFailed : (NSString *)err;

@end

@protocol dataGoodsCategoryByCarModelProcessProtocol <NSObject>
@required
- (void) didGoodsCategoryByCarModelDataSuccess : (id)data;
- (void) didGoodsCategoryByCarModelDataFailed : (NSString *)err;

@end

@protocol dataSearchGoodsProcessProtocol <NSObject>
@required
- (void) didSearchGoodsDataSuccess : (id)data;
- (void) didSearchGoodsDataFailed : (NSString *)err;

@end

@protocol dataSearchGoodsByBarCodeProcessProtocol <NSObject>
@required
- (void) didSearchGoodsByBarCodeDataSuccess : (id)data;
- (void) didSearchGoodsByBarCodeDataFailed : (NSString *)err;

@end

@protocol dataSearchGoodsByVinCodeProcessProtocol <NSObject>
@required
- (void) didSearchGoodsByVinCodeDataSuccess : (id)data;
- (void) didSearchGoodsByVinCodeDataFailed : (NSString *)err;

@end

@protocol dataMyOrderListsProcessProtocol <NSObject>
@required
- (void) didMyOrderListsDataSuccess : (id)data;
- (void) didMyOrderListsDataFailed : (NSString *)err;

@end

@protocol dataProfileProcessProtocol <NSObject>
@required
- (void) didProfileDataSuccess : (id)data;
- (void) didProfileDataFailed : (NSString *)err;

@end

@protocol dataGetUserInfoByIdProcessProtocol <NSObject>
@required
- (void) didGetUserInfoByIdDataSuccess : (id)data;
- (void) didGetUserInfoByIdFailed : (NSString *)err;

@end

@protocol dataCitySiteProcessProtocol <NSObject>
@required
- (void) didCitySiteDataSuccess : (id)data;
- (void) didCitySiteDataFailed : (NSString *)err;

@end

@protocol dataGoodsBrandByCateProcessProtocol <NSObject>
@required
- (void) didGoodsBrandByCateDataSuccess : (id)data;
- (void) didGoodsBrandByCateDateFailed : (NSString *)err;

@end

@protocol dataMyBillByMonthProcessProtocol <NSObject>
@required
- (void) didMyBillByMonthSuccess : (id)data;
- (void) didMyBillByMonthFailed : (NSString *)err;

@end

@protocol dataVerifyUserProcessProtocol <NSObject>
@required
- (void) didVerifyUserSuccess : (id)data;
- (void) didVerifyUserFailed : (NSString *)err;

@end

@protocol dataSaveUserProcessProtocol <NSObject>
@required
- (void) didSaveUserSuccess : (id)data;
- (void) didSaveUserFailed : (NSString *)err;

@end

@protocol dataReqionInfoProtocol <NSObject>
@required
- (void) didReqionInfoSuccess : (id)data;
- (void) didReqionInfoFailed : (NSString *)err;

@end
//
//  model.m
//  YiPei
//
//  Created by lee on 13-11-22.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "model.h"

//@implementation todayNewQuery
//@synthesize index;
//@synthesize cid;
//@synthesize sortp;
//@synthesize sorts;
//@end

@implementation todayNew

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize goods_sn;
@synthesize supplier_id;
@synthesize warehouse_id;
@synthesize factory_code;
@synthesize barcode;
@synthesize goods_format;
@synthesize goods_name;
@synthesize goods_sale_amount;
@synthesize package_format;
@synthesize product_company;
@synthesize goods_thumb;
@synthesize goods_img;
@synthesize original_img;
@synthesize goodsAttrs;
@end

@implementation goodsAttr

@synthesize attr_name;
@synthesize attr_value;
@end

//@implementation todayDiscountQuery
//
//@synthesize index;
//@synthesize sortPrice;
//@synthesize sortSale;
//@end

@implementation todayDiscountGoods

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize goods_sn;
@synthesize supplier_id;
@synthesize warehouse_id;
@synthesize factory_code;
@synthesize barcode;
@synthesize goods_format;
@synthesize goods_name;
@synthesize goods_sale_amount;
@synthesize package_format;
@synthesize product_company;
@synthesize goods_thumb;
@synthesize goods_img;
@synthesize original_img;
@synthesize goodsAttrs;
@end

//@implementation CityGoodsInfoQuery
//
//@synthesize goodsId;
//@end

@implementation GoodsInfo

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize supplier_id;
@synthesize warehouse_id;
@synthesize goods_sn;
@synthesize goods_barcode;
@synthesize goods_format;
@synthesize package_format;
@synthesize brand_name;
@synthesize measure_unit;
@synthesize product_company;

@synthesize goods_name;
@synthesize goods_brief;
@synthesize goods_desc;
@synthesize goods_thumb;
@synthesize goods_img;
@synthesize original_img;
@synthesize goods_sale_amount;
@synthesize goods_attrs;
@synthesize volume_price;
@synthesize goods_car;
@synthesize service_after_title;
@synthesize service_after_content;
@synthesize slogan_title;
@synthesize slogan_content;
@synthesize goods_gallery;
@end

@implementation volumePrice
@synthesize volume_number_min;
@synthesize volume_number;
@synthesize volume_price;
@synthesize supplier_id;

@end

@implementation goodsCar

@synthesize car_id;
@synthesize name;
@synthesize power;
@synthesize series;
@synthesize brand;
@synthesize company;
@synthesize import_info;
@end

@implementation goodsGallery

@synthesize thumb_url;
@synthesize img_url;
@synthesize img_desc;
@synthesize img_original;
@end

//@implementation uploadImageQuery
//
//@synthesize goodsSn;
//@end

@implementation uploadImageInfo

@synthesize ImageInfo;
@end

@implementation uploadImagePath

@synthesize filePath;
@end

//@implementation lowPriceNotifyQuery
//
//@synthesize goodsId;
//@synthesize sysPrice;
//@synthesize price;
//@synthesize number;
//@synthesize rebates;
//@synthesize imgUrl;
//
//@end

//@implementation loadCarInfoByPidQuery
//
//@synthesize pid;
//@end
//
//@implementation loadCarInfoByLevelQuery
//
//@synthesize level;
//@end

@implementation loadCarInfo

@synthesize car_id;
@synthesize name;
@synthesize power;
@synthesize level;
@synthesize series;
@synthesize brand;
@synthesize company;
@synthesize import_info;

@end

@implementation goodsCategory

@synthesize car_id;
@synthesize cat_name;
@synthesize sort_order;
@synthesize cat_desc;
@synthesize category_thumb;
@synthesize ategory_img;
@synthesize original_img;
@end

//@implementation goodsCategoryByPidQuery
//
//@synthesize pid;
//@end

@implementation goodsCategoryByPid

@synthesize category;
@end

//@implementation goodsAllBrandQuery
//
//@synthesize firstLetter;
//@synthesize sortByLetter;
//@end


@implementation goodsAllBrand

@synthesize category;

@end

@implementation ReqionInfoByPid

@synthesize reqion;

@end

@implementation reqionInfo

@synthesize region_id;
@synthesize region_name;

@end

@implementation filterGoodsList

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize goods_sn;
@synthesize supplier_id;
@synthesize factory_code;
@synthesize barcode;
@synthesize goods_format;
@synthesize goods_name;
@synthesize goods_sale_amount;
@synthesize package_format;
@synthesize product_company;
@synthesize goods_thumb;
@synthesize goods_img;
@synthesize original_img;

@end

@implementation filterAttrByCategory
@synthesize categoryId;
@synthesize name;
@synthesize valuesList;
@end
//@implementation goodsListQuery
//
//@synthesize categoryId;
//@synthesize carModel;
//@synthesize carGeneral;
//@synthesize brandId;
//@synthesize filterAttr;
//@synthesize sortPrice;
//@synthesize sortSale;
//@synthesize index;
//
//@end

//@implementation filterAttrByCategoryQuery
//
//@synthesize categoryId;
//
//@end

//@implementation goodsCarModelByCategoryQuery
//
//@synthesize categoryId;
//
//@end
//
//@implementation goodsCategoryByBrandQuery
//
//@synthesize brandId;
//
//@end

//@implementation filterAttrByBrandQuery
//
//@synthesize brandId;
//
//@end
//
//@implementation goodsBrandByCarModelQuery
//
//@synthesize carModel;
//
//@end
//
//@implementation goodsCategoryByCarModelQuery
//
//@synthesize carModel;
//
//@end

@implementation Goods2Cart

@synthesize goodsId;
@synthesize goodsNumber;
@synthesize goodName;
@synthesize goodCity;
@synthesize goodPrice;
@end

//@implementation searchGoodsQuery
//
//@synthesize keywords;
//
//@end

@implementation searchGoods

@synthesize goods;

@end

@implementation searchGoodInfo

@synthesize goods_id;
@synthesize goods_name;

@end

//@implementation searchGoodsByBarCodeQuery
//
//@synthesize barCode;
//
//@end

@implementation searchGoodsByBarCode

@synthesize searchGoodsByBarCode;

@end

@implementation searchGoodsByBarCodeInfo

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize supplier_id;
@synthesize warehouse_id;
@synthesize goods_sn;
@synthesize goods_barcode;
@synthesize goods_format;
@synthesize package_format;
@synthesize brand_name;
@synthesize measure_unit;
@synthesize product_company;

@synthesize goods_name;
@synthesize goods_brief;
@synthesize goods_desc;
@synthesize goods_thumb;
@synthesize goods_img;
@synthesize original_img;
@synthesize goods_sale_amount;
@synthesize goods_attrs;
@synthesize volume_price;
@synthesize goods_car;
@synthesize service_after_title;
@synthesize service_after_content;
@synthesize slogan_title;
@synthesize slogan_content;
@synthesize goods_gallery;
@end

@implementation searchGoodsByVinCode

@synthesize searchCarID;
@synthesize searchName;
@synthesize searchPower;
@synthesize searchLevel;
@synthesize searchSeries;
@synthesize searchBrand;
@synthesize searchCompany;
@synthesize searchImportInfo;

@end
//@implementation searchGoodsByVinCodeQuery
//
//@synthesize searchGoodsByVinCode;
//
//@end

//@implementation myOrderListsQuery
//
//@synthesize index;
//@synthesize uid;
//@synthesize clientsId;
//@synthesize t;
//@synthesize p;
//
//@end

@implementation myOrderLists

@synthesize index;
@synthesize page;
@synthesize order_lists;
@end

@implementation orderLists

@synthesize order_id;
@synthesize id_code;
@synthesize instime;
@synthesize price;
@synthesize pay_id;
@synthesize goods_list;

@end

@implementation orderGoods

@synthesize good_id;
@synthesize order_id;
@synthesize name;
@synthesize buy_count;
@synthesize price;
@synthesize img;

@end

//@implementation profileQuery
//
//@synthesize clientsId;
//@synthesize uid;
//
//@end

@implementation myProfile

@synthesize clients_info;
@synthesize user_pro_info;
@synthesize client_credit;

@end


@implementation clientInfo
@synthesize name;
@synthesize logo;
@synthesize addr;
@synthesize contact;
@synthesize tel;
@synthesize mobile;
@end

@implementation userProfileInfo

@synthesize user_id;
@synthesize user_name;
@synthesize level;
@synthesize rank_points;

@end

@implementation clientCredit

@synthesize level;
@synthesize amounts;

@end

//@implementation profileIndexQuery
//
//@synthesize clientsId;
//@synthesize uid;
//
//@end

@implementation myUsrInfoByPid

@synthesize user_id;
@synthesize user_name;
@synthesize client_id;
@synthesize city;
@synthesize company_name;
@synthesize company_logo;
@synthesize province;
@synthesize district;
@synthesize company_addres;
@synthesize mobile;
@synthesize contact;
@end

@implementation MyCredit

@synthesize level;
@synthesize amounts;
@end

@implementation saveClientInfo

@synthesize uid;
@synthesize user_name;
@synthesize client_id;
@synthesize city;
@end


@implementation orderSubmit

@synthesize order_id;
@synthesize order_sn;

@end

@implementation howMuchHongBaoLeft

@synthesize hongbao;

@end

@implementation citySite

@synthesize cName;
@synthesize cID;
@end

@implementation MyVerify

@synthesize companyName;
@synthesize province;
@synthesize city;
@synthesize district;
@synthesize companyAddress;
@synthesize mobile;
@synthesize contact;
@synthesize code;
@end





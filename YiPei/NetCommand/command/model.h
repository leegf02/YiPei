//
//  model.h
//  YiPei
//
//  Created by lee on 13-11-22.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetCommand.h"

//2. 首页 根据客户端发送的页码(index)分页返回今日行情的列表，并且当index=0时（首页），增加一条今日发布信息及一条今日特价信息。
//@interface todayNewQuery : NSObject
//{
//    NSString *index;
//    NSString *cid;
//    NSString *sortp;
//    NSString *sorts;
//}
//@property(nonatomic, retain) NSString *index;
//@property(nonatomic, retain) NSString *cid;
//@property(nonatomic, retain) NSString *sortp;
//@property(nonatomic, retain) NSString *sorts;
//@end

@interface todayNew : NSObject
{
    NSString *min_price; //最低价格
    NSString *market_price; //商品原价
    NSString *goods_id; //商品id
    NSString *goods_sn; //商品出厂编码
    NSString *supplier_id;  //供货商id
    NSString *warehouse_id; //商品所在仓库id
    NSString *factory_code; //商品出厂编码（商户定义）
    NSString *barcode;      //商品条形码
    NSString *goods_format; //商品规格型号
    NSString *goods_name; //商品名称
    NSString *goods_sale_amount;// 商品销售量
    NSString *package_format;  //商品包装规格
    NSString *product_company; //生产厂家
    NSString *goods_thumb; //商品图片（小）
    NSString *goods_img;   //商品图片（中）
    NSString *original_img;    //商品图片（原图）
    NSArray  *goodsAttrs; //商品属性（有多个）
}

@property(nonatomic, retain) NSString *min_price;
@property(nonatomic, retain) NSString *market_price;
@property(nonatomic, retain) NSString *goods_id;
@property(nonatomic, retain) NSString *goods_sn;
@property(nonatomic, retain) NSString *supplier_id;
@property(nonatomic, retain) NSString *warehouse_id;
@property(nonatomic, retain) NSString *factory_code;
@property(nonatomic, retain) NSString *barcode;
@property(nonatomic, retain) NSString *goods_format;
@property(nonatomic, retain) NSString *goods_name;
@property(nonatomic, retain) NSString *goods_sale_amount;
@property(nonatomic, retain) NSString *package_format;
@property(nonatomic, retain) NSString *product_company;
@property(nonatomic, retain) NSString *goods_thumb;
@property(nonatomic, retain) NSString *goods_img;
@property(nonatomic, retain) NSString *original_img;
@property(nonatomic, retain) NSArray *goodsAttrs;

@end

@interface goodsAttr : NSObject
{
    NSString *attr_name;// 属性名称
    NSString *attr_value; //属性值
}
@property(nonatomic, retain) NSString *attr_name;
@property(nonatomic, retain) NSString *attr_value;
@end

//4. 今日特价列表（可以与今日发布的接口进行合并）
//@interface todayDiscountQuery : NSObject
//{
//    NSString *index;   //当前页数（0表示第一页） integer
//    NSString *sortPrice;//按照价格排序（0：降序1：升序）
//    NSString *sortSale; //按照销售量排序（0：降序1：升序
//}
//@property(nonatomic, retain) NSString *index;
//@property(nonatomic, retain) NSString *sortPrice;
//@property(nonatomic, retain) NSString *sortSale;
//@end

@interface todayDiscountGoods : NSObject
{
    NSString *min_price;    //最低价格
    NSString *market_price; //商品原价
    NSString *goods_id;     //商品id
    NSString *supplier_id;  //供货商id
    NSString *warehouse_id; //商品所在仓库id
    NSString *goods_sn;     //商品编号
    NSString *factory_code; //商品出厂编码（商户定义）
    NSString *barcode;      //商品条形码
    NSString *goods_format; //商品规格型号
    NSString *goods_name;   //商品名称
    NSString *goods_sale_amount;//商品销售量
    NSString *package_format;  //商品包装规格
    NSString *product_company; //生产厂家
    NSString *goods_thumb; //商品图片（小）
    NSString *goods_img;   //商品图片（中）
    NSString *original_img;    //商品图片（原图）
    NSArray  *goodsAttrs;//商品属性（有多个），基本数据结构如下
}
@property(nonatomic, retain) NSString *min_price;
@property(nonatomic, retain) NSString *market_price;
@property(nonatomic, retain) NSString *goods_id;
@property(nonatomic, retain) NSString *goods_sn;
@property(nonatomic, retain) NSString *supplier_id;
@property(nonatomic, retain) NSString *warehouse_id;
@property(nonatomic, retain) NSString *factory_code;
@property(nonatomic, retain) NSString *barcode;
@property(nonatomic, retain) NSString *goods_format;
@property(nonatomic, retain) NSString *goods_name;
@property(nonatomic, retain) NSString *goods_sale_amount;
@property(nonatomic, retain) NSString *package_format;
@property(nonatomic, retain) NSString *product_company;
@property(nonatomic, retain) NSString *goods_thumb;
@property(nonatomic, retain) NSString *goods_img;
@property(nonatomic, retain) NSString *original_img;
@property(nonatomic, retain) NSArray *goodsAttrs;

@end

//5. 根据商品的id返回商品详情信息：
//@interface CityGoodsInfoQuery : NSObject
//{
//    NSString *goodsId;//商品id integer;
//}
//@property(nonatomic, retain)  NSString *goodsId;
//@end

@interface GoodsInfo : NSObject
{
    NSString *min_price;        //最低价格
    NSString *market_price;     //商品原价
    NSString *goods_id;         //商品id
    NSString *supplier_id;      //供货商id
    NSString *warehouse_id;     //商品所在仓库id
    NSString *goods_sn;         //商品出厂编码
    NSString *goods_barcode;    //商品条形码
    NSString *goods_format;     //商品规格型号
    NSString *package_format;   //商品包装规格
    NSString *brand_name;       //商品品牌
    NSString *measure_unit;     //商品计量单位
    NSString *product_company;  //生产厂家
    NSString *goods_name;       //商品名称
    NSString *goods_brief;      //商品简介
    NSString *goods_desc;       //商品详情
    NSString *goods_thumb;      //商品图片（小）
    NSString *goods_img;        //商品图片（中）
    NSString *original_img;     //商品图片（原图）
    NSString *goods_sale_amount;//商品销售量
    NSArray  *goods_attrs;      //商品属性（有多个）
    NSArray  *volume_price;     //批发量价
    NSArray  *goods_car;         //商品适用车型（有多个）
    NSString *service_after_title;// 售后服务标题，默认为“售后服务”
    NSString *service_after_content;// 售后服务内容
    NSString *slogan_title;      //网站slogan
    NSString *slogan_content;   //网站slogan
    NSArray  *goods_gallery;    //商品相册（多张图片）
}
@property(nonatomic, retain) NSString *min_price;
@property(nonatomic, retain) NSString *market_price;
@property(nonatomic, retain) NSString *goods_id;
@property(nonatomic, retain) NSString *supplier_id;
@property(nonatomic, retain) NSString *warehouse_id;
@property(nonatomic, retain) NSString *goods_sn;
@property(nonatomic, retain) NSString *goods_barcode;
@property(nonatomic, retain) NSString *goods_format;
@property(nonatomic, retain) NSString *package_format;
@property(nonatomic, retain) NSString *brand_name;
@property(nonatomic, retain) NSString *measure_unit;
@property(nonatomic, retain) NSString *product_company;

@property(nonatomic, retain) NSString *goods_name;
@property(nonatomic, retain) NSString *goods_brief;
@property(nonatomic, retain) NSString *goods_desc;
@property(nonatomic, retain) NSString *goods_thumb;
@property(nonatomic, retain) NSString *goods_img;
@property(nonatomic, retain) NSString *original_img;
@property(nonatomic, retain) NSString *goods_sale_amount;
@property(nonatomic, retain) NSArray  *goods_attrs;
@property(nonatomic, retain) NSArray  *volume_price;
@property(nonatomic, retain) NSArray  *goods_car;
@property(nonatomic, retain) NSString *service_after_title;
@property(nonatomic, retain) NSString *service_after_content;
@property(nonatomic, retain) NSString *slogan_title;
@property(nonatomic, retain) NSString *slogan_content;
@property(nonatomic, retain) NSArray  *goods_gallery;
@end


@interface volumePrice : NSObject
{
    NSString *volume_number_min;//批量价格区间下限
    NSString *volume_number;//批量价格区间上限
    NSString *volume_price; //批量购物单价
    NSString *supplier_id;  //批量优惠价格供货商
}
@property(nonatomic, retain) NSString *volume_number_min;
@property(nonatomic, retain) NSString *volume_number;
@property(nonatomic, retain) NSString *volume_price;
@property(nonatomic, retain) NSString *supplier_id;
@end

@interface goodsCar : NSObject
{
    NSString *car_id;   //车型id
    NSString *name;     //车型名称
    NSString *power;    //排量
    NSString *series;   //车系名称
    NSString *brand;    //品牌名称
    NSString *company;  //生产厂商
    NSString *import_info;//进口|国产|合资
}
@property(nonatomic, retain) NSString *car_id;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *power;
@property(nonatomic, retain) NSString *series;
@property(nonatomic, retain) NSString *brand;
@property(nonatomic, retain) NSString *company;
@property(nonatomic, retain) NSString *import_info;
@end

@interface goodsGallery : NSObject
{
    NSString *thumb_url;    //图片缩略图
    NSString *img_url;      //图片路径
    NSString *img_desc;     //图片描述
    NSString *img_original; //原图
}
@property(nonatomic, retain) NSString *thumb_url;
@property(nonatomic, retain) NSString *img_url;
@property(nonatomic, retain) NSString *img_desc;
@property(nonatomic, retain) NSString *img_original;
@end

//6. 用户上传小票凭证的图片返回图片信息（id、url）
//@interface uploadImageQuery : NSObject
//{
//    NSString *goodsSn;//商品编码
//}
//@property(nonatomic, retain) NSString *goodsSn;
//@end

@interface uploadImageInfo : NSObject
{
    NSString *ImageInfo;
}
@property(nonatomic, retain) NSString *ImageInfo;

@end

@interface uploadImagePath : NSObject
{
    NSString *filePath;// 新上传图片保存地址
}
@property(nonatomic, retain) NSString *filePath;

@end

//7. 降价通知
//@interface lowPriceNotifyQuery : NSObject
//{
//    NSString *goodsId;  //商品id         integer
//    NSString *sysPrice; //系统商品价格    decimal（10，2）
//    NSString *price;    //采购价格        decimal（10，2）
//    NSString *number;   //一次性采购数量   integer
//    NSString *rebates;  //返点           decimal（10，2）
//    NSString *imgUrl;   //购物小票图片路径  string
//}
//@property(nonatomic, retain) NSString *goodsId;
//@property(nonatomic, retain) NSString *sysPrice;
//@property(nonatomic, retain) NSString *price;
//@property(nonatomic, retain) NSString *number;
//@property(nonatomic, retain) NSString *rebates;
//@property(nonatomic, retain) NSString *imgUrl;
//@end

//8.1根据车型父级分类，获取该父级分类下面的所有子分类信息
//@interface loadCarInfoByPidQuery : NSObject
//{
//    NSString *pid;//父级分类 integer
//}
//@property(nonatomic, retain) NSString *pid;
//@end
//
////8.2根据车型数据等级获取该等级车型信息
//@interface loadCarInfoByLevelQuery : NSObject
//{
//    NSString *level;    //车型数据等级（1：品牌2：车系3：排量4：年款）integer
//}
//@property(nonatomic, retain) NSString *level;
//@end

@interface loadCarInfo : NSObject
{
    NSString *car_id;     //车型数据id
    NSString *name;        //车型数据名称
    NSString *power;       //排量
    NSString *level;       //车型数据等级
    NSString *series;      //车系名称
    NSString *brand;       //品牌名称
    NSString *company;     //生产厂商
    NSString *import_info; //进口|国产|合资
}
@property(nonatomic, retain) NSString *car_id;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *power;
@property(nonatomic, retain) NSString *level;
@property(nonatomic, retain) NSString *series;
@property(nonatomic, retain) NSString *brand;
@property(nonatomic, retain) NSString *company;
@property(nonatomic, retain) NSString *import_info;
@end


@interface goodsCategory : NSObject
{
    NSString *cat_id;          //分类id
    NSString *cat_name;        //分类名称
    NSString *sort_order;      //排序
    NSString *cat_desc;        //分类描述
    NSString *category_thumb;  //分类图片缩略图
    NSString *ategory_img;     //分类图片
    NSString *original_img;    //分类图片原图
}
@property(nonatomic, retain) NSString *car_id;
@property(nonatomic, retain) NSString *cat_name;
@property(nonatomic, retain) NSString *sort_order;
@property(nonatomic, retain) NSString *cat_desc;
@property(nonatomic, retain) NSString *category_thumb;
@property(nonatomic, retain) NSString *ategory_img;
@property(nonatomic, retain) NSString *original_img;
@end

//分类列表
//@interface goodsCategoryByPidQuery : NSObject {
//    NSString *pid; //父级分类    integer
//}
//@property(nonatomic, retain) NSString *pid;
//@end

@interface goodsCategoryByPid : NSObject {
    NSArray *category; //goodsCategory类的数组
}
@property(nonatomic, retain) NSArray *category;
@end

//品牌列表（每一级为一个接口）
//@interface goodsAllBrandQuery : NSObject
//{
//    NSString *firstLetter;    //首字母    char     可选
//    NSString *sortByLetter;   //是否按照首字母排序升序排列（0：否1：是）    可选
//}
//@property(nonatomic, retain) NSString *firstLetter;
//@property(nonatomic, retain) NSString *sortByLetter;
//@end

@interface goodsAllBrand : NSObject {
    NSArray *category; //goodsCategory类的数组
}
@property(nonatomic, retain) NSArray *category;
@end

@interface ReqionInfoByPid : NSObject
{
    NSArray *reqion; //goodsCategory类的数组
}
@property(nonatomic, retain) NSArray *reqion;
@end

@interface reqionInfo : NSObject
{
    NSString *region_id;//区域id
    NSString *region_name;//区域名称
}
@property(nonatomic, retain) NSString *region_id;
@property(nonatomic, retain) NSString *region_name;
@end
//11. 根据具体车型获取对应的配件列表（可以对价格及销量进行排序）
//提供数据过滤（这个比较麻烦，需要等数据机构确定下来才能定）
//
//12. 根据具体的分类(如：空气滤清器)获取对应的配件列表（可以对价格及销量进行排序）
//同样需要提供数据过滤
//
//13. 获取具体品牌配件的列表信息（可以对价格及销量进行排序）
//同样需要提供数据过滤

//根据筛选条件获取商品列表：
//api.com/index.php?m= GoodsCategory&a=getGoodsList&city=城市id&categoryId=配件分类&carModel =车型id&carGeneral =是否是通用配件（1：是0：否，取代之前选定的唯一车型）&brandId=配件品牌&filterAttr=筛选属性&sortPrice=价格排序（0：降序，1：升序）&sortSale=销量（0：降序，1：升序）&index=当前页数（0表示第一页）
//@interface goodsListQuery : NSObject
//{
//    NSString *categoryId;     //配件分类
//    NSString *carModel;       //车型
//    NSString *carGeneral;     //是否是通用配件（1：是0：否，取代之前选定的唯一车型
//    NSString *brandId;        //配件品牌
//    NSString *filterAttr;     //筛选属性
//    NSString *sortPrice;      //价格排序（0：降序，1：升序）
//    NSString *sortSale;       //销量（0：降序，1：升序
//    NSString *index;          //当前页数（0表示第一页）
//}
//@property(nonatomic, retain) NSString *categoryId;
//@property(nonatomic, retain) NSString *carModel;
//@property(nonatomic, retain) NSString *carGeneral;
//@property(nonatomic, retain) NSString *brandId;
//@property(nonatomic, retain) NSString *filterAttr;
//@property(nonatomic, retain) NSString *sortPrice;
//@property(nonatomic, retain) NSString *sortSale;
//@property(nonatomic, retain) NSString *index;
//@end

@interface filterGoodsList : NSObject
{
    NSString *min_price;    //最低价格
    NSString *market_price; //商品原价
    NSString *goods_id;     //商品id
    NSString *supplier_id;  //供货商id
    NSString *goods_sn;     //商品编号
    NSString *factory_code; //商品出厂编码（商户定义）
    NSString *barcode;      //商品条形码
    NSString *goods_format; //商品规格型号
    NSString *goods_name;   //商品名称
    NSString *goods_sale_amount;//商品销售量
    NSString *package_format;  //商品包装规格
    NSString *product_company; //生产厂家
    NSString *goods_thumb; //商品图片（小）
    NSString *goods_img;   //商品图片（中）
    NSString *original_img;    //商品图片（原图）
}
@property(nonatomic, retain) NSString *min_price;
@property(nonatomic, retain) NSString *market_price;
@property(nonatomic, retain) NSString *goods_id;
@property(nonatomic, retain) NSString *goods_sn;
@property(nonatomic, retain) NSString *supplier_id;
@property(nonatomic, retain) NSString *factory_code;
@property(nonatomic, retain) NSString *barcode;
@property(nonatomic, retain) NSString *goods_format;
@property(nonatomic, retain) NSString *goods_name;
@property(nonatomic, retain) NSString *goods_sale_amount;
@property(nonatomic, retain) NSString *package_format;
@property(nonatomic, retain) NSString *product_company;
@property(nonatomic, retain) NSString *goods_thumb;
@property(nonatomic, retain) NSString *goods_img;
@property(nonatomic, retain) NSString *original_img;
@end

//根据商品分类获取筛选条件：api.com/index.php?m= GoodsCategory&a= getFilterAttrByCategory&categoryId =商品分类id（如：机油滤清器）
@interface filterAttrByCategory : NSObject
{
    NSString *categoryId;//商品分类id
    NSString *name;      //属性名称
    NSArray  *valuesList;
}
@property(nonatomic, retain) NSString *categoryId;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSArray *valuesList;

@end


//根据商品分类获取具有该分类配件的车型：api.com/index.php?m= GoodsCategory&a= getGoodsCarModelByCategory&categoryId=商品分类id（如：机油滤清器）
//@interface goodsCarModelByCategoryQuery : NSObject
//{
//    NSString *categoryId;//商品分类id
//}
//@property(nonatomic, retain) NSString *categoryId;
//@end

//根据供应商品牌获取其生产的所有配件分类：api.com/index.php?m= GoodsCategory&a= getGoodsCategoryByBrand&brandId=供应商品牌id（如：博世）
//@interface goodsCategoryByBrandQuery : NSObject
//{
//    NSString *brandId;//供应商品牌id
//}
//@property(nonatomic, retain) NSString *brandId;
//@end

//根据供应商品牌获取其生产的配件所适应的所有车型：api.com/index.php?m= GoodsCategory&a= getFilterAttrByCategory&brandId =供应商品牌id（如：博世）
//@interface filterAttrByBrandQuery : NSObject
//{
//    NSString *brandId;//供应商品牌id
//}
//@property(nonatomic, retain) NSString *brandId;
//@end

//根据车型获取生产适用于该车型配件的配件品牌：api.com/index.php?m= GoodsCategory&a=getGoodsBrandByCarModel&carModel=车型id（如：进口奥迪A6 2001款 1.8T）
//@interface goodsBrandByCarModelQuery : NSObject
//{
//    NSString *carModel;//车型id
//}
//@property(nonatomic, retain) NSString *carModel;
//@end

//根据车型获取生产适用于该车型配件的配件品牌：api.com/index.php?m= GoodsCategory&a=getGoodsCategoryByCarModel & carModel=车型id（如：进口奥迪A6 2001款 1.8T）
//@interface goodsCategoryByCarModelQuery : NSObject
//{
//    NSString *carModel;//车型id
//}
//@property(nonatomic, retain) NSString *carModel;
//@end

//14 本地购物车 数据结构（数据库）
@interface Goods2Cart : NSObject
{
    NSString *goodsId;      //  商品id integer
    NSString *goodName;
    NSString *goodPrice;
    NSString *goodsNumber;  // 商品数量    integer
    NSString *goodCity;
}
@property(nonatomic, retain) NSString *goodsId;
@property(nonatomic, retain) NSString *goodName;
@property(nonatomic, retain) NSString *goodPrice;
@property(nonatomic, retain) NSString *goodsNumber;
@property(nonatomic, retain) NSString *goodCity;
@end

//15 提交订单

//16 按照关键字搜索商品
//@interface searchGoodsQuery : NSObject
//{
//    NSString *keywords;  //关键字 string
//}
//@property(nonatomic, retain) NSString *keywords;
//
//@end

@interface searchGoods : NSObject
{
    NSArray *goods;//searchGoodInfo的NSArray
}
@property(nonatomic, retain) NSArray *goods;

@end

@interface searchGoodInfo : NSObject
{
    NSString *goods_id;     //  商品id
    NSString *goods_name;   //  商品名称
    
}
@property(nonatomic, retain) NSString *goods_id;
@property(nonatomic, retain) NSString *goods_name;

@end

//17 根据条形码扫描结果返回商品信息
//@interface searchGoodsByBarCodeQuery : NSObject
//{
//    NSString *barCode;    //  商品条形码 string
//}
//@property(nonatomic, retain) NSString *barCode;
//@end

@interface searchGoodsByBarCode : NSObject
{
    NSArray *searchGoodsByBarCode;//searchGoodsByBarCodeInfo
}
@property(nonatomic, retain) NSArray *searchGoodsByBarCode;

@end

@interface searchGoodsByBarCodeInfo : NSObject
{
    NSString *min_price;        //最低价格
    NSString *market_price;     //商品原价
    NSString *goods_id;         //商品id
    NSString *supplier_id;      //供货商id
    NSString *warehouse_id;     //商品所在仓库id
    NSString *goods_sn;         //商品出厂编码
    NSString *goods_barcode;    //商品条形码
    NSString *goods_format;     //商品规格型号
    NSString *package_format;   //商品包装规格
    NSString *brand_name;       //商品品牌
    NSString *measure_unit;     //商品计量单位
    NSString *product_company;  //生产厂家
    NSString *goods_name;       //商品名称
    NSString *goods_brief;      //商品简介
    NSString *goods_desc;       //商品详情
    NSString *goods_thumb;      //商品图片（小）
    NSString *goods_img;        //商品图片（中）
    NSString *original_img;     //商品图片（原图）
    NSString *goods_sale_amount;//商品销售量
    NSArray  *goods_attrs;      //商品属性（有多个）
    NSArray  *volume_price;     //批发量价
    NSArray  *goods_car;         //商品适用车型（有多个）
    NSString *service_after_title;// 售后服务标题，默认为“售后服务”
    NSString *service_after_content;// 售后服务内容
    NSString *slogan_title;      //网站slogan
    NSString *slogan_content;   //网站slogan
    NSArray  *goods_gallery;    //商品相册（多张图片）
}
@property(nonatomic, retain) NSString *min_price;
@property(nonatomic, retain) NSString *market_price;
@property(nonatomic, retain) NSString *goods_id;
@property(nonatomic, retain) NSString *supplier_id;
@property(nonatomic, retain) NSString *warehouse_id;
@property(nonatomic, retain) NSString *goods_sn;
@property(nonatomic, retain) NSString *goods_barcode;
@property(nonatomic, retain) NSString *goods_format;
@property(nonatomic, retain) NSString *package_format;
@property(nonatomic, retain) NSString *brand_name;
@property(nonatomic, retain) NSString *measure_unit;
@property(nonatomic, retain) NSString *product_company;

@property(nonatomic, retain) NSString *goods_name;
@property(nonatomic, retain) NSString *goods_brief;
@property(nonatomic, retain) NSString *goods_desc;
@property(nonatomic, retain) NSString *goods_thumb;
@property(nonatomic, retain) NSString *goods_img;
@property(nonatomic, retain) NSString *original_img;
@property(nonatomic, retain) NSString *goods_sale_amount;
@property(nonatomic, retain) NSArray  *goods_attrs;
@property(nonatomic, retain) NSArray  *volume_price;
@property(nonatomic, retain) NSArray  *goods_car;
@property(nonatomic, retain) NSString *service_after_title;
@property(nonatomic, retain) NSString *service_after_content;
@property(nonatomic, retain) NSString *slogan_title;
@property(nonatomic, retain) NSString *slogan_content;
@property(nonatomic, retain) NSArray  *goods_gallery;
@end


//18. 根据vin码返回车辆基本信息
//@interface searchGoodsByVinCodeQuery : NSObject
//{
//    NSString *searchGoodsByVinCode;
//}
//@property(nonatomic, retain) NSString *searchGoodsByVinCode;
//@end

@interface searchGoodsByVinCode : NSObject
{
    NSString *searchCarID;
    NSString *searchName;     //车型数据名称
    NSString *searchPower;    //排量
    NSString *searchLevel;    //车型数据等级
    NSString *searchSeries;   //车系名称
    NSString *searchBrand;    //品牌名称
    NSString *searchCompany;  //生产厂商
    NSString *searchImportInfo;// 进口|国产|合资
}
@property(nonatomic, retain) NSString *searchCarID;
@property(nonatomic, retain) NSString *searchName;
@property(nonatomic, retain) NSString *searchPower;
@property(nonatomic, retain) NSString *searchLevel;
@property(nonatomic, retain) NSString *searchSeries;
@property(nonatomic, retain) NSString *searchBrand;
@property(nonatomic, retain) NSString *searchCompany;
@property(nonatomic, retain) NSString *searchImportInfo;
@end

//我的订单
//@interface myOrderListsQuery : NSObject
//{
//    NSString *index;		//当前页码， 起始值为0
//    NSString *uid;			//用户ID
//    NSString *clientsId;	//门店ID
//    NSString *t;            //时间筛选。（1=>1个月，2=>3个月，3=>6个月，默认：全部）
//    NSString *p;			//每页显几条条数据，默认为10条数据
//}
//@property(nonatomic, retain) NSString *index;
//@property(nonatomic, retain) NSString *uid;
//@property(nonatomic, retain) NSString *clientsId;
//@property(nonatomic, retain) NSString *t;
//@property(nonatomic, retain) NSString *p;
//@end

@interface myOrderLists : NSObject
{
    NSString *index;		//当前页码，起始值为0。
    NSString *page;			//页码数量
    NSArray *order_lists;	//订单列表 orderLists
}
@property(nonatomic, retain) NSString *index;
@property(nonatomic, retain) NSString *page;
@property(nonatomic, retain) NSArray *order_lists;
@end

@interface orderLists : NSObject
{
    NSString *order_id;     //=> "订单ID"
    NSString *id_code;      //=> "订单编号"
    NSString *instime;      //=>"下单时间"
    NSString *price;		//=>"订单金额"
    NSString *pay_id;		//=>"支付方式，为1的时候是使用授信额度
    NSArray  *goods_list;   //商品详情 orderGoods
}
@property(nonatomic, retain) NSString *order_id;
@property(nonatomic, retain) NSString *id_code;
@property(nonatomic, retain) NSString *instime;
@property(nonatomic, retain) NSString *price;
@property(nonatomic, retain) NSString *pay_id;
@property(nonatomic, retain) NSArray  *goods_list;
@end

@interface orderGoods : NSObject
{
    NSString *good_id;    //=> "商品ID"
    NSString *order_id;   //=> "订单ID"
    NSString *name;       //=> "商品名称"
    NSString *buy_count;  //=> "购买数量"
    NSString *price;      //=> "商品单价"
    NSString *img;        //=> "商品图片"
}
@property(nonatomic, retain) NSString *good_id;
@property(nonatomic, retain) NSString *order_id;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *buy_count;
@property(nonatomic, retain) NSString *price;
@property(nonatomic, retain) NSString *img;
@end

//我的个人信息
//@interface profileQuery : NSObject
//{
//    NSString *clientsId;//	门店ID
//    NSString *uid;      //	会员ID
//}
//@property(nonatomic, retain) NSString *clientsId;
//@property(nonatomic, retain) NSString *uid;
//@end



@interface clientInfo : NSObject
{
    NSString* name;//	=> "商户名称"
    NSString* logo;//	=> "商户LOGO"
    NSString* addr;//	=> "商户地址"
    NSString* contact;//	=> "联系人"
    NSString* tel;//		=> "固定电话"
    NSString* mobile;//	=> "手机号"
}
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *logo;
@property(nonatomic, retain) NSString *addr;
@property(nonatomic, retain) NSString *contact;
@property(nonatomic, retain) NSString *tel;
@property(nonatomic, retain) NSString *mobile;
@end



@interface userProfileInfo : NSObject
{
    NSString* user_id;
    NSString* user_name;
    NSString* level;
    NSString* rank_points;
}
@property(nonatomic, retain) NSString *user_id;
@property(nonatomic, retain) NSString *user_name;
@property(nonatomic, retain) NSString *level;
@property(nonatomic, retain) NSString *rank_points;
@end

@interface clientCredit : NSObject
{
    NSString* level;
    NSString* amounts;
}
@property(nonatomic, retain) NSString *level;
@property(nonatomic, retain) NSString *amounts;
@end


@interface myProfile : NSObject
{
    clientInfo *clients_info;
    userProfileInfo *user_pro_info;
    clientCredit *client_credit;
}
@property(nonatomic, retain) clientInfo *clients_info;
@property(nonatomic, retain) userProfileInfo *user_pro_info;
@property(nonatomic, retain) clientCredit *client_credit;

@end
//个人中心首页
//@interface profileIndexQuery : NSObject
//{
//    NSString *clientsId;//	门店ID
//    NSString *uid;      //	会员ID
//}
//@property(nonatomic, retain) NSString *clientsId;
//@property(nonatomic, retain) NSString *uid;
//@end

@interface myUsrInfoByPid : NSObject
{
    NSString *user_id   ;// 会员id
    NSString *user_name ;//  会员用户名
    NSString *client_id ;//  会员所在门店id
    NSString *city      ;//    会员所在门店所在城市
    NSString *company_name  ;// 门店名称
    NSString *company_logo  ;//   门店logo
    NSString *province      ;//     会员所在门店所在省份
    NSString *district      ;//     会员所在门店所在区域
    NSString *company_addres;// 门店详情（街道）地址
    NSString *mobile        ;//          会员手机号
    NSString *contact       ;//       门店联系人
}
@property(nonatomic, retain) NSString *user_id;
@property(nonatomic, retain) NSString *user_name;
@property(nonatomic, retain) NSString *client_id;
@property(nonatomic, retain) NSString *city;
@property(nonatomic, retain) NSString *company_name;
@property(nonatomic, retain) NSString *company_logo;
@property(nonatomic, retain) NSString *province;
@property(nonatomic, retain) NSString *district;
@property(nonatomic, retain) NSString *company_addres;
@property(nonatomic, retain) NSString *mobile;
@property(nonatomic, retain) NSString *contact;

@end

@interface MyCredit : NSObject
{
    NSString *level;     //0,1,2,3,4,5		授信等级
    NSString *amounts;   //0.00			授信金额
}
@property(nonatomic, retain) NSString *level;
@property(nonatomic, retain) NSString *amounts;
@end


@interface saveClientInfo : NSObject
{
    NSString *uid;       //会员id
    NSString *user_name; //会员用户名
    NSString *client_id; //会员所在门店id
    NSString *city;      //会员所在门店所在城市id
}
@property(nonatomic, retain) NSString *uid;
@property(nonatomic, retain) NSString *user_name;
@property(nonatomic, retain) NSString *client_id;
@property(nonatomic, retain) NSString *city;
@end


@interface orderSubmit : NSObject
{
    NSString *order_id;       //会员id
    NSString *order_sn;       //会员用户名
}
@property(nonatomic, retain) NSString *order_id;
@property(nonatomic, retain) NSString *order_sn;
@end

@interface howMuchHongBaoLeft : NSObject
{
    NSString *hongbao;  //剩余红包
}
@property(nonatomic, retain) NSString *hongbao;
@end

@interface citySite : NSObject
{
    NSString *cName;    //省份
    NSString *cID;     //城市ID
}

@property(nonatomic, retain) NSString *cName;
@property(nonatomic, retain) NSString *cID;
@end


@interface MyVerify : NSObject
{
    NSString *companyName;
    NSString *province;
    NSString *city;
    NSString *district;
    NSString *companyAddress;
    NSString *mobile;
    NSString *contact;
    NSString *code;
}
@property(nonatomic, retain) NSString *companyName;
@property(nonatomic, retain) NSString *province;
@property(nonatomic, retain) NSString *city;
@property(nonatomic, retain) NSString *cID;
@property(nonatomic, retain) NSString *district;
@property(nonatomic, retain) NSString *companyAddress;
@property(nonatomic, retain) NSString *mobile;
@property(nonatomic, retain) NSString *contact;
@property(nonatomic, retain) NSString *code;
@end

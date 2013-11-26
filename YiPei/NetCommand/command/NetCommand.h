
//#define HOME_TODAY_MARKET       @"index.php?m=CityGoods&a=todayMarket"
//
//#define TODAY_DISCOUNT_GOODS    @"index.php?m=CityGoods&a=todayDiscountGoods"
//
//#define CITY_GOODS_INFO         @"index.php?m=CityGoods&a=getCityGoodsInfo"
//
//#define UPLOAD_IMAGE            @"index.php?m=CityGoods&a=uploadImage"
//
//#define LOW_PRICE_NOTIFY        @"index.php?m=CityGoods&a=lowPriceNotify"
//
//#define LOAD_CAR_INFO_BY_PID    @"index.php?m=CarCategory&a=loadCarInfoByPid"
//
//#define LOAD_CAR_INFO_BY_LEVEL  @"index.php?m=CarCategory&a=loadCarInfoByLevel"
//
//#define GOODS_CATEGORY_BY_PID   @"index.php?m= GoodsCategory&a=getGoodsCategoryByPid"

@interface NetCommand : NSObject <NSXMLParserDelegate> {
	NSMutableDictionary  *paramDict;// url参数表
//	NSString *cmdUrl;  // 命令url
	//NSMutableString *reqUrl;  // 请求url
	id data;
	BOOL isComplete;
    int errorCode;// 状态码
    NSString *errorMsg;// 错误提示信息
}
//@property(nonatomic, assign) NSMutableString *currentProperty;
//@property(nonatomic, retain) NSString *cmdUrl;
//@property(nonatomic, retain) NSString *reqUrl;
@property(nonatomic, retain) NSMutableDictionary *paramDict;
@property(nonatomic, retain) id data;
@property(nonatomic) BOOL isComplete;

@property(nonatomic) int errorCode;
@property(nonatomic, retain) NSString *errorMsg;

- (void)execute;
@end




===============version 3.3.2 ===============
lipo -create libCuzyAdSDK.a libCuzyAdSDK_device.a -output libCuzyAdSDK_universal.a


////version 3.3.2////////////////////////////////////////////

1. 新增对 京东数据平台的支持，web服务可以暂时访问 www.cuzy2.com
2. 数据切换，在发送数据请求之前，设置数据平台类型

/* using to switch between different database_type
 #define CUZY_TAOBAO_DATABASE 1
 #define CUZY_JD_DATABASE 2
 
 default will be CUZY_TAOBAO_DATABASE,
 if the value is wrong , will be set to default
 */
-(void)setCuzyDataBase:(int) dataBase_type;
-(int)getCuzyDataBase;






/////version 3.3//////////////////////////////////////////////
last update 2013.10.23
1. 新增团购类API
-(NSArray*)fetchGroupBuyingUsingKeyword:(NSString*)KeyWord
                               withPageIndex:(NSInteger)pageIndex
                                withCityName:(NSString*)cityString
                                withDistName:(NSString*)DistString
                                 withAreaKey:(NSString*)Areakey;

-(NSArray*)fetchGroupBuyingUsingGPSlatlon:(NSString*)latString
                            withlonString:(NSString*)lonString
                            withCoordType:(NSInteger)type
                               withRadius:(NSInteger)radius
                            withPageIndex:(NSInteger)pageIndex;
2. 新增淘宝店铺退关类API
更多细节可以查看本文档后面的细节
-(NSArray*)fetchTBshopItemsWithKeyword:(NSString*)keyString
                             WithPageIndex:(NSInteger)pageIndex
                             WithSortingMethodString:(NSString*)sortingString;




/////version 3.2////////////////////////////////////////
last update 2013.9.23
1. fix the itemID null bug
2. 
//是否包邮，0 为不包邮，1为包邮
@property(nonatomic, strong)NSString*   free_postage;
// 商品类型，0未知 1 为淘宝， 2为天猫 
@property(nonatomic, strong)NSString*   item_type;
// 更多此商品的图片，为一个数组，
@property(nonatomic, strong)NSArray*    picturesArray;


////version 3.1/////////////
last update 2013.8.13
1. add result filter function
2. add results sorting methods

////version 3.0//////////////
late update 2013.7.23
1. fix the tmall jump bug.
2. add change pic size function
///////////////////////////////



===========================================
1.  this is a SDK for taobaoke

2.  you can go to http://www.cuzy.com for more details

3.  Something Notable:
    1).Copy the apropriate architecture's .a library and the apropriate resource bundle when you test.
    2).You app's mainWindow's rootViewController should not be nil.
    3).Add -ObjC linker flag to your other link flag.

4.HOW TO USE:
#import "CuzyAdSDK.h"
@interface FrontViewController : UIViewController<CuzyAdSDKDelegate>

{
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [[CuzyAdSDK sharedAdSDK] setDelegate:self];
    [[CuzyAdSDK sharedAdSDK] registerAppWithAppKey:@"cuzy key" 	andAppSecret:@"cuzy secret"];
}


- (IBAction)showLayout1:(id)sender {
    
    [[CuzyAdSDK sharedAdSDK] fetchAppItemWithThemeID:@"" orSearchKeywords:@"衣服" withPageIndex:0];
}
- (IBAction)showLayout2:(id)sender {
    
    //////可以使用这个函数改变排序方式， 支持的排序方式有多种，具体可以参考文档或者.h文件/////////////////////////
    //[[CuzyAdSDK sharedAdSDK] setItemSortingMethod:@"commission_volume_desc"];
    ////// 可以用以下函数设置 过滤功能/////////////////////////////////////////////////////////////////
    
    //1.商品降价 大于30元
    [[CuzyAdSDK sharedAdSDK] setFilter_PromotionRange:@"100" withEnd:@""];
    
    //2. 卖家等级 大于10,五钻以上// [[CuzyAdSDK sharedAdSDK] setFilter_SellerCreditRange:@"10" withEnd:@""];
    
    //3.佣金比例大于20%//  [[CuzyAdSDK sharedAdSDK] setFilter_ComissionRate:@"2000" withEnd:@""];
    
    //4. 30天内促销量 大于500//[[CuzyAdSDK sharedAdSDK] setFilter_ComissionVolumeIn30days:@"500" withEnd:@""];
    
    //5. 淘宝类型//[[CuzyAdSDK sharedAdSDK] setFilter_itemType:@"1"];
    
    /////////////////////////////////////////////////////////////////////////
    [[CuzyAdSDK sharedAdSDK] fetchAppItemWithThemeID:@"2" orSearchKeywords:@"鞋子" withPageIndex:0];
}



- (IBAction)getRawArray:(id)sender {
    
    //avail able picsize can be check at API head .....
    [[CuzyAdSDK sharedAdSDK] setRawItemPicSize:@"250x250"];
    
   
    
    /////////////////////////////////////////////
    NSArray* rawArray  = [[CuzyAdSDK sharedAdSDK] fetchRawItemArraysWithThemeID:@"8" orSearchKeywords:@"鞋子" withPageIndex:0];
    
    NSLog(@"the rawArray size is %d", rawArray.count);
    for (int i =0;i<[rawArray count]; i++) {
        CuzyTBKItem* tempItem = [rawArray objectAtIndex:i];
        NSLog(@"the cuzyTBKitem pic is %@", tempItem.itemImageURLString);
        
    }
    
}
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
5. 获取团购数据
/////////////////////////////////////////////////


/* 通过关键字 或者类别信息获取团购信息
 
 ----------------必选参数-------------------------------
 "KeyWord" : 必选参数
            KeyWord团购名称关键字
 
 
 ----------------可选参数-------------------------------
 
 "pageIndex"    //当前的页数不填默认为第一页 即 page:0 ，最大页码为20
 
 "cityString"						//城市名，有街道则只依据街道
 "DistString"					//区县名
 "Areakey"						//地标或街道名
 
 
 
 */

-(NSArray*)fetchGroupBuyingUsingKeyword:(NSString*)KeyWord
                               withPageIndex:(NSInteger)pageIndex
                                withCityName:(NSString*)cityString
                                withDistName:(NSString*)DistString
                                 withAreaKey:(NSString*)Areakey;

/*
 通过经纬度度信息获取 团购信息
 
 
--------------------- 必选参数--------------------------
 x	"latString"        		 //维度
 x	"lonString"        		 //经度

 -------------------- 可选参数 --------------------------
 "type"			//默认为3 . 坐标的类型:
                      1.gcj02ll（国测局墨卡托坐标,火星坐标系）、
                      2.wgs84ll（GPS经纬度，地球坐标系）、
                      3.bd09ll（百度墨卡托坐标）
 "radius"          //半径 ，单位为米. 如果超过10000或小于1时，默认为100 , 建议值为10000
 "pageIndex"          //当前的页数不填默认为第一页 即 page:0 ，最大页码为20
 
 */
-
(NSArray*)fetchGroupBuyingUsingGPSlatlon:(NSString*)latString
                            withlonString:(NSString*)lonString
                            withCoordType:(NSInteger)type
                               withRadius:(NSInteger)radius
                            withPageIndex:(NSInteger)pageIndex;

＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
6. 获取淘宝店铺推广API

/* fetch taobao Shop，获取淘宝店铺API
 
 
 -------------------必选参数------------------------------------
"keyword"  //  keyword 店铺名称关键字
 
 -------------------可选参数---------------------------------------
 "page"          //当前的页数不填默认为第一页 即 page:0 ，最大页码为20

 
 排序方式:
 "seller_credit_desc" 卖家信用 降序
 "seller_credit_asc" 卖家信用 升序
 "commission_rate_desc"  佣金 降序
 "commission_rate_asc"  佣金 升序
 "auction_count_desc"  商品总数 降序
 "auction_count_asc"  商品总数 降序
 "total_auction_desc" 累计推广量 降序
 "total_auction_asc" 累计推广量 降序
*/


-(NSArray*)fetchTBshopItemsWithKeyword:(NSString*)keyString
                             WithPageIndex:(NSInteger)pageIndex
                             WithSortingMethodString:(NSString*)sortingString;



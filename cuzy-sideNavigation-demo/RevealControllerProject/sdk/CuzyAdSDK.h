//
//  CuzyAdSDK.h
//  CuzyAdSDK
//
//  Created by  on 13-3-26.
//  Copyright (c) 2013年 TheIndex. All rights reserved.
//  http://www.cuzy.com



///this is version 3.0
//last update 2013-7-23
//
#import <Foundation/Foundation.h>


#define CUZY_DEBUG 1


@class UIImage;
@class CuzyAdSDK;
@protocol CuzyAdSDKDelegate <NSObject>

@optional
-(void)registerAppSucceed;
-(void)registerAppFailed;
-(void)adActionWillBegin;
-(void)adActionDidFailed;
-(void)adActionDidFinish;

@end


@interface CuzyAdSDK : NSObject

@property(nonatomic,weak)id<CuzyAdSDKDelegate> delegate;

@property(nonatomic,readonly,getter = isActionInProgress)BOOL actionInProgress;

@property(nonatomic,strong,readonly)NSString* appKey;
@property(nonatomic,strong,readonly)NSString* appSecret;
@property(nonatomic,strong)NSString* credential;


@property(nonatomic,strong,readonly)NSBundle* resourceBundle;

-(UIImage*)resourceImageWithName:(NSString*)name;

+(CuzyAdSDK*)sharedAdSDK;

/*
 only for debug usage!~
 log the sdk version string!~
 */
-(void)logSDKVersion;

/*
 asynchronized API
 register app with appkey and appsecret!~
 you should implement the delegate method!~
 
 * appKey: 必选参数
 
 * appSecret: 必选参数
 
 */
-(void)registerAppWithAppKey:(NSString*)appKey andAppSecret:(NSString*)appSecret;



/*
 asynchronizaed API
 get tbk items,if you give themeid then you the keywords will be ignored.
 
* themeID: 必须参数之一， 可为空字符串
* keywords: 必选参数之一，themeid和keywords 必须有一个为非空字符串
* pageIndex: 必须参数

1. themeid is the id of theme you want to show, can be system hot theme, or your self app theme
 
2. keyword, the things you want to show, notice, 
 (keyword的优先级高于theme，如果keyword和theme同时不为空，那么返回keywords的搜索结果)
 
3. pageIndex, [from 0], the pages
 
 */
-(void)fetchAppItemWithThemeID:(NSString*)themeid
              orSearchKeywords:(NSString*)keywords
                 withPageIndex:(NSInteger)pageIndex;





/*
 will return a Array of CuzyTBKItems
 * themeID: 必须参数之一， 可为空字符串
 * keywords: 必选参数之一，themeid和keywords 必须有一个为非空字符串
 * pageIndex: 必须参数
 
 1. themeid is the id of theme you want to show, can be system hot theme, or your self app theme
 2. keyword, the things you want to show, notice,
 (keyword的优先级高于theme，如果keyword和theme同时不为空，那么返回keywords的搜索结果)
 3. pageIndex, [from 0], the pages
 
*/

-(NSArray*)fetchRawItemArraysWithThemeID:(NSString*)themeid
                        orSearchKeywords:(NSString*)keywords
                           withPageIndex:(NSInteger)pageIndex;




/*
 picsize: 可以定制返回图片的大小，注意图片越大，获取图片的时间越长。默认返回的图片大小为200*200
 600x600  400x400  360x360  350x350 320x320  310x310
 300x300  290x290   270x270  250x250 240x240 230x230
 220x220  210x210  200x200   190x190  180x180 170x170
 160x160  130x130   120x120  110x110   100x100 90x90
 80x80      70x70      60x60      40x40
 */

-(void)setRawItemPicSize:(NSString*)sizeString;

/*
 
    设置一次返回的物品个数，
 ［0 到 40］为有效值，默认为返回20个
 */
-(void)setRawItemPageNumber:(NSString*)PageString;








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





//////////set items filter//////////////////


/*
 注:
 筛选区间可与排序方式同时使用,其中筛选区间可以设置多个.排序方式只能选择一个,
 筛选区间:
 折扣价区间:  0 - ∞
 start_promotion: 起始折扣价
 end_promotion: 结束折扣价
 卖家信用区间: 1-20    1-5 心 6-10 钻  11-15 冠 16-20 皇冠
 start_credit:起始信用
 end_credit:结束信用
 佣金比例区间: 0-10000  换算为(0%-100%)
 start_commission_rate:起始佣金比例   规则: 去掉百分号*100  如4% 去掉% 4 *100  传入的参数为400
 end_commission_rate:结束佣金比例
 30天推广量:  0 - ∞
 start_commission_volume:起始推广量
 end_commission_volume:结束推广量
 推广类型: 枚举  1 集市 2 天猫
 item_type  搜索类型 不填为全部
 
 */
-(void)setFilter_PromotionRange:(NSString*)startPromotionRage withEnd:(NSString*)endPromotionRage;
-(void)setFilter_SellerCreditRange:(NSString*)startCreditRange withEnd: (NSString*)endCreditRange;
-(void)setFilter_ComissionRate:(NSString*)startCommissionRate withEnd:(NSString*)endCommissionRate;
-(void)setFilter_ComissionVolumeIn30days:(NSString*)startCommissionVolume withEnd:(NSString*)endCommissionVolume;
-(void)setFilter_itemType:(NSString*)itemType;

/////////end of set items filter////////////






//////set Item Sorting Method///////////////
/*
 排序方式:
 "promotion_asc"      折扣价由低到高
 "promotion_desc"     折扣价由高到低
 "seller_credit_score_desc" 卖家信用由高到低
 "commission_rate_desc"  佣金由高到低
 "commission_num_desc"   佣金比例由高到低
 "commission_volume_desc" 30天推广量由高到低
 例如 sort=promotion_asc
 注:
 筛选区间可与排序方式同时使用,其中筛选区间可以设置多个.排序方式只能选择一个,
 */

-(void)setItemSortingMethod:(NSString*)sortingMethodString;


////////////////////////////////////////////

-(void)start;
-(void)stop;
-(void)cancelAction;


//for debugging test server.
-(Boolean)usingTestingURL;
-(void)setTestingURL;





@end



@interface CuzyTBKItem : NSObject

@property(nonatomic,strong)NSNumber*    itemID;
@property(nonatomic,strong)NSString*    itemName;
@property(nonatomic,strong)NSString*    itemPrice;
@property(nonatomic,strong)NSString*    itemClickURLString;
@property(nonatomic,strong)NSString*    itemImageURLString;
@property(nonatomic,strong)NSString*    tradingVolumeInThirtyDays;
@property(nonatomic,strong)NSString*    promotionPrice;
//ours
@property(nonatomic,strong)NSString*    itemDescription;
//是否包邮，0 为不包邮，1为包邮
@property(nonatomic, strong)NSString*   free_postage;
// 商品类型，0未知 1 为淘宝， 2为天猫
@property(nonatomic, strong)NSString*   item_type;
// 更多此商品的图片，为一个数组，
@property(nonatomic, strong)NSArray*    picturesArray;
@end


////////////////////////////////////
@interface CuzyTBShopItem:NSObject
@property(strong, nonatomic)NSString* shopPid;
@property(strong, nonatomic)NSString* shopCategoryID;
@property(strong, nonatomic)NSString* shopClickUrl;
@property(strong, nonatomic)NSString* shopNickName;
//佣金比 "commission_rate": "170", = 17%
@property(strong, nonatomic)NSString* commissionRate;
@property(strong, nonatomic)NSString* shopCredit;
//店内商品总数
@property(strong, nonatomic)NSString* shopAuctionCount;
//累计推广量
@property(strong, nonatomic)NSString* shopTotalAuctionCount;
@property(strong, nonatomic)NSString* shopLogoPicture;
//店铺来源,1 淘宝集市 2天猫,
@property(strong, nonatomic)NSString* shopType;
@end

/////////////////////////////////////

@interface CuzyGroupBuyItem : NSObject
@property(strong, nonatomic)NSString* GroupBuyID;
@property(strong, nonatomic)NSString* GroupBuyTitle;
@property(strong, nonatomic)NSString* GroupBuyDescription;
@property(strong, nonatomic)NSString* GroupBuyProvince;
@property(strong, nonatomic)NSString* GroupBuyCity;
@property(strong, nonatomic)NSString* GroupBuyDistrict;
@property(strong, nonatomic)NSString* GroupBuyListprice;
@property(strong, nonatomic)NSString* GroupBuyCurrentPrice;
@property(strong, nonatomic)NSString* GroupBuyCategoryID;
@property(strong, nonatomic)NSString* GroupBuySubCategoryID;
@property(strong, nonatomic)NSString* GroupBuyRegions;
@property(strong, nonatomic)NSString* GroupBuyPurchaseCount;
@property(strong, nonatomic)NSString* GroupBuySmallImageUrl;
@property(strong, nonatomic)NSString* GroupBuyBigImageUrl;
@property(strong, nonatomic)NSString* GroupBuyNotice;
@property(strong, nonatomic)NSString* GroupBuyDealHtml5URL;

@property(strong, nonatomic)NSString* StartTime;
@property(strong, nonatomic)NSString* EndTime;



@end











//
//  CuzyAdSDK.h
//  CuzyAdSDK
//
//  Created by  on 13-3-26.
//  Copyright (c) 2013年 TheIndex. All rights reserved.
//



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
 */
-(void)registerAppWithAppKey:(NSString*)appKey andAppSecret:(NSString*)appSecret;



/*
 asynchronizaed API
 get tbk items,if you give themeid then you the keywords will be ignored.
 
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



#pragma mark - test

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

@end












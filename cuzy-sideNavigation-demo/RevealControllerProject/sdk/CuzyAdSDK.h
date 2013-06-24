//
//  CuzyAdSDK.h
//  CuzyAdSDK
//
//  Created by xiaohuzhu on 13-3-26.
//  Copyright (c) 2013年 xiaohuzhu. All rights reserved.
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
 */
-(void)fetchAppItemWithThemeID:(NSString*)themeid orSearchKeywords:(NSString*)keywords withPageIndex:(NSInteger)pageIndex;


/*
 will return a Array of CuzyTBKItems
 
 
 */

-(NSArray*)fetchRawItemArraysWithThemeID:(NSString*)themeid orSearchKeywords:(NSString*)keywords withPageIndex:(NSInteger)pageIndex;



-(void)start;
-(void)stop;


-(void)cancelAction;


//for debugging test server.
-(Boolean)usingTestingURL;
-(void)setTestingURL;



#pragma mark - test

@end



@interface CuzyTBKItem : NSObject
// http://api.taobao.com/apidoc/dataStruct.htm?path=cid:38-dataStructId:89-apiId:114-invokePath:taobaoke_items

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












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












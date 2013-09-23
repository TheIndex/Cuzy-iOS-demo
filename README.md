Cuzy-iOS-demo

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/0.png)
=============

iOS demo, that shows the capabilities of Cuzy SDK (淘宝客)，taobaoke, that can be found on http://www.cuzy.com


/////version 3.2/////////////

last update 2013.9.23

1. fix the itemID null bug

2. 

//是否包邮，0 为不包邮，1为包邮

@property(nonatomic, strong)NSString*   free_postage;

// 商品类型，0未知 1 为淘宝， 2为天猫 

@property(nonatomic, strong)NSString*   item_type;

// 更多此商品的图片，为一个数组，

@property(nonatomic, strong)NSArray*    picturesArray;





===============version 3.1==========================

last update 2013.8.13

1. add result filter function

2. add results sorting methods

===============version 3.0===============

last update: 2013.7.23
fix tmall jump bug.
add picsize function

==========================================

1.  this is a IOS APP SDK for taobaoke (Also has a sdk for android)

2.  you can download the sdk at : http://cuzy.com/index/download_sdk

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
    [[CuzyAdSDK sharedAdSDK] registerAppWithAppKey:@"cuzy key"   andAppSecret:@"cuzy secret"];
}


- (IBAction)showLayout1:(id)sender {
    [[CuzyAdSDK sharedAdSDK] fetchAppItemWithThemeID:nil orSearchKeywords:@"abcd"];
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



- (IBAction)getRawDataArray:(id)sender {
   NSArray* rawArray  = [[CuzyAdSDK sharedAdSDK] fetchRawItemArraysWithThemeID:@"8" orSearchKeywords:@"adbc" withPageIndex:0];
    
    NSLog(@"the rawArray size is %d", rawArray.count);
    for (int i =0;i<[rawArray count]; i++) {
        CuzyTBKItem* tempItem = [rawArray objectAtIndex:i];
        
    }

}



 5. set picture size
/*
 picsize: 可以定制返回图片的大小，注意图片越大，获取图片的时间越长。默认返回的图片大小为200*200
 600x600  400x400  360x360  350x350 320x320  310x310
 300x300  290x290   270x270  250x250 240x240 230x230
 220x220  210x210  200x200   190x190  180x180 170x170
 160x160  130x130   120x120  110x110   100x100 90x90
 80x80      70x70      60x60      40x40
 */

-(void)setRawItemPicSize:(NSString*)sizeString;

//////////////////////////////////////////////////////// 



////////////////////////////////////////////////////////


QQ：1263572458 QQ群：322622433

意见反馈及技术支持：Email:support@theindex.com,aa@theindex.com

地址：朝阳区西大望路甲3号 蓝堡国际中心1座2303

////////////////////////////////////////////////////////

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/1.png) ![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/5.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/2.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/3.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/4.png)



keywords:taobaoke,淘宝客，掌淘，手机淘客，cuzy，cuzysdk，返利，手机返利

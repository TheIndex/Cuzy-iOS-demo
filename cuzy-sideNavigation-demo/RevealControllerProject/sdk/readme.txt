


===============version 3.2 ===============
lipo -create libCuzyAdSDK.a libCuzyAdSDK_device.a -output libCuzyAdSDK_universal.a


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


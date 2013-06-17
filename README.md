Cuzy-iOS-demo

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/0.png)
=============

iOS demo, that shows the capabilities of Cuzy SDK (淘宝客), that can be found on http://www.cuzy.com

=========================================

last update: 2013.6.5

===============version 1.0===============

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
    [[CuzyAdSDK sharedAdSDK] fetchAppItemWithThemeID:@"8" orSearchKeywords:@"abcde"];
}
- (IBAction)getRawDataArray:(id)sender {
   NSArray* rawArray  = [[CuzyAdSDK sharedAdSDK] fetchRawItemArraysWithThemeID:@"8" orSearchKeywords:@"adbc" withPageIndex:0];
    
    NSLog(@"the rawArray size is %d", rawArray.count);
    for (int i =0;i<[rawArray count]; i++) {
        CuzyTBKItem* tempItem = [rawArray objectAtIndex:i];
        
    }

}



////////////////////////////////////////////////////////

QQ：1263572458 QQ群：322622433

意见反馈及技术支持：Email:support@theindex.com,aa@theindex.com

地址：朝阳区西大望路甲3号 蓝堡国际中心1座2303
////////////////////////////////////////////////////////

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/1.png) ![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/5.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/2.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/3.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/4.png)

===============version 3.1 ===============
lipo -create libCuzyAdSDK.a libCuzyAdSDK_device.a -output libCuzyAdSDK_universal.a


////version 3.1/////////////
last update 2013.8.13
1. add result filter function
2. add results sorting methods

////version 3.0//////////////
late update 2013.7.23
1. fix the tmall jump bug.
2. add change pic size function
///////////////////////////////



为了解决天猫物品的跳转问题，在使用 webview展示商品detail的时候。，需要重新构造一下跳转连接，代码如下。
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadingImage setHidden:YES];
    
    NSLog(@"webview fininsh loading %@", [webView.request.URL absoluteString]);
    NSString* absoluteString = [webView.request.URL absoluteString];
    if ([absoluteString rangeOfString:@"http://detail.tmall.com/"].length>0) {
        /////this is a web version url of tmall, need to converse to mobile version url
        //http://a.m.tmall.com/i14568464658.htm
        
        NSArray* substrings = [absoluteString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"?&"]];
        
        
        
        @try {
            NSString* idstring = [substrings objectAtIndex:1];
            NSString* subIdString = [idstring substringFromIndex:3];
            NSString* wapString = [@"" stringByAppendingFormat:@"http://a.m.tmall.com/i%@.htm",subIdString];
            urlString = wapString;
            NSURL* url = [NSURL URLWithString:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            if (url)
            {
                NSURLRequest* request = [NSURLRequest requestWithURL:url];
                if (request)
                {
                    [self.webview loadRequest:request];
                }
            }
        }
        @catch (NSException *exception) {
            ///todo
        }
        
    }

}


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


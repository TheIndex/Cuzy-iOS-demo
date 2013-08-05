Cuzy-iOS-demo

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/0.png)
=============

iOS demo, that shows the capabilities of Cuzy SDK (淘宝客), that can be found on http://www.cuzy.com

=========================================

last update: 2013.7.23
fix tmall jump bug.
add picsize function


===============version 3.0===============

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
/////////////////////////////////version 3.0///////////////////////
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

////////////////////////////////////////////////////////

QQ：1263572458 QQ群：322622433

意见反馈及技术支持：Email:support@theindex.com,aa@theindex.com

地址：朝阳区西大望路甲3号 蓝堡国际中心1座2303
////////////////////////////////////////////////////////

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/1.png) ![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/5.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/2.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/3.png)

![alt tag](https://raw.github.com/TheIndex/Cuzy-iOS-demo/master/pic/4.png)

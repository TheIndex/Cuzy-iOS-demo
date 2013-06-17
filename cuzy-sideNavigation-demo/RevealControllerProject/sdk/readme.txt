lipo -create libCuzyAdSDK.a libCuzyAdSDK_device.a -output libCuzyAdSDK_universal.a
===============version 1.0===============

1.  this is a SDK for taobaoke

2.  http://42.121.120.144:88/Public/api/api.txt

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
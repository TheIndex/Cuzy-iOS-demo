late update 2013.7.23
1. fix the tmall jump bug.
2. add change pic size function

///////////////////////////////


lipo -create libCuzyAdSDK.a libCuzyAdSDK_device.a -output libCuzyAdSDK_universal.a
===============version 3.0 ===============

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
    [[CuzyAdSDK sharedAdSDK] fetchAppItemWithThemeID:nil orSearchKeywords:@"男鞋"];
}
- (IBAction)showLayout2:(id)sender {
    [[CuzyAdSDK sharedAdSDK] fetchAppItemWithThemeID:@"8" orSearchKeywords:@"手机"];
}
- (IBAction)getRawDataArray:(id)sender {
   //avail able picsize can be check at API head .....
    [[CuzyAdSDK sharedAdSDK] setRawItemPicSize:@"250x250"];

   NSArray* rawArray  = [[CuzyAdSDK sharedAdSDK] fetchRawItemArraysWithThemeID:@"8" orSearchKeywords:@"夹克" withPageIndex:0];
    
    NSLog(@"the rawArray size is %d", rawArray.count);
    for (int i =0;i<[rawArray count]; i++) {
        CuzyTBKItem* tempItem = [rawArray objectAtIndex:i];
        
    }

}
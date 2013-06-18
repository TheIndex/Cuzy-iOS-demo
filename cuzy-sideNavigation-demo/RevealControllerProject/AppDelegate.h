

#import <UIKit/UIKit.h>
#import "imageCacheManager.h"
#import "FrontViewController.h"
@class RevealController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;
@property (retain, nonatomic) RevealController *viewController;
@property  (retain, nonatomic)FrontViewController *frontViewController;
@end

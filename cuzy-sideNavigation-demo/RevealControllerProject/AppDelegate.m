

#import "AppDelegate.h"

#import "RevealController.h"
#import "FrontViewController.h"
#import "RearViewController.h"
#import "ViewController.h"



@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize frontViewController;

static void uncaughtExceptionHandler(NSException *exception) {
    
    NSLog(@"CRASH: %@", exception);
    
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    
    // Internal error reporting
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:NO];
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    [imageCacheManager initCacheDirectory];
	self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	
	RearViewController *rearViewController;
    ViewController* collapseController;
    
	
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
	{
		frontViewController = [[FrontViewController alloc] initWithNibName:@"FrontViewController_iPhone" bundle:nil];
		rearViewController = [[RearViewController alloc] initWithNibName:@"RearViewController_iPhone" bundle:nil];
        collapseController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
	}
	else
	{
		frontViewController = [[FrontViewController alloc] initWithNibName:@"FrontViewController_iPad" bundle:nil];
		rearViewController = [[RearViewController alloc] initWithNibName:@"RearViewController_iPad" bundle:nil];
         collapseController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
	}
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
	
	//RevealController *revealController = [[RevealController alloc] initWithFrontViewController:navigationController rearViewController:rearViewController];
    RevealController *revealController = [[RevealController alloc] initWithFrontViewController:navigationController rearViewController:collapseController];
    
    if([navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackground.png"] forBarMetrics: UIBarMetricsDefault];
    }

    
	self.viewController = revealController;
	
	[navigationController release];
	[frontViewController release];
	[rearViewController release];
	[revealController release];
	
	self.window.rootViewController = self.viewController;
	[self.window makeKeyAndVisible];
	return YES;
}

#pragma mark - Memory management

- (void)dealloc
{
	[_window release], _window = nil;
	[_viewController release], _viewController = nil;
	[super dealloc];
}

@end
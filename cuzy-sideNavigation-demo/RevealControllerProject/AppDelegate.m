/* 
 
 Copyright (c) 2011, Philip Kluz (Philip.Kluz@zuui.org)
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 * Neither the name of Philip Kluz, 'zuui.org' nor the names of its contributors may 
 be used to endorse or promote products derived from this software 
 without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL PHILIP KLUZ BE LIABLE FOR ANY DIRECT, 
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 */

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
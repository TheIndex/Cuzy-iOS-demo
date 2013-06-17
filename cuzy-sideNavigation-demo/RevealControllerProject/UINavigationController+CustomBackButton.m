
#import "UINavigationController+CustomBackButton.h"
#import "UIViewController+CustomBackButton.h"

@implementation UINavigationController (CustomBackButton)

- (void)pushViewControllerWithCustomBackButton:(UIViewController *)viewController animated:(BOOL)animated {
    [self pushViewController:viewController animated:animated];
    [viewController addNavigationCutomizedBack];
}

- (void)pushViewControllerWithNoneBackButton:(UIViewController *)viewController animated:(BOOL)animated {
    [self pushViewController:viewController animated:animated];
    [viewController addNavigationCutomizedBackNone];
}

@end

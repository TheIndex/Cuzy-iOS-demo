

#import <UIKit/UIKit.h>

@interface UINavigationController (CustomBackButton)

- (void)pushViewControllerWithCustomBackButton:(UIViewController *)viewController animated:(BOOL)animated;
- (void)pushViewControllerWithNoneBackButton:(UIViewController *)viewController animated:(BOOL)animated;

@end

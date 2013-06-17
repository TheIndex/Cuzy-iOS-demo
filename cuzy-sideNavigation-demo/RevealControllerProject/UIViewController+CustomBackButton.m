

#import "UIViewController+CustomBackButton.h"
#import <QuartzCore/QuartzCore.h>


@implementation UIViewController (CustomBackButton)

-(void)addNavigationCutomizedBackNone {
    UIButton* backButton =[[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 37, 28)] autorelease];
    
    UIImage*buttonImage = [[UIImage imageNamed:@"NoneButton.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0.0];
    [backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    UIImage*buttonImage2 = [[UIImage imageNamed:@"NoneButton.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0.0];
    
    [backButton setBackgroundImage:buttonImage2 forState:UIControlStateHighlighted];
    
    backButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    backButton.titleLabel.textColor = [UIColor whiteColor];
    backButton.titleLabel.shadowOffset = CGSizeMake(0,-1);
    backButton.titleLabel.shadowColor = [UIColor darkGrayColor];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setTitle:@"  " forState:UIControlStateNormal];
    backButton.layer.cornerRadius = 5.0;
    
    UIBarButtonItem *backItems = [[[UIBarButtonItem alloc] initWithCustomView:backButton ] autorelease];
    
    self.navigationItem.leftBarButtonItem = backItems;
}

-(void)addNavigationCutomizedBack {
    UIButton* backButton =[[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 56, 31)] autorelease];
    
    UIImage*buttonImage = [[UIImage imageNamed:@"back_button.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:0.0];
    [backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    UIImage*buttonImage2 = [[UIImage imageNamed:@"back_button.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:0.0];

    [backButton setBackgroundImage:buttonImage2 forState:UIControlStateHighlighted];
    
    backButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    backButton.titleLabel.textColor = [UIColor whiteColor];
    backButton.titleLabel.shadowOffset = CGSizeMake(0,-1);
    backButton.titleLabel.shadowColor = [UIColor darkGrayColor];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setTitle:@"  " forState:UIControlStateNormal];
    backButton.layer.cornerRadius = 5.0;
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItems = [[[UIBarButtonItem alloc] initWithCustomView:backButton ] autorelease];
    
    self.navigationItem.leftBarButtonItem = backItems;
}

-(void)backAction {
    NSLog(@"%@", self.class);
    [self.navigationController popViewControllerAnimated:YES];
   
}

@end

//
//  settingAboutViewController.m
//  RevealControllerProject
//
//  Created by Apple on 13-5-31.
//
//

#import "settingAboutViewController.h"

@interface settingAboutViewController ()

@end

@implementation settingAboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default.png"]];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage)];
    [self.logoimage addGestureRecognizer:singleTap];
    [singleTap release];
    
    
}
-(void)onClickImage{
    //点击操作内容
    NSString *url = [NSString stringWithFormat:@"http://www.cuzy.com"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_logoimage release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLogoimage:nil];
    [super viewDidUnload];
}
@end

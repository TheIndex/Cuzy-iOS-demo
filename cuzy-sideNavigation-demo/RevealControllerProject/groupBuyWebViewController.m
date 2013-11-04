//
//  groupBuyWebViewController.m
//  RevealControllerProject
//
//  Created by Alex on 13-11-1.
//
//

#import "groupBuyWebViewController.h"

@interface groupBuyWebViewController ()

@end

@implementation groupBuyWebViewController
@synthesize urlString;
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
    UIButton* backButton = [[[UIButton alloc] initWithFrame:CGRectMake( 20, 20, 48 , 48)] autorelease];
    backButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cuzy_layout_1_back.png"]];
    [backButton addTarget:self action:@selector(gobackFunction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:backButton];

    self.webview.backgroundColor = [UIColor clearColor];
    self.webview.delegate = self;
    
    
    
    
    NSURL* url = [NSURL URLWithString:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    if (url) {
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        if (request) {
            [self.webview loadRequest:request];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)gobackFunction
{
    if ([self.webview isLoading]) {
        [self.webview stopLoading];
    }
    [self dismissModalViewControllerAnimated:YES];
}



- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{

}











- (void)dealloc {
    [_webview release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setWebview:nil];
    [super viewDidUnload];
}
@end

//
//  TaoBaoDetailViewController.m
//  RevealControllerProject
//
//  Created by Alex on 13-5-29.
//
//

#import "TaoBaoDetailViewController.h"

@interface TaoBaoDetailViewController ()
<UIWebViewDelegate>
@end

@implementation TaoBaoDetailViewController
@synthesize urlString;
-(void)setUrlString:(NSString *)inputUrlString
{
    if (![self.urlString isEqualToString:inputUrlString]) {
        urlString = inputUrlString;
        
       
    }}

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
    [self.backButton setImage:[UIImage imageNamed:@"cuzy_layout_1_cancel.png"]forState:UIControlStateNormal];
    
    self.webview.backgroundColor = [UIColor clearColor];
    self.webview.delegate = self;
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"loading.gif" ofType:nil];
    NSData* imageData = [NSData dataWithContentsOfFile:filePath];
    self.loadingImage.backgroundColor = [UIColor clearColor];
    [self.loadingImage setData:imageData];
    //NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL* url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        if (request) {
            [self.webview loadRequest:request];
        }
    }
}
- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webview release];
    [_backButton release];
    [_loadingImage release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setWebview:nil];
    [self setBackButton:nil];
    [self setLoadingImage:nil];
    [super viewDidUnload];
}
- (IBAction)backAction:(id)sender {
    if ([self.webview isLoading]) {
        [self.webview stopLoading];
    }
    [self.navigationController popViewControllerAnimated:YES];
}



- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.loadingImage setHidden:NO];
    NSString* absoluteString = [webView.request.URL absoluteString];
    
   

    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadingImage setHidden:YES];
    
    NSLog(@"webview fininsh loading %@", [webView.request.URL absoluteString]);
    NSString* absoluteString = [webView.request.URL absoluteString];
    if ([absoluteString rangeOfString:@"http://detail.tmall.com/"].length>0) {
        /////this is a web version url of tmall, need to converse to mobile version url
        //http://a.m.tmall.com/i14568464658.htm
        
        NSArray* substrings = [absoluteString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"?&"]];
        
        
        
        @try {
            NSString* idstring = [substrings objectAtIndex:1];
            NSString* subIdString = [idstring substringFromIndex:3];
            NSString* wapString = [@"" stringByAppendingFormat:@"http://a.m.tmall.com/i%@.htm",subIdString];
            urlString = wapString;
            NSURL* url = [NSURL URLWithString:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            if (url)
            {
                NSURLRequest* request = [NSURLRequest requestWithURL:url];
                if (request)
                {
                    [self.webview loadRequest:request];
                }
            }
        }
        @catch (NSException *exception) {
            ///todo
        }
        
    }
    
    if ([absoluteString rangeOfString:@"http://item.jd.com/"].length >0) {
        [self HandleJD:absoluteString];
    }
    
    
    [self RunJS];
}

-(void)RunJS
{
    
    [self.webview stringByEvaluatingJavaScriptFromString:@" var J_wrapper = document.getElementById('smartAd');"
     "document.body.removeChild(J_wrapper);"];
    
    
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.loadingImage setHidden:YES];
}

-(void)HandleJD:(NSString*)absoluteString
{
    //http://m.jd.com/product/667648.html
    //http://item.jd.com/667648.html
    
    [self.webview stopLoading];
    @try {
        NSRange result = [absoluteString rangeOfString:@"http://item.jd.com/"];
        NSString* endString = [absoluteString substringFromIndex:result.location+result.length];
        
        urlString = [@"http://m.jd.com/product/" stringByAppendingString:endString];
        urlString = [urlString stringByAppendingString:@"?v=t"];
        NSURL* url = [NSURL URLWithString:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        if (url)
        {
            NSURLRequest* request = [NSURLRequest requestWithURL:url];
            if (request)
            {
                [self.webview loadRequest:request];
            }
        }
    }
    @catch (NSException *exception) {
    }
    
    
    
    
}


@end

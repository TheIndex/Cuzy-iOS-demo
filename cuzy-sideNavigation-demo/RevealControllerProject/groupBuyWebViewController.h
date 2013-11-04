//
//  groupBuyWebViewController.h
//  RevealControllerProject
//
//  Created by Alex on 13-11-1.
//
//

#import <UIKit/UIKit.h>

@interface groupBuyWebViewController : UIViewController<UIWebViewDelegate>


@property(retain, nonatomic) IBOutlet UIWebView *webview;
@property(retain, nonatomic)NSString* urlString;



@end

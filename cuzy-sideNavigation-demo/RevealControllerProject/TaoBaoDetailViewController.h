//
//  TaoBaoDetailViewController.h
//  RevealControllerProject
//
//  Created by Alex on 13-5-29.
//
//

#import <UIKit/UIKit.h>
#import "SCGIFImageView.h"
@interface TaoBaoDetailViewController : UIViewController<UIWebViewDelegate>
{
    
}

@property(nonatomic,strong)NSString* urlString;
@property (retain, nonatomic) IBOutlet UIWebView *webview;
@property (retain, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)backAction:(id)sender;

@property (retain, nonatomic) IBOutlet SCGIFImageView *loadingImage;


@end

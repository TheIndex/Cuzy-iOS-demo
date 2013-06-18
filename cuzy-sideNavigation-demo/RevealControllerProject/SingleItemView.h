

#import <UIKit/UIKit.h>
#import "FrontViewController.h"
@interface SingleItemView : UIView{
    
}

@property(assign, nonatomic)FrontViewController* viewController;
@property (retain, nonatomic) NSString* clickUrlString;
@property (retain, nonatomic) IBOutlet UIImageView *imageViewContent;
@property (retain, nonatomic) IBOutlet UIImageView *imageViewBG;
@property (retain, nonatomic) IBOutlet UIButton *actionButtno;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;

@property (retain, nonatomic) IBOutlet UIImageView *devideLineImageView;

@property (retain, nonatomic) IBOutlet UILabel *totalSaleCountLable;
@property (retain, nonatomic) IBOutlet UILabel *priceLabel;


- (IBAction)TBKItemPressAction:(id)sender;



@end

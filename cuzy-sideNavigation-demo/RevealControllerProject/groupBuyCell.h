//
//  groupBuyCell.h
//  RevealControllerProject
//
//  Created by Alex on 13-11-4.
//
//

#import <UIKit/UIKit.h>

@interface groupBuyCell : UITableViewCell
{
    
}
@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UILabel *title;

@property (retain, nonatomic) IBOutlet UILabel *description;
@property (retain, nonatomic) IBOutlet UILabel *currentprice;
@property (retain, nonatomic) IBOutlet UILabel *oldPrice;
@property (retain, nonatomic) IBOutlet UILabel *sellAmount;
@end

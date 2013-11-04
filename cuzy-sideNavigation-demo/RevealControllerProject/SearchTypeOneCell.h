//
//  SearchTypeOneCell
//
//
//  Created by Alex on 5/4/12.
//  Copyright (c) 2012 theindex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StrikeThroughLabel.h"

//可用于帮手，机构，社群 的 search 信息展示
@interface SearchTypeOneCell : UITableViewCell
{
   
}

@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UILabel *title;
@property (retain, nonatomic) IBOutlet UILabel *description;
@property (retain, nonatomic) IBOutlet UILabel *currentprice;
@property (retain, nonatomic) IBOutlet StrikeThroughLabel *oldPrice;
@property (retain, nonatomic) IBOutlet UILabel *sellAmount;

@end

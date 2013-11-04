//
//  SearchTypeOneCell
//
//
//  Created by Alex on 5/4/12.
//  Copyright (c) 2012 theindex. All rights reserved.
//

#import "SearchTypeOneCell.h"

@implementation SearchTypeOneCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)dealloc {
    [_image release];
    [_title release];
    [_description release];
    [_currentprice release];
    [_oldPrice release];
    [_sellAmount release];
    [super dealloc];
}
@end

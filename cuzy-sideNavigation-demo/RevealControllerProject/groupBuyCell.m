//
//  groupBuyCell.m
//  RevealControllerProject
//
//  Created by Alex on 13-11-4.
//
//

#import "groupBuyCell.h"

@implementation groupBuyCell

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

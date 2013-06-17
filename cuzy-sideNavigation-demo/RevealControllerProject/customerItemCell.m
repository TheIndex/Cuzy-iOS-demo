//
//  customerItemCell.m
//  RevealControllerProject
//
//  Created by Alex on 13-5-28.
//
//

#import "customerItemCell.h"

@implementation customerItemCell

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
       [super dealloc];
}
@end

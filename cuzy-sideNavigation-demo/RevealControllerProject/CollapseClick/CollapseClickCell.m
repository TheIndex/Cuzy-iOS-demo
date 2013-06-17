//
//  CollapseClickCell.m
//  CollapseClick
//
//  Created by Ben Gordon on 2/28/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import "CollapseClickCell.h"

@implementation CollapseClickCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (CollapseClickCell *)newCollapseClickCellWithTitle:(NSString *)title index:(int)index content:(UIView *)content {
    NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CollapseClickCell" owner:nil options:nil];
    CollapseClickCell *cell = [[CollapseClickCell alloc] initWithFrame:CGRectMake(0, 0, 320, kCCHeaderHeight)];
    cell = [views objectAtIndex:0];
    
    // Initialization Here
    cell.TitleLabel.text = title;
    cell.TitleLabel.shadowOffset = CGSizeMake(0,0);
    cell.index = index;
    cell.TitleButton.tag = index;
    
    UIView* partyLine = [[UIView alloc] initWithFrame:CGRectMake(0, cell.TitleView.frame.size.height-1, 320, 1)];
    partyLine.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shoppingSidebarPartingLine.png"]];
    [cell.TitleView addSubview:partyLine];
    
    cell.ContentView.frame = CGRectMake(cell.ContentView.frame.origin.x, cell.ContentView.frame.origin.y, cell.ContentView.frame.size.width, content.frame.size.height);
    cell.ContentView.backgroundColor = [UIColor blackColor];
    [cell.ContentView addSubview:content];
    cell.TitleArrow.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shoppingSidebarDown.png"]];
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

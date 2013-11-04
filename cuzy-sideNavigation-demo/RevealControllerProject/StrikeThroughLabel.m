//
//  StrikeThroughLabel.m
//  StrikeThroughLabelExample
//
//  Created by Scott Hodgin on 12/14/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "StrikeThroughLabel.h"

@implementation StrikeThroughLabel

@synthesize strikeThroughEnabled = _strikeThroughEnabled;

- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:rect];
    
    CGSize textSize = [[self text] sizeWithFont:[self font]];
    CGFloat strikeWidth = textSize.width;
    CGRect lineRect;
    
    if ([self textAlignment] == UITextAlignmentRight) {
        lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2, strikeWidth, 1);
    } else if ([self textAlignment] == UITextAlignmentCenter) {
        lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2, strikeWidth, 1);
    } else {
        lineRect = CGRectMake(0, rect.size.height/2, strikeWidth, 1);
    }
    
    if (_strikeThroughEnabled) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextFillRect(context, lineRect);
    }
}

- (void)setStrikeThroughEnabled:(BOOL)strikeThroughEnabled {
    
    _strikeThroughEnabled = strikeThroughEnabled;
    
    NSString *tempText = [self.text copy];
    self.text = @"";
    self.text = tempText;
    [tempText release];
}

@end

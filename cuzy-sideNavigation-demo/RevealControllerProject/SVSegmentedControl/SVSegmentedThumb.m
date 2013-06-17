//
// SVSegmentedThumb.m
// SVSegmentedControl
//
// Created by Sam Vermette on 25.05.11.
// Copyright 2011 Sam Vermette. All rights reserved.
//
// https://github.com/samvermette/SVSegmentedControl
//

#import "SVSegmentedThumb.h"
#import <QuartzCore/QuartzCore.h>
#import "SVSegmentedControl.h"

@interface SVSegmentedThumb ()

@property (nonatomic, readwrite) BOOL selected;
@property (nonatomic, unsafe_unretained) SVSegmentedControl *segmentedControl;
@property (nonatomic, unsafe_unretained) UIFont *font;

@property (strong, nonatomic, readonly) UILabel *label;
@property (strong, nonatomic, readonly) UILabel *secondLabel;

- (void)activate;
- (void)deactivate;

@end


@implementation SVSegmentedThumb

@synthesize segmentedControl, backgroundImage, highlightedBackgroundImage, font, tintColor, textColor, textShadowColor, textShadowOffset, shouldCastShadow, selected;
@synthesize label, secondLabel;

// deprecated properties
@synthesize shadowColor, shadowOffset, castsShadow;



- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
	
    if (self) {
		self.userInteractionEnabled = NO;
		self.backgroundColor = [UIColor clearColor];
		self.textColor = [UIColor whiteColor];
		self.textShadowColor = [UIColor clearColor];
		self.textShadowOffset = CGSizeMake(0, 0);
        
        //[UIColor grayColor]
		self.tintColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:1];//;[UIColor yellowColor];;//[UIColor grayColor];
        self.shouldCastShadow = NO;
    }
	
    return self;
}

- (UILabel*)label {
    
    if(label == nil) {
        label = [[UILabel alloc] initWithFrame:self.bounds];
		label.textAlignment = UITextAlignmentCenter;
		label.font = self.font;
		label.backgroundColor = [UIColor clearColor];
		[self addSubview:label];
    }
    
    return label;
}

- (UILabel*)secondLabel {
    
    if(secondLabel == nil) {
		secondLabel = [[UILabel alloc] initWithFrame:self.bounds];
		secondLabel.textAlignment = UITextAlignmentCenter;
		secondLabel.font = self.font;
		secondLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:secondLabel];
    }
    
    return secondLabel;
}

- (UIFont *)font {
    return self.label.font;
}


- (void)drawRect:(CGRect)rect {
        
    if(self.backgroundImage && !self.selected)
        [self.backgroundImage drawInRect:rect];
    
    else if(self.highlightedBackgroundImage && self.selected)
        [self.highlightedBackgroundImage drawInRect:rect];
    
    else {
        
        CGFloat cornerRadius = self.segmentedControl.cornerRadius;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        // STROKE GRADIENT
        CGPathRef strokeRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius].CGPath;
        CGContextAddPath(context, strokeRect);
        CGContextClip(context);
        
        CGContextSaveGState(context);

        //if(0)
       // {
                        
//            CGFloat strokeComponents[4] = {0.55, 1,    0.40, 1};
//            
//            if(self.selected) {
//                strokeComponents[0]-=0.1;
//                strokeComponents[2]-=0.1;
//            }
//            
//            CGGradientRef strokeGradient = CGGradientCreateWithColorComponents(colorSpace, strokeComponents, NULL, sizeof(strokeComponents)/(sizeof(strokeComponents[0])*4));
//            CGContextDrawLinearGradient(context, strokeGradient, CGPointMake(0,0), CGPointMake(0,CGRectGetHeight(rect)), 0);
//            CGGradientRelease(strokeGradient);
       // }
      
        {
            //CGFloat components[4] = {0.40, 1,  0.62, 1};
            CGFloat components[8] = {
                255/255.0, 0/255.0, 0/255.0, 1,
                200/255.0,0/255.0,40/255.0,1};
            CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, NULL, sizeof(components)/(sizeof(components[0])*4));
            
            CGPathRef fillRect = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 1.5, 1.5) cornerRadius:cornerRadius].CGPath;
             CGContextAddPath(context, fillRect);
              CGContextClip(context);
            CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0,CGRectGetHeight(rect)), 0);
            CGGradientRelease(gradient);
        }

        
//        // FILL GRADIENT
//        {
//            CGPathRef fillRect = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 1, 1) cornerRadius:cornerRadius].CGPath;
//            CGContextAddPath(context, fillRect);
//            CGContextClip(context);
//            
//                       
//            
//            CGContextSetRGBFillColor(context,98/255.0,97/255.0,97/255.0,1);
//            CGContextFillRect(context, rect);
//            CGColorSpaceRelease(colorSpace);
//            CGContextRestoreGState(context);
//        }
        
        //[self.tintColor set];
        //UIRectFillUsingBlendMode(rect, kCGBlendModeOverlay);
    }
}


#pragma mark -
#pragma mark Setters

- (void)setBackgroundImage:(UIImage *)newImage {
    
    if(backgroundImage)
        backgroundImage = nil;
    
    if(newImage) {
        backgroundImage = newImage;
        self.shouldCastShadow = NO;
    } else {
        self.shouldCastShadow = YES;
    }
}

- (void)setTintColor:(UIColor *)newColor {
    
    if(tintColor)
        tintColor = nil;
	
	if(newColor)
		tintColor = newColor;

	[self setNeedsDisplay];
}

- (void)setFont:(UIFont *)newFont {
    self.label.font = self.secondLabel.font = newFont;
}

- (void)setTextColor:(UIColor *)newColor {
	self.label.textColor = self.secondLabel.textColor = newColor;
}

- (void)setTextShadowColor:(UIColor *)newColor {
	self.label.shadowColor = self.secondLabel.shadowColor = newColor;
}

- (void)setTextShadowOffset:(CGSize)newOffset {
	self.label.shadowOffset = self.secondLabel.shadowOffset = newOffset;
}

- (void)setShouldCastShadow:(BOOL)b {
    self.layer.shadowOpacity = b ? 1 : 0;
}


#pragma mark -

- (void)setFrame:(CGRect)newFrame {
	[super setFrame:newFrame];
        
    CGFloat posY = ceil((self.segmentedControl.height-self.font.pointSize+self.font.descender)/2)+self.segmentedControl.titleEdgeInsets.top-self.segmentedControl.titleEdgeInsets.bottom-self.segmentedControl.thumbEdgeInset.top+2;
	int pointSize = self.font.pointSize;
	
	if(pointSize%2 != 0)
		posY--;
    
	self.label.frame = self.secondLabel.frame = CGRectMake(0, posY, newFrame.size.width, self.font.pointSize);
    
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 1;
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.segmentedControl.cornerRadius].CGPath;
    self.layer.shouldRasterize = YES;
}


- (void)setSelected:(BOOL)s {
	
	selected = s;
	
	if(selected && !self.segmentedControl.crossFadeLabelsOnDrag && !self.highlightedBackgroundImage)
		self.alpha = 0.8;
	else
		self.alpha = 1;
	
	[self setNeedsDisplay];
}

- (void)activate {
	[self setSelected:NO];
    
    if(!self.segmentedControl.crossFadeLabelsOnDrag)
        self.label.alpha = 1;
}

- (void)deactivate {
	[self setSelected:YES];
    
    if(!self.segmentedControl.crossFadeLabelsOnDrag)
        self.label.alpha = 0;
}

#pragma mark - Support for deprecated methods

- (void)setShadowOffset:(CGSize)newOffset {
    self.textShadowOffset = newOffset;
}

- (void)setShadowColor:(UIColor *)newColor {
    self.textShadowColor = newColor;
}

- (void)setCastsShadow:(BOOL)b {
    self.shouldCastShadow = b;
}

@end

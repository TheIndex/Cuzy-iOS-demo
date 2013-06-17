//
// SWSegmentedControl.h
// SWSegmentedControl
//
// Created by Sam Vermette on 26.10.10.
// Copyright 2010 Sam Vermette. All rights reserved.
//
// https://github.com/samvermette/SVSegmentedControl
//

#import <UIKit/UIKit.h>
#import "SVSegmentedThumb.h"
#import <AvailabilityMacros.h>

@protocol SVSegmentedControlDelegate;

@interface SVSegmentedControl : UIControl

@property (nonatomic, copy) void (^changeHandler)(NSUInteger newIndex); // you can also use addTarget:action:forControlEvents:

@property (nonatomic, strong, readonly) SVSegmentedThumb *thumb;
@property (nonatomic, readwrite) NSUInteger selectedIndex; // default is 0
@property (nonatomic, readwrite) BOOL animateToInitialSelection; // default is NO
@property (nonatomic, readwrite) BOOL crossFadeLabelsOnDrag; // default is NO

@property (nonatomic, strong) UIColor *tintColor; // default is [UIColor grayColor]
@property (nonatomic, strong) UIImage *backgroundImage; // default is nil

@property (nonatomic, readwrite) CGFloat height; // default is 32.0
@property (nonatomic, readwrite) UIEdgeInsets thumbEdgeInset; // default is UIEdgeInsetsMake(2, 2, 3, 2)
@property (nonatomic, readwrite) UIEdgeInsets titleEdgeInsets; // default is UIEdgeInsetsMake(0, 10, 0, 10)
@property (nonatomic, readwrite) CGFloat cornerRadius; // default is 4.0

@property (nonatomic, strong) UIFont *font; // default is [UIFont boldSystemFontOfSize:15]
@property (nonatomic, strong) UIColor *textColor; // default is [UIColor grayColor];
@property (nonatomic, strong) UIColor *textShadowColor;  // default is [UIColor blackColor]
@property (nonatomic, readwrite) CGSize textShadowOffset;  // default is CGSizeMake(0, -1)

// deprecated properties
@property (nonatomic, copy) void (^selectedSegmentChangedHandler)(id sender) DEPRECATED_ATTRIBUTE; // use changeHandler instead
@property (nonatomic, strong) UIColor *shadowColor DEPRECATED_ATTRIBUTE;  // use textShadowColor instead
@property (nonatomic, readwrite) CGSize shadowOffset DEPRECATED_ATTRIBUTE;  // use textShadowOffset instead
@property (nonatomic, unsafe_unretained) id<SVSegmentedControlDelegate> delegate DEPRECATED_ATTRIBUTE; // use addTarget:action:forControlEvents: instead
@property (nonatomic, readwrite) CGFloat segmentPadding DEPRECATED_ATTRIBUTE; // use titleEdgeInsets instead

- (SVSegmentedControl*)initWithSectionTitles:(NSArray*)titlesArray;
- (void)moveThumbToIndex:(NSUInteger)segmentIndex animate:(BOOL)animate;

@end


@protocol SVSegmentedControlDelegate

- (void)segmentedControl:(SVSegmentedControl*)segmentedControl didSelectIndex:(NSUInteger)index;

@end

//========================here is the sample code for SVSegmentControl=========================================================================


//
////
////  ViewController.m
////  SVSegmentedControl
////
////  Created by Sam Vermette on 24.05.11.
////  Copyright 2011 Sam Vermette. All rights reserved.
////
//
//#import "ViewController.h"
//
//#import <QuartzCore/QuartzCore.h>
//
//@implementation ViewController
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//	
//	// 1st CONTROL
//	
//	SVSegmentedControl *navSC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Section 1", @"Section 2", nil]];
//    navSC.changeHandler = ^(NSUInteger newIndex) {
//        NSLog(@"segmentedControl did select index %i (via block handler)", newIndex);
//    };
//    
//	[self.view addSubview:navSC];
//	
//	navSC.center = CGPointMake(160, 70);
//	
//	
//	// 2nd CONTROL
//	
//	SVSegmentedControl *redSC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"About", @"Help", @"Credits", nil]];
//    [redSC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
//	
//	redSC.crossFadeLabelsOnDrag = YES;
//	redSC.thumb.tintColor = [UIColor colorWithRed:0.6 green:0.2 blue:0.2 alpha:1];
//	redSC.selectedIndex = 1;
//	
//	[self.view addSubview:redSC];
//	
//	redSC.center = CGPointMake(160, 170);
//	
//	
//	// 3rd CONTROL
//	
//	SVSegmentedControl *grayRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Section 1", @"Section 2", nil]];
//    [grayRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
//    
//	grayRC.font = [UIFont boldSystemFontOfSize:19];
//	grayRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
//	grayRC.height = 46;
//	
//	grayRC.thumb.tintColor = [UIColor colorWithRed:0 green:0.5 blue:0.1 alpha:1];
//	
//	[self.view addSubview:grayRC];
//	
//	grayRC.center = CGPointMake(160, 270);
//	
//	
//	// 4th CONTROL
//	
//	SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"One", @"Two", @"Three", nil]];
//    [yellowRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
//    
//	yellowRC.crossFadeLabelsOnDrag = YES;
//	yellowRC.font = [UIFont fontWithName:@"Marker Felt" size:20];
//	yellowRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
//	yellowRC.height = 40;
//	yellowRC.selectedIndex = 2;
//	
//	yellowRC.thumb.tintColor = [UIColor colorWithRed:0.999 green:0.889 blue:0.312 alpha:1.000];
//	yellowRC.thumb.textColor = [UIColor blackColor];
//	yellowRC.thumb.textShadowColor = [UIColor colorWithWhite:1 alpha:0.5];
//	yellowRC.thumb.textShadowOffset = CGSizeMake(0, 1);
//	
//	[self.view addSubview:yellowRC];
//	
//	yellowRC.center = CGPointMake(160, 370);
//	
//	
//	navSC.tag = 1;
//	redSC.tag = 2;
//	grayRC.tag = 3;
//	yellowRC.tag = 4;
//}
//
//
//#pragma mark -
//#pragma mark SPSegmentedControl
//
//- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl {
//	NSLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedIndex);
//}
//
///*
// // Override to allow orientations other than the default portrait orientation.
// - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
// // Return YES for supported orientations
// return (interfaceOrientation == UIInterfaceOrientationPortrait);
// }
// */
//
//- (void)didReceiveMemoryWarning {
//	// Releases the view if it doesn't have a superview.
//    [super didReceiveMemoryWarning];
//	
//	// Release any cached data, images, etc that aren't in use.
//}
//
//- (void)viewDidUnload {
//	// Release any retained subviews of the main view.
//	// e.g. self.myOutlet = nil;
//}
//
//
//
//@end

 



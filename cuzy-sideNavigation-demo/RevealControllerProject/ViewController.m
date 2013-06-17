//
//  ViewController.m
//  CollapseClick
//
//  Created by Ben Gordon on 2/28/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"
#import "DataSingleton.h"
#import "RearViewController.h"
#import "RevealController.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    myCollapseClick.CollapseClickDelegate = self;
    [myCollapseClick reloadCollapseClick];
    myCollapseClick.contentSize = CGSizeMake(320, DEVICE_SCREEN_HEIGHT+50);
    myCollapseClick.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shoppingBackground.png"]];
    if (IS_IPhone5) {
        [myCollapseClick setFrame:CGRectMake(0, 0, 320, DEVICE_SCREEN_HEIGHT)];
    }
    
    
    // If you want a cell open on load, run this method:
    [myCollapseClick openCollapseClickCellAtIndex:0 animated:NO];
    
    /*
     // If you'd like multiple cells open on load, create an NSArray of NSNumbers
     // with each NSNumber corresponding to the index you'd like to open.
     // - This will open Cells at indexes 0,2 automatically
     
     NSArray *indexArray = @[[NSNumber numberWithInt:0],[NSNumber numberWithInt:2]];
     [myCollapseClick openCollapseClickCellsWithIndexes:indexArray animated:NO];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Collapse Click Delegate

// Required Methods
-(int)numberOfCellsForCollapseClick {
    return 8;
}

-(NSString *)titleForCollapseClickAtIndex:(int)index {
    switch (index) {
        case 0:
            return @"个性男装";
            break;
        case 1:
            return @"潮流女装";
            break;
        case 2:
            return @"数码配件";
            break;
            
        case 3:
            return @"精品男鞋";
            break;
        case 4:
            return @"时尚女鞋";
            break;
        case 5:
            return @"箱包配饰";
            break;
            
        case 6:
            return @"运动健身";
            break;
        case 7:
            return @"美容护肤";
            break;
        default:
            return @"default";
            break;
    }
}

-(UIView *)viewForCollapseClickContentViewAtIndex:(int)index {
    switch (index) {
        case 0:
            return test1View;
            break;
        case 1:
            return test2View;
            break;
        case 2:
            return test3View;
            break;
            
        case 3:
            return test4View;
        case 4:
            return test5View;
            break;
        case 5:
            return test6View;
            break;
        case 6:
            return test7View;
            break;
        case 7:
            return test8View;
            break;
        default:
            return test1View;
            break;
    }
}


// Optional Methods

-(UIColor *)colorForCollapseClickTitleViewAtIndex:(int)index {
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"shoppingSidebarClassBg.png"]];
   // return [UIColor colorWithRed:223/255.0f green:47/255.0f blue:51/255.0f alpha:1.0];
}


-(UIColor *)colorForTitleLabelAtIndex:(int)index {
    return [UIColor colorWithWhite:0.0 alpha:1.0];
}

-(UIColor *)colorForTitleArrowAtIndex:(int)index {
    return [UIColor colorWithWhite:0.0 alpha:0.25];
}

-(void)didClickCollapseClickCellAtIndex:(int)index isNowOpen:(BOOL)open {
    NSLog(@"%d and it's open:%@", index, (open ? @"YES" : @"NO"));
}


#pragma mark - TextField Delegate for Demo
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)button1Pressed:(id)sender {
    
    [DataSingleton singleton].strInformation= @"button1 pressed";
}
- (void)dealloc {
   // [super dealloc];
}
- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void)goBackFrontView
{
    AppDelegate* delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //delegate.frontViewController
    [delegate.viewController revealToggle:delegate.frontViewController];
    
}
- (IBAction)action101:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 夹克";
    [self goBackFrontView];
}

- (IBAction)action102:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 西服";
    [self goBackFrontView];
}

- (IBAction)action103:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 衬衫";
    [self goBackFrontView];
}

- (IBAction)action104:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 T恤";
    [self goBackFrontView];

}

- (IBAction)action105:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 polo衫";
    [self goBackFrontView];

}

- (IBAction)action106:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 背心";
    [self goBackFrontView];
}

- (IBAction)action107:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 牛仔裤";
    [self goBackFrontView];

}

- (IBAction)action108:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 休闲裤";
    [self goBackFrontView];
}

- (IBAction)action201:(id)sender
{
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 T恤";
    [self goBackFrontView];
}

- (IBAction)action202:(id)sender
{
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 针织衫";
    [self goBackFrontView];
}

- (IBAction)action203:(id)sender
{
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 衬衫";
    [self goBackFrontView];
}

- (IBAction)action204:(id)sender
{
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"雪纺衫";
    [self goBackFrontView];
}

- (IBAction)action205:(id)sender
{
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"连衣裙";
    [self goBackFrontView];
}

- (IBAction)action206:(id)sender
{
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"半身裙";
    [self goBackFrontView];
}

- (IBAction)action207:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 休闲裤";
    [self goBackFrontView];
}

- (IBAction)action208:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 牛仔裤";
    [self goBackFrontView];
}

- (IBAction)action301:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"移动电源";
    [self goBackFrontView];
}

- (IBAction)action302:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"保护外壳";
    [self goBackFrontView];
}

- (IBAction)action303:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"手机 配件";
    [self goBackFrontView];
}

- (IBAction)action304:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"耳机耳麦";
    [self goBackFrontView];
}

- (IBAction)action401:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 休闲鞋";
    [self goBackFrontView];
}

- (IBAction)action402:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 帆布鞋";
    [self goBackFrontView];
}

- (IBAction)action403:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 板鞋";
    [self goBackFrontView];
}

- (IBAction)action404:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男 凉鞋";
    [self goBackFrontView];
}

- (IBAction)action501:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 凉鞋";
    [self goBackFrontView];
}

- (IBAction)action502:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 帆布鞋";
    [self goBackFrontView];
}

- (IBAction)action503:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 凉拖";
    [self goBackFrontView];
}

- (IBAction)action504:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女 单鞋";
    [self goBackFrontView];
}

- (IBAction)action601:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"男包";
    [self goBackFrontView];
}

- (IBAction)action602:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"女包";
    [self goBackFrontView];
}

- (IBAction)action603:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"钱包";
    [self goBackFrontView];
}

- (IBAction)action604:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"饰品";
    [self goBackFrontView];
}

- (IBAction)action701:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"运动服";
    [self goBackFrontView];
}

- (IBAction)action702:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"运动包";
    [self goBackFrontView];
}

- (IBAction)action703:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"运动鞋";
    [self goBackFrontView];
}

- (IBAction)action704:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"健身器材";
    [self goBackFrontView];
}

- (IBAction)action801:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"面膜";
    [self goBackFrontView];
}

- (IBAction)action802:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"乳液";
    [self goBackFrontView];
}

- (IBAction)action803:(id)sender {
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"爽肤水";
    [self goBackFrontView];
}

- (IBAction)action804:(id)sender
{
    [DataSingleton singleton].newSearchNeeded = 1;
    [DataSingleton singleton].searchString = @"美容 仪器";
    [self goBackFrontView];
}

@end

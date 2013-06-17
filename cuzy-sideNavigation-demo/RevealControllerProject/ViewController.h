//
//  ViewController.h
//  CollapseClick
//
//  Created by Ben Gordon on 2/28/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollapseClick.h"

@interface ViewController : UIViewController <CollapseClickDelegate,UITextFieldDelegate>
{
     
    IBOutlet UIView *test1View;
    IBOutlet UIView *test2View;
    
    IBOutlet UIView *test3View;
    
    IBOutlet UIView *test4View;
    
    IBOutlet UIView *test5View;
    
    IBOutlet UIView *test6View;
    
    IBOutlet UIView *test7View;
    
    IBOutlet UIView *test8View;
    __weak IBOutlet CollapseClick *myCollapseClick;
}

- (IBAction)action101:(id)sender;
- (IBAction)action102:(id)sender;
- (IBAction)action103:(id)sender;
- (IBAction)action104:(id)sender;
- (IBAction)action105:(id)sender;
- (IBAction)action106:(id)sender;
- (IBAction)action107:(id)sender;
- (IBAction)action108:(id)sender;

- (IBAction)action201:(id)sender;
- (IBAction)action202:(id)sender;
- (IBAction)action203:(id)sender;
- (IBAction)action204:(id)sender;
- (IBAction)action205:(id)sender;
- (IBAction)action206:(id)sender;
- (IBAction)action207:(id)sender;
- (IBAction)action208:(id)sender;

- (IBAction)action301:(id)sender;
- (IBAction)action302:(id)sender;
- (IBAction)action303:(id)sender;
- (IBAction)action304:(id)sender;

- (IBAction)action401:(id)sender;
- (IBAction)action402:(id)sender;
- (IBAction)action403:(id)sender;
- (IBAction)action404:(id)sender;

- (IBAction)action501:(id)sender;
- (IBAction)action502:(id)sender;
- (IBAction)action503:(id)sender;
- (IBAction)action504:(id)sender;

- (IBAction)action601:(id)sender;
- (IBAction)action602:(id)sender;
- (IBAction)action603:(id)sender;
- (IBAction)action604:(id)sender;

- (IBAction)action701:(id)sender;
- (IBAction)action702:(id)sender;
- (IBAction)action703:(id)sender;
- (IBAction)action704:(id)sender;

- (IBAction)action801:(id)sender;
- (IBAction)action802:(id)sender;
- (IBAction)action803:(id)sender;
- (IBAction)action804:(id)sender;





@end

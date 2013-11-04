//
//  groupBuyViewController.h
//  RevealControllerProject
//
//  Created by Alex on 13-10-31.
//
//

#import <UIKit/UIKit.h>

@interface groupBuyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (retain, nonatomic) IBOutlet UITableView *tableview;
@property (retain, nonatomic)NSMutableArray* dataArray;
@end

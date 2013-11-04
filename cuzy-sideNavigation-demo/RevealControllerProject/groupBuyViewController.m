//
//  groupBuyViewController.m
//  RevealControllerProject
//
//  Created by Alex on 13-10-31.
//
//

#import "groupBuyViewController.h"
#import "SearchTypeOneCell.h"
#import "groupBuyWebViewController.h"
#import "CuzyAdSDK.h"
#import "imageCacheManager.h"


@interface groupBuyViewController ()

@end

@implementation groupBuyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.dataArray = [[[NSMutableArray alloc] init] autorelease];
    
    NSArray* rawArray  = [[CuzyAdSDK sharedAdSDK] fetchGroupBuyingUsingKeyword:@"美食" withPageIndex:0 withCityName: @"上海" withDistName:@"" withAreaKey:@""];
    for (int i =0;i<[rawArray count]; i++) {
        CuzyGroupBuyItem* tempItem = [rawArray objectAtIndex:i];
        NSLog(@"the id of the CuzyGroupBuyItem is %@  ",tempItem.GroupBuyCategoryID);
        NSLog(@"the title is %@", tempItem.GroupBuyTitle);
        NSLog(@"the Description is %@", tempItem.GroupBuyDescription);
        NSLog(@"the province is %@", tempItem.GroupBuyProvince);
        NSLog(@"the city is %@", tempItem.GroupBuyCity);
        NSLog(@"the district is %@",tempItem.GroupBuyDistrict);
        NSLog(@"the list price is %@", tempItem.GroupBuyListprice);
        NSLog(@"the current price is %@", tempItem.GroupBuyCurrentPrice);
        NSLog(@"the  category id is %@", tempItem.GroupBuyCategoryID);
        NSLog(@"the sub category id is %@", tempItem.GroupBuySubCategoryID);
        NSLog(@"the regions is %@", tempItem.GroupBuyRegions);
        NSLog(@"the Buy Count is %@", tempItem.GroupBuyPurchaseCount);
        NSLog(@"the Big image url is %@", tempItem.GroupBuyBigImageUrl);
        NSLog(@"the small image url is %@", tempItem.GroupBuySmallImageUrl);
        
        NSLog(@"the notice is %@", tempItem.GroupBuyNotice);
        NSLog(@"the Html5url is %@", tempItem.GroupBuyDealHtml5URL);
        NSLog(@"the start time is %@", tempItem.StartTime);
        NSLog(@"the end time is %@", tempItem.EndTime);
        
    }
    
    
    
    NSLog(@"the rawArray size is %d", rawArray.count);

    [self.dataArray addObjectsFromArray:rawArray];
    [self.tableview reloadData];
    
    UIButton* backButton = [[[UIButton alloc] initWithFrame:CGRectMake( 20, 20, 48 , 48)] autorelease];
    backButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cuzy_layout_1_back.png"]];
    [backButton addTarget:self action:@selector(gobackFunction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:backButton];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)gobackFunction
{
    [self dismissModalViewControllerAnimated:YES];
}


// to determine specific row height for each cell, override this.
// In this example, each row is determined by its subviews that are embedded.
//
#pragma mark - TableView Datasource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ////
    
    return 81;
	
}

// to determine which UITableViewCell to be used on a given row.
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    
    SearchTypeOneCell*cell = (SearchTypeOneCell *)[tableView dequeueReusableCellWithIdentifier:@"TypeOneCell"];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"SearchTypeOneCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
    }
    CuzyGroupBuyItem* tempItem = [self.dataArray objectAtIndex:indexPath.row];

    
    
    [imageCacheManager setImageView:cell.image withUrlString:tempItem.GroupBuyBigImageUrl];
    cell.title.text = tempItem.GroupBuyTitle;
    cell.description.text = tempItem.GroupBuyDescription;
    cell.currentprice.text = [NSString stringWithFormat:@"￥%@元",tempItem.GroupBuyCurrentPrice];
    cell.oldPrice.text=  tempItem.GroupBuyListprice;
    cell.oldPrice.strikeThroughEnabled = YES;
    cell.sellAmount.text = [NSString stringWithFormat:@"参团%@" ,tempItem.GroupBuyPurchaseCount];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CuzyGroupBuyItem* tempItem = [self.dataArray objectAtIndex:indexPath.row];
    groupBuyWebViewController* groupView =  [[groupBuyWebViewController alloc] initWithNibName:@"groupBuyWebViewController" bundle:nil] ;
    [groupView setUrlString: tempItem.GroupBuyDealHtml5URL];
    [self presentModalViewController:groupView animated:YES];
}



- (void)dealloc {
    [_tableview release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableview:nil];
    [super viewDidUnload];
}
@end

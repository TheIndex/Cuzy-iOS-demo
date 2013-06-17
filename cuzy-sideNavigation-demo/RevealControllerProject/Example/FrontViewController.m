

#import "FrontViewController.h"
#import "DataSingleton.h"
#import "customerItemCell.h"
#import "SingleItemView.h"
#import <QuartzCore/QuartzCore.h>
#import "imageCacheManager.h"
#import "TaoBaoDetailViewController.h"
#import "UINavigationController+CustomBackButton.h"
#import "JSONKit.h"
#import "LoadingMoreFooterView.h"
#import "SettingViewController.h"
#import "DataSingleton.h"
#import "SVSegmentedControl.h"
@interface FrontViewController()

// Private Properties:
@property (retain, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;

// Private Methods:
- (IBAction)pushExample:(id)sender;

@end

@implementation FrontViewController

@synthesize navigationBarPanGestureRecognizer = _navigationBarPanGestureRecognizer;
@synthesize dataArray;
@synthesize loadFooterView=_loadFooterView,loadingmore=_loadingmore;
@synthesize twebView, segmentController;


#pragma mark - View lifecycle

#define SERIALIZATION_JSON_STRING @"serialization_json_string"
#define CAP_WIDTH 15.0
-(void)viewDidLoad
{
    [super viewDidLoad];
 
    {
        [[CuzyAdSDK sharedAdSDK] setDelegate:self];
        
        //[[CuzyAdSDK sharedAdSDK] setTestingURL];
        //[[CuzyAdSDK sharedAdSDK] registerAppWithAppKey:@"200056" 	andAppSecret:@"051a9e4652fc5b881dfc6ba74d3cd633"];
        
        
        //release server key & secret:
        [[CuzyAdSDK sharedAdSDK] registerAppWithAppKey:@"200003" 	andAppSecret:@"208f53acd6d396867c2a721be6c807eb"];

        
    }
   
    
    
    
    
    currentPageIndex = 0;
    self.dataArray = [[[NSMutableArray alloc] init] autorelease];
    self.tableref.backgroundView = nil;
    self.tableref.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cuzy_layout_1_tile_bg.png"]];
    [self.tableref setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"updateInformation" object:nil];
    
  
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* JsonString = [defaults valueForKey:SERIALIZATION_JSON_STRING];
    if ([JsonString isKindOfClass:[NSString class]] && JsonString.length > 0) {
        self.dataArray = [self JSONStringToTBKItemsArray:JsonString];
        [self.tableref reloadData];
    }
    else
    {
        
    }
   
    //self.myScrollView.contentSize =CGSizeMake(320, self.myScrollView.frame.size.height+44);
    if (IS_IPhone5) {
        
        self.loadFooterView = [[LoadingMoreFooterView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-44+(1136/2 - 480), 320.0f, 44.f)];

    }
    else
    {
        self.loadFooterView = [[LoadingMoreFooterView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-44, 320.0f, 44.f)];

    }
    self.loadFooterView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbarBackground.png"]];
    self.loadingmore = NO;
    
    [self.view addSubview:self.loadFooterView];
    [self.loadFooterView setHidden:YES];
    
    [self addTaobaoWebview];
    segmentController =[[[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"热门频道", @"精品展示", nil]] autorelease];
    segmentController.frame = CGRectMake(0, 0, 90, 30);
    [segmentController setFrame:CGRectMake(70, 7, 180, 30)];
    segmentController.backgroundColor = [UIColor clearColor];
    [segmentController addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
    [self.navigationController.navigationBar addSubview:segmentController];
  
}


-(void)addTaobaoWebview
{
    self.twebView = [[[UIWebView alloc] initWithFrame:self.view.frame] autorelease];
    if (IS_IPhone5) {
        [self.twebView setFrame:CGRectMake(0, 0, 320, 564)];
    }
    [self.view addSubview:twebView];
    
    
    [self startTaobaoWebview];
}
-(void)startTaobaoWebview
{
    NSString* originalString =[self getRandomUrl];
    NSURL* url = [NSURL URLWithString:[originalString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    if (url) {
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        if (request) {
            [self.twebView loadRequest:request];
        }
    }
}

-(NSString*)getRandomUrl
{
    int random = rand() % [DataSingleton singleton].TweburlArray.count;
    NSString* urlstring = [[DataSingleton singleton].TweburlArray objectAtIndex:random];
    return  urlstring;
}
-(void)createNavigationLeftButton
{
    UIButton* mapButton =[[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52 , 31)] autorelease];
    
    UIImage*buttonImage = [[UIImage imageNamed:@"navigationButtonSider.png"] stretchableImageWithLeftCapWidth:CAP_WIDTH topCapHeight:0.0 ];
    [mapButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    UIImage*buttonImage2 = [[UIImage imageNamed:@"navigationButtonSider.png"] stretchableImageWithLeftCapWidth:CAP_WIDTH topCapHeight:0.0 ];
    [mapButton setBackgroundImage:buttonImage2 forState:UIControlStateHighlighted];
    
        
    
    mapButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    mapButton.titleLabel.textColor = [UIColor whiteColor];
    mapButton.titleLabel.shadowOffset = CGSizeMake(0,-1);
    mapButton.titleLabel.shadowColor = [UIColor darkGrayColor];
    mapButton.backgroundColor = [UIColor clearColor];
    [mapButton
     setTitle:@"  " forState:UIControlStateNormal];
    mapButton.layer.cornerRadius = 5.0;
    [mapButton addTarget:self.navigationController.parentViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:mapButton ] autorelease];
}

-(void)createNavigationRightButton
{
    UIButton* mapButton =[[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42 , 31)] autorelease];
    UIImage*buttonImage = [[UIImage imageNamed:@"shoppingTaobao.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:0.0 ];
    [mapButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    UIImage*buttonImage2 = [[UIImage imageNamed:@"shoppingTaobao.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:0.0 ];
    [mapButton setBackgroundImage:buttonImage2 forState:UIControlStateHighlighted];
    

    
    
    
    mapButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    mapButton.titleLabel.textColor = [UIColor whiteColor];
    mapButton.titleLabel.shadowOffset = CGSizeMake(0,-1);
    mapButton.titleLabel.shadowColor = [UIColor darkGrayColor];
    mapButton.backgroundColor = [UIColor clearColor];
    [mapButton
     setTitle:@"  " forState:UIControlStateNormal];
    mapButton.layer.cornerRadius = 5.0;
    [mapButton addTarget:self action:@selector(startSettingViewController) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:mapButton ] autorelease];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    [self.segmentController setHidden:NO];
	
	self.title = @"首页";
	
	if ([self.navigationController.parentViewController respondsToSelector:@selector(revealGesture:)] && [self.navigationController.parentViewController respondsToSelector:@selector(revealToggle:)])
	{
		// Check if a UIPanGestureRecognizer already sits atop our NavigationBar.
		if (![[self.navigationController.navigationBar gestureRecognizers] containsObject:self.navigationBarPanGestureRecognizer])
		{
			// If not, allocate one and add it.
            {
                UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
                self.navigationBarPanGestureRecognizer = panGestureRecognizer;
                [panGestureRecognizer release];
                
                [self.navigationController.navigationBar addGestureRecognizer:self.navigationBarPanGestureRecognizer];
            }
			
            {
                UIPanGestureRecognizer *panGestureRecognizer= [[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
                self.navigationBarPanGestureRecognizer = panGestureRecognizer;
                [panGestureRecognizer release];
                
                [self.view addGestureRecognizer:self.navigationBarPanGestureRecognizer];
            }
            
            
           
		}
		
		// Check if we have a revealButton already.
		if (![self.navigationItem leftBarButtonItem])
		{
			// If not, allocate one and add it.
			/*UIBarButtonItem *revealButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Reveal", @"Reveal") style:UIBarButtonItemStylePlain target:self.navigationController.parentViewController action:@selector(revealToggle:)];
			self.navigationItem.leftBarButtonItem = revealButton;
			[revealButton release];
            */
            [self createNavigationLeftButton];
            [self createNavigationRightButton];
            
		}
        
       
        
	}
    
    
    self.NoticeLabel.text = [DataSingleton singleton].strInformation;
    
       
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.segmentController setHidden:YES];
}

#pragma mark - Example Code

- (void)pushExample:(id)sender
{
	UIViewController *stubController = [[UIViewController alloc] init];
	stubController.view.backgroundColor = [UIColor whiteColor];
	[self.navigationController pushViewController:stubController animated:YES];
	[stubController release];
}

-(void)startThreadWork_fetchTBKItems:(NSString*)searchKey
{
    dispatch_queue_t downloadQueue = dispatch_queue_create("fetch TBK Items queue", NULL);
    dispatch_async(downloadQueue, ^{
        NSArray* ThemeIdArray =[[[NSArray alloc] initWithObjects:@"12",@"14",@"25",@"6", nil] autorelease ];
        
        int random = rand()%4;
        
        NSString* themeString = [ThemeIdArray objectAtIndex:random];
        NSMutableArray* returnArray =
       (NSMutableArray*)[[CuzyAdSDK sharedAdSDK] fetchRawItemArraysWithThemeID:themeString orSearchKeywords:searchKey withPageIndex:currentPageIndex];
        
        if (self.loadingmore)
        {
            [self.dataArray addObjectsFromArray:returnArray];
        }
        else
        {
            self.dataArray = returnArray;
        }

        
        
        
        NSString* jsonString = [self  TBKitemsArrayToJSONString:self.dataArray];
        NSLog(@"the json string is %@", jsonString);
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:jsonString forKey:SERIALIZATION_JSON_STRING];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //update the UI in main queue;
            
            if (self.loadingmore) {
                self.loadingmore = NO;
                self.loadFooterView.showActivityIndicator = NO;
                [self.loadFooterView setHidden:YES];
            }
            else
            {
                [self.tableref setContentOffset:CGPointMake(0, 0)];

            }
            [self.tableref reloadData];
            
         });
    });
    dispatch_release(downloadQueue); //won’t actually go away until queue is empty
    
}
-(void)receiveNotification:(NSNotification*)note{
    //return from category , reset page information
    currentPageIndex = 0;
    if ([DataSingleton singleton].newSearchNeeded == 1) {
        [DataSingleton singleton].newSearchNeeded = 0;
        [self.twebView setHidden:YES];
        if (segmentController.selectedIndex == 0) {
            [segmentController moveThumbToIndex:1 animate:YES];
        }
        [self startThreadWork_fetchTBKItems:[DataSingleton singleton].searchString];
    
    }

    self.NoticeLabel.text = [DataSingleton singleton].strInformation;
}

#pragma mark - Memory Management

- (void)dealloc
{
	[self.navigationController.navigationBar removeGestureRecognizer:self.navigationBarPanGestureRecognizer];
	[_navigationBarPanGestureRecognizer release], _navigationBarPanGestureRecognizer = nil;
    [_NoticeLabel release];
    [_tableref release];
    [_myScrollView release];
	[super dealloc];
}

- (void)viewDidUnload {
    [self setNoticeLabel:nil];
    [[NSNotificationCenter defaultCenter] removeObject:self];
    [self setTableref:nil];
    [self setMyScrollView:nil];
    [super viewDidUnload];
}


#pragma mark - TableView Datasource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int nRows = dataArray.count/2;
    return nRows;
}

#define LEFT_ITEM_TAG 1003
#define RIGHT_ITEM_TAG 1004
static int currentPageIndex = 0;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"customerItemCell";
    
    customerItemCell *cell = (customerItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"customerItemCell"owner:self options:nil];
            cell = [array objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
           NSArray *array1 = [[NSBundle mainBundle] loadNibNamed:@"SingleItemView" owner:self options:nil];
            SingleItemView* leftView = [array1 objectAtIndex:0];
            leftView.center = CGPointMake(80, 85);
            leftView.tag = LEFT_ITEM_TAG;
            leftView.viewController = self;
            [cell addSubview:leftView];
            [leftView.imageViewContent setImage:[UIImage imageNamed:@"weibo.png"]];
            
            
            NSArray *array2 = [[NSBundle mainBundle] loadNibNamed:@"SingleItemView"owner:self options:nil];
            SingleItemView* rightView = [array2 objectAtIndex:0];
            rightView.tag = RIGHT_ITEM_TAG;
            rightView.viewController = self;
            rightView.center = CGPointMake(240, 85);
            [cell addSubview:rightView];
        }
   
    SingleItemView*leftView = (SingleItemView*)[cell viewWithTag:LEFT_ITEM_TAG];
    [self setSingleItemView:leftView withTaobaoItem:[self.dataArray objectAtIndex:2*indexPath.row]];
    SingleItemView*rightView = (SingleItemView*)[cell viewWithTag:RIGHT_ITEM_TAG];
    [self setSingleItemView:rightView withTaobaoItem:[self.dataArray objectAtIndex:2*indexPath.row+1]];
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 169.0f;
}


-(void)setSingleItemView:(SingleItemView*)view withTaobaoItem:(CuzyTBKItem*)CuzyItem
{
    view.nameLabel.text = CuzyItem.itemName;
    view.totalSaleCountLable.text = [NSString stringWithFormat:@"购买量 %@",CuzyItem.tradingVolumeInThirtyDays];
    view.priceLabel.text = [NSString stringWithFormat:@"￥%@",CuzyItem.promotionPrice];
    view.imageViewContent.layer.cornerRadius = 4.0f;
    view.clickUrlString = CuzyItem.itemClickURLString;
    [imageCacheManager setImageView:view.imageViewContent withUrlString:CuzyItem.itemImageURLString];
    
}

-(void)showDetailTaobaoWebView:(NSString*)urlString;
{
    TaoBaoDetailViewController* tbkVC = [[[TaoBaoDetailViewController alloc] initWithNibName:@"TaoBaoDetailViewController" bundle:nil] autorelease];
    
    [self.navigationController pushViewControllerWithCustomBackButton:tbkVC animated:YES];
    tbkVC.urlString = [@"http://" stringByAppendingFormat:@"%@", urlString];
  
    
}

-(NSString*)TBKitemsArrayToJSONString:(NSArray*)inputDataArray
{
    NSMutableArray*  singleStringsArray = [[[NSMutableArray alloc] init] autorelease];
    for (int i = 0; i<[inputDataArray count]; i++) {
        CuzyTBKItem* singleItem = [inputDataArray objectAtIndex:i];
        NSMutableDictionary * itemDictionary = [[[NSMutableDictionary alloc] init] autorelease];
        [itemDictionary setValue:singleItem.itemName forKey:@"itemName"];
        [itemDictionary setValue:singleItem.tradingVolumeInThirtyDays forKey:@"tradingVolumeInThirtyDays"];
        [itemDictionary setValue:singleItem.itemPrice forKey:@"itemPrice"];
        [itemDictionary setValue:singleItem.promotionPrice forKey:@"promotion_price"];

        [itemDictionary setValue:singleItem.itemClickURLString forKey:@"itemClickURLString"];
        [itemDictionary setValue:singleItem.itemImageURLString forKey:@"itemImageURLString"];
        
        
        NSString* singleItemString = [itemDictionary JSONString];
        [singleStringsArray addObject:singleItemString];
        
    }
    
    NSString* resultJsonString = [singleStringsArray JSONString];
    return resultJsonString;
    
}
-(NSMutableArray*)JSONStringToTBKItemsArray:(NSString*)inputJSONString
{
    NSMutableArray* TBKItemArray= [[[NSMutableArray alloc] init] autorelease];
    NSMutableArray* stringsArray = [inputJSONString objectFromJSONString];
    for (int i = 0 ; i<[stringsArray count]; i++) {
        CuzyTBKItem*tbkItem  = [[[CuzyTBKItem alloc] init] autorelease];
        NSString* contentDictionaryString = [stringsArray objectAtIndex:i];
        NSDictionary*contentDictionary = [contentDictionaryString objectFromJSONString];
        tbkItem.itemName = [contentDictionary objectForKey:@"itemName"];
        tbkItem.tradingVolumeInThirtyDays = [contentDictionary valueForKey:@"tradingVolumeInThirtyDays"];
        tbkItem.itemPrice = [contentDictionary valueForKey:@"itemPrice"];
        tbkItem.promotionPrice = [contentDictionary valueForKey:@"promotion_price"];
        
        
        
        tbkItem.itemClickURLString = [contentDictionary valueForKey:@"itemClickURLString"];
        tbkItem.itemImageURLString = [contentDictionary valueForKey:@"itemImageURLString"];
        
        [TBKItemArray addObject:tbkItem];
        
    }
    return TBKItemArray;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
     float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        if (self.loadingmore) return;
        
        self.loadingmore = YES;
        [self.loadFooterView setHidden:NO];
        self.loadFooterView.showActivityIndicator = YES;
        
        //currentPage ++;
        [self performSelector:@selector(MyReloadData) withObject:self afterDelay:1.0f]; //make a delay to show loading process for a while
    }
}

-(void)LoadMore
{
    currentPageIndex ++;
    [self startThreadWork_fetchTBKItems:[DataSingleton singleton].searchString];
}
- (void)MyReloadData {
    
    [self LoadMore];
}
-(void)startSettingViewController
{
    SettingViewController* settingVC = [[[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil] autorelease];
    
    [self.navigationController pushViewControllerWithCustomBackButton:settingVC animated:YES];
}
- (void)segmentedControlChangedValue:(SVSegmentedControl*)InputsegmentedControl {
	
    if (InputsegmentedControl.selectedIndex == 0) {
    
        [self.twebView setHidden: NO];
        [self startTaobaoWebview];
    }else if(InputsegmentedControl.selectedIndex == 1)
    {
        [self.twebView setHidden:YES];
    }
    
}

@end
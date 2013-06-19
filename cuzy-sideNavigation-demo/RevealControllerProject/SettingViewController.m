//
//  SettingViewController.m
//  RevealControllerProject
//
//  Created by Apple on 13-5-31.
//
//

#import "SettingViewController.h"
#import "TaoBaoDetailViewController.h"
#import "UINavigationController+CustomBackButton.h"
#import "settingAboutViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

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
    self.tableRef.backgroundView = nil;
    self.tableRef.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cuzy_layout_1_tile_bg.png"]];
}
- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Datasource and Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"customerItemCell";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
 
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"   登陆到taobao" ;
    }
    if (indexPath.section == 1) {
        cell.textLabel.text = @"   当前版本1.1.3";
    }
    else if(indexPath.section == 2)
    {
        cell.textLabel.text = @"  关于cuzy.com";
    }
    
    return cell;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}
#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [tableView  deselectRowAtIndexPath:indexPath  animated:YES];
    switch (indexPath.section) {
        case 0:
        {
            TaoBaoDetailViewController* tbkVC = [[[TaoBaoDetailViewController alloc] initWithNibName:@"TaoBaoDetailViewController" bundle:nil] autorelease];
            
            [self.navigationController pushViewControllerWithCustomBackButton:tbkVC animated:YES];
            tbkVC.urlString = @"https://login.taobao.com/";
        }
            break;
        case 1:
            break;
        case 2:
        {
            settingAboutViewController*aboutVC = [[[settingAboutViewController alloc] initWithNibName:@"settingAboutViewController" bundle:nil] autorelease];
            
            [self.navigationController pushViewControllerWithCustomBackButton:aboutVC animated:YES];

        }
            break;
            
        default:
            break;
    }
}
- (void)dealloc {
    [_tableRef release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableRef:nil];
    [super viewDidUnload];
}
@end

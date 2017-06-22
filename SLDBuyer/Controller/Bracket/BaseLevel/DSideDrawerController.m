// Copyright (c) 2013 Mutual Mobile (http://mutualmobile.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "DSideDrawerController.h"
#import "DRootViewController.h"
#import "MMSideDrawerTableViewCell.h"
#import "DLoginViewController.h"
#import "DRegisterViewController.h"
#import "DHomeLevelController.h"
#import "DPopupHandler.h"
#import "MMSideDrawerSectionHeaderView.h"
#import "UIViewController+MJPopupViewController.h"

#import "DMainRootContrller.h"

@implementation DSideDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableHeaderHeight = 150;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:1 green:1.0 blue:1.0 alpha:.1]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.66]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.tableView.numberOfSections-1)] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MMSideDrawerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.userInteractionEnabled = YES;
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.tableHeaderHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MMSideDrawerSectionHeaderView *headerView =  [[MMSideDrawerSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), 150)];
    [headerView setLeftMenuDelegate:self];
    [headerView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    return headerView;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UINavigationController *navigationLevel = [self.mm_drawerController.levelControllers objectAtIndex:indexPath.row];
    [self.mm_drawerController setCenterViewController:navigationLevel withFullCloseAnimation:YES completion:nil];
    
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)doOpenLoginController {
    DLoginViewController *loginC = [[DLoginViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:loginC];
    [self presentViewController:navi animated:YES completion:^{
        
    }];
    
    /*loginC.loginDelegate = self;
    id navi = [[DPopupHandler sharedInstance]genPopupNavigation:loginC];
    [self presentPopupViewController:navi animationType:MJPopupViewAnimationSlideBottomBottom];*/
}

- (void)doOpenRegisterController {
    DRegisterViewController *registerC = [[DRegisterViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:registerC];
    [self presentViewController:navi animated:YES completion:^{
        
    }];
}

- (void)doLoginFinish {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
    [[DMainRootContrller sharedManager]doHandlerLogining];

}

- (void)doRegisterFinish {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
}

- (void)hadLoginingDisplay {
    [self.tableView reloadData];
}

@end

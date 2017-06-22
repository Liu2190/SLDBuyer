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


#import "DLeftSideDrawerController.h"
#import "DRootViewController.h"
#import "MMTableViewCell.h"

@implementation DLeftSideDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    int fromNumber = 0,toNumber = 3;
    int randomNumber = (arc4random()%(toNumber-fromNumber))+fromNumber;
    [bgImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Bracket_Backgroup%i.jpg",randomNumber]]];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.clipsToBounds = YES;
    bgImageView.userInteractionEnabled = YES;
    [self.view insertSubview:bgImageView atIndex:0];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mm_drawerController.levelControllers.count>0?self.mm_drawerController.levelControllers.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    UINavigationController *navigationLevel = [self.mm_drawerController.levelControllers objectAtIndex:indexPath.row];
    DRootViewController *levelController = (DRootViewController*)[navigationLevel.viewControllers objectAtIndex:0];
    cell.textLabel.text = levelController.menuTitle;
    cell.imageView.image = [UIImage imageNamed:levelController.menuImage];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
    footerView.backgroundColor = [UIColor clearColor];

    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    [tipLabel setBackgroundColor:[UIColor clearColor]];
    [tipLabel setTextColor:[UIColor colorWithRed:230.0/255.0 green:236.0/255.0 blue:242.0/255.0 alpha:1.0]];
    [tipLabel setShadowColor:[[UIColor blackColor] colorWithAlphaComponent:.5]];
    [tipLabel setShadowOffset:CGSizeMake(0, 1)];
    [tipLabel setFont:[UIFont fontWithName:@"Heiti SC" size:14]];
    tipLabel.text = [NSString stringWithFormat:@"版本%@",[[DUtilities sharedInstance]getAppVersionNo]];
    [footerView addSubview:tipLabel];
    
    UILabel *developer = [[UILabel alloc] initWithFrame:CGRectMake(60, 125, 200, 30)];
    [developer setBackgroundColor:[UIColor clearColor]];
    [developer setTextColor:[UIColor colorWithRed:230.0/255.0 green:236.0/255.0 blue:242.0/255.0 alpha:1.0]];
    [developer setShadowColor:[[UIColor blackColor] colorWithAlphaComponent:.5]];
    [developer setShadowOffset:CGSizeMake(0, 1)];
    [developer setFont:[UIFont fontWithName:@"Heiti SC" size:14]];
    developer.text = @"北京尚鳞科技有限公司";
    [footerView addSubview:developer];
    
    return footerView;
}

@end

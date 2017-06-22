//
//  GoodsOrderListController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "GoodsOrderListController.h"
#import "GoodsOrderListCell.h"
#import "GoodsOrderDetailViewController.h"
#import "OrderTrackViewController.h"
#import "AskForRefundViewController.h"

@interface GoodsOrderListController ()
@end

@implementation GoodsOrderListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"商品订单";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    GoodsOrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GoodsOrderListCell" owner:self options:nil]lastObject];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GoodsOrderDetailViewController *gVC = [[GoodsOrderDetailViewController alloc]init];
    [self.navigationController pushViewController:gVC animated:YES];
   /* AskForRefundViewController *order = [[AskForRefundViewController alloc]init];
    [self.navigationController pushViewController:order animated:YES];*/
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

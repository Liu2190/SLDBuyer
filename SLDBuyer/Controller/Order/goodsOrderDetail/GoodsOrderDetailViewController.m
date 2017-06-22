//
//  GoodsOrderDetailViewController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-17.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "GoodsOrderDetailViewController.h"
#import "OrderInforCell.h"
#import "OrderOwnerCell.h"
#import "OrderPayCell.h"
#import "OrderHeaderView.h"
#import "OrderDeliveryCell.h"
#import "OrderProductCell.h"
#import "OrderPaymentCell.h"
#import "OrderTrackViewController.h"

#define section_count       6
#define status_section      0
#define sum_section         1
#define list_section        2
#define owner_section       3
#define delivery_section    4
#define payment_section     5

@interface GoodsOrderDetailViewController ()

@end

@implementation GoodsOrderDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.headerViewHeight = 35.0f;
        self.title = @"订单详情";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return section_count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == list_section)
    {
        OrderHeaderView *listView = [[[NSBundle mainBundle]loadNibNamed:@"OrderHeaderView" owner:self options:nil]lastObject];
        listView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44.0f);
        return listView;
    }
    if(section == delivery_section)
    {
        OrderHeaderView *listView = [[[NSBundle mainBundle]loadNibNamed:@"OrderHeaderView" owner:self options:nil]lastObject];
        listView.titleLabel.text = @"派送方式：自提";
        listView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44.0f);
        return listView;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == list_section)
    {
        return 44.0f;
    }
    if(section == delivery_section)
    {
        return 44.0f;
    }
    return 0.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == status_section)
    {
        return 110.0f;
    }
    if(indexPath.section == sum_section)
    {
        return 195.0f;
    }
    if(indexPath.section == list_section)
    {
        return 80.0f;
    }
    if(indexPath.section == owner_section)
    {
        return 180.0f;
    }
    if(indexPath.section == delivery_section)
    {
        return 90.0f;
    }
    if(indexPath.section == payment_section)
    {
        return 124.0f;
    }
    return 0.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    if(indexPath.section == status_section)
    {
        OrderInforCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderInforCell" owner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.statusButton addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    if(indexPath.section == sum_section)
    {
        OrderPayCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderPayCell" owner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if(indexPath.section == list_section)
    {
        OrderProductCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderProductCell" owner:self options:nil]lastObject];
        }
        return cell;
    }
    if(indexPath.section == owner_section)
    {
        OrderOwnerCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderOwnerCell" owner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if(indexPath.section == delivery_section)
    {
        OrderDeliveryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderDeliveryCell" owner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if(indexPath.section == payment_section)
    {
        OrderPaymentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderPaymentCell" owner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)nextStep
{
    OrderTrackViewController *oVC = [[OrderTrackViewController alloc]init];
    [self.navigationController pushViewController:oVC animated:YES];
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

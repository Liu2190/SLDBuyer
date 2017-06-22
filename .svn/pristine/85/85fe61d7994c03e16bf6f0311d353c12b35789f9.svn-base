//
//  DefaultMarketViewController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-30.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DefaultMarketViewController.h"
#import "DefaultTitleView.h"
#import "DefaultCell.h"
#import "DefaultMarketSectionView.h"
#import "AccountServer.h"
#import "DefaultMarketDB.h"
#import "MarketAreaModel.h"
#import "MarketModel.h"

@interface DefaultMarketViewController ()<defaultMarketDidDelegate>
{
    int _index;
    NSString *defaultMarketName;
}

@property (nonatomic,retain)NSMutableArray *headerDatas;
@property (nonatomic,retain)NSMutableArray *cellDatas;
@end

@implementation DefaultMarketViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"自提超市";
        defaultMarketName = [[NSString alloc]init];
        self.headerDatas = [[NSMutableArray alloc]init];
        self.cellDatas = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDefaultMarket];
    [self checkUpdate];
    DefaultMarketSectionView *headerView = [[DefaultMarketSectionView alloc]initDefaultMarketSectionViewWith:self.headerDatas];
    headerView.delegate = self;
    self.tableView.tableHeaderView = headerView;
}
/**
 * 获取默认自提超市
 */
-(void)getDefaultMarket
{
    [[TServerFactory getServerInstance:@"AccountServer"] doGetDefaultMarketByCallback:^(NSString *marketName){
        defaultMarketName = marketName;
    }failureCallback:^(NSString *resp){
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
        }];
    }];
}
/**
 * 检查数据库中保存的超市区域和列表是否需要更新
 */
-(void)checkUpdate
{
    [[TServerFactory getServerInstance:@"AccountServer"] doGetMarketVersionNumByCallback:^(int version){
       if([[DefaultMarketDB sharedDataBase]ifNeedUpdateVersion:version]==YES)
       {
           [self updateVerion];
       }
        else
        {
            [self getDataFromDB];
        }
        
    }failureCallback:^(NSString *resp){
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
        }];
    }];
}
/**
 * 更新数据库版本
 */
-(void)updateVerion
{
    [[TServerFactory getServerInstance:@"AccountServer"] doGetMarketAreaByCallback:^(NSMutableArray * areaArray){
        [[DefaultMarketDB sharedDataBase]insertAreaData:areaArray];
        [self updateMarket];
    }failureCallback:^(NSString *resp){
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
        }];
    }];
}
/**
 * 更新超市列表
 */
-(void)updateMarket
{
    [[TServerFactory getServerInstance:@"AccountServer"] doGetMarketListByCallback:^(NSMutableArray * marketArray){
        [[DefaultMarketDB sharedDataBase]insertMarketListData:marketArray];
        [self getDataFromDB];
    }failureCallback:^(NSString *resp){
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
        }];
    }];
}
/**
 * 从数据库中获取超市列表
 */
-(void)getDataFromDB
{
    [self.headerDatas removeAllObjects];
    [self.cellDatas removeAllObjects];
    [self.datas removeAllObjects];
    [self.headerDatas addObjectsFromArray: [[DefaultMarketDB sharedDataBase]readDataFromArea]];
    for(MarketAreaModel *model in self.headerDatas)
    {
        [self.cellDatas addObject:[[DefaultMarketDB sharedDataBase]readFromMarketListWith:model]];
    }
    if([self.cellDatas count]!=0)
    {
        [self.datas addObjectsFromArray:[self.cellDatas objectAtIndex:_index]];
    }
    [self.tableView reloadData];
}
/**
 * 设置为自提超市
 */
-(void)setDefaultMarket:(NSString *)marketID
{
    [[TServerFactory getServerInstance:@"AccountServer"] DoUpdateMarketByID:marketID AndCallback:^(int  status){
      //  [[DefaultMarketDB sharedDataBase]insertMarketListData:marketArray];
       // [self getDataFromDB];
        if(status == 0)
        {
            //设置成功
        }
    }failureCallback:^(NSString *resp){
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
        }];
    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.datas count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *identifier = @"cell";
    DefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DefaultCell" owner:self options:nil]lastObject];
    }
    [cell setCellValueWithMarket:[self.datas objectAtIndex:indexPath.row]AndDefault:defaultMarketName];
    cell.addressButton.tag = indexPath.row +100;
    [cell.addressButton addTarget:self action:@selector(areaDidClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)areaDidClick:(UIButton *)button
{
    MarketModel *model = [self.datas objectAtIndex:(button.tag-100)];
    defaultMarketName = model.marketName;
    [self.tableView reloadData];
}
-(void)defaultMarketDidSelectArea:(NSInteger)index
{
    _index = index;
    [self.datas removeAllObjects];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    [NSTimer scheduledTimerWithTimeInterval:.8 target:self selector:@selector(handleMaxShowTimer) userInfo:nil repeats:NO];
}
-(void)handleMaxShowTimer
{
    [self.datas addObjectsFromArray:[self.cellDatas objectAtIndex:_index]];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

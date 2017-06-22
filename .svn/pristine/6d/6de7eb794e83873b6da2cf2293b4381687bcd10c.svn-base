//
//  DOrderLevelController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-21.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DOrderLevelController.h"
#import "AbountCell.h"
#import "GoodsOrderListController.h"
#import "AskForRefundViewController.h"

@interface DOrderLevelController()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *table;
@property (nonatomic,retain)NSMutableArray *datas;
@end
@implementation DOrderLevelController

+ (id)sharedInstance {
    static DOrderLevelController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DOrderLevelController alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    self.menuTitle = @"我的订单";
    self.menuImage = @"Bracket_Order.png";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.view.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:249.0/255.0 blue:246.0/255.0 alpha:1];
    self.datas = [[NSMutableArray alloc]initWithObjects:@"商品订单", nil];
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-([[[UIDevice currentDevice]systemVersion]compare:@"7.0"]==NSOrderedAscending ?44.0f:64.0f)) style:UITableViewStylePlain];
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    v.backgroundColor = [UIColor clearColor];
    self.table.tableHeaderView = v;
    v.backgroundColor = [UIColor clearColor];
    self.table.backgroundColor = [UIColor clearColor];
    self.table.separatorStyle = UITableViewCellSelectionStyleNone;
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    AbountCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AbountCell" owner:self options:nil]lastObject];
    }
    cell.titleLabel.text = [self.datas objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GoodsOrderListController *orderVC = [[GoodsOrderListController alloc]init];
    [self.navigationController pushViewController:orderVC animated:YES];
    

}
@end

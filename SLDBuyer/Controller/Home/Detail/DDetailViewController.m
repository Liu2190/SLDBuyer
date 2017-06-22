//
//  DDetailViewController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-21.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DDetailViewController.h"
#import "DMainRootContrller.h"
#import "DDetailHeaderCell.h"
#import "DDetailViewCell.h"
#import "DParamViewCell.h"
#import "DDetailNiceCell.h"
#import "UIButton+Extensions.h"

#define toolBar_height      75
#define navigation_height   44

#define statusBar_height    20

@implementation DDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectedIndex = 0;
    NSMutableArray *detailData = [[NSMutableArray alloc]init];
    
    // 商品详情
    NSDictionary *goodDetail = @{@"Flage":@"1",@"Title":@"商品详情",@"Value":@"商品详情"};
    NSDictionary *standardPara = @{@"Flage":@"2",@"Title":@"规格参数",@"Value":@"规格参数"};
    NSArray *nices = @[@"1",@"2",@"3"];
    NSDictionary *youNice = @{@"Flage":@"3",@"Title":@"猜你喜欢",@"Value":nices};
    
    [detailData addObject:goodDetail];
    [detailData addObject:standardPara];
    [detailData addObject:youNice];
    _goodDetailForm.detailData = detailData;
    [_tableView reloadData];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIView *naviBarView = [[UIView alloc]initWithFrame:CGRectMake(0, statusBar_height, self.view.frame.size.width, navigation_height)];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
    [button setImage:[UIImage imageNamed:@"Nav_Close_Gray.png"] forState:UIControlStateNormal];
    [button setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -30)];
    [button addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [naviBarView addSubview:button];
    [naviBarView setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:0.]];
    [self.view addSubview:naviBarView];
    
    _tableView = [[UITableView alloc]initWithFrame:
                  CGRectMake(0, naviBarView.frame.origin.y+naviBarView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-naviBarView.frame.origin.y-naviBarView.frame.size.height-toolBar_height)];
    [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setShowsVerticalScrollIndicator:NO];
    _tableView.allowsSelection = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.hidden = YES;
    [self.view addSubview:_tableView];
    
    
    UIView *toolBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-toolBar_height, self.view.frame.size.width, toolBar_height)];
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(0, 0, toolBarView.frame.size.width, .3)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [toolBarView addSubview:lineImageView];
    
    
    UIButton *reduceBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 15, toolBar_height-2*15, toolBar_height-2*15)];
    [reduceBtn setImage:[UIImage imageNamed:@"Detail_Goods_Reduce.png"] forState:UIControlStateNormal];
    [toolBarView addSubview:reduceBtn];
    
    
    UIButton *plusBtn = [[UIButton alloc]initWithFrame:CGRectMake(15+toolBar_height-2*15+60, 15, toolBar_height-2*15, toolBar_height-2*15)];
    [plusBtn setImage:[UIImage imageNamed:@"Detail_Goods_Plus.png"] forState:UIControlStateNormal];
    [toolBarView addSubview:plusBtn];
    
    UIButton *shopCarBtn = [[UIButton alloc]initWithFrame:CGRectMake(toolBarView.frame.size.width-140, 15, 140, toolBar_height-2*15)];
    [shopCarBtn setImage:[UIImage imageNamed:@"Detail_ShopCar_Opration.png"] forState:UIControlStateNormal];
    [toolBarView addSubview:shopCarBtn];
    
    [self.view addSubview:toolBarView];
}

- (void)leftButtonAction {
    [[DMainRootContrller sharedManager]updateStatuBarColorByStyle:UIStatusBarStyleLightContent];
    [[DMainRootContrller sharedManager]setOpenDrawerGesture:YES];
    [self.navigationController.view setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:0.]];
    [self.view setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:0.f]];
    
    [self.navigationController.view removeFromSuperview];
    [self.navigationController removeFromParentViewController];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationStartAnimation" object:nil userInfo:nil];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _goodDetailForm.detailData.count>0?2:1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 1;
    
    if (_goodDetailForm.detailData.count>0) {
        
        if (_goodDetailForm.detailData.count>0) {
            if (_selectedIndex == 0) { // 商品详情
                return 1;
            } else if (_selectedIndex == 1) { // 参数规格
                return 1;
            }else if (_selectedIndex == 2) { // 猜你喜欢
                NSArray *detailData = _goodDetailForm.detailData;
                NSDictionary *dict = [detailData objectAtIndex:_selectedIndex];
                id data = [dict objectForKey:@"Value"];
                
                if ([data isKindOfClass:[NSMutableArray class]]) {
                    return 20;
                }
                
                return 1;
            }
        }
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title_reuseIdentifier = @"title_cell";
    
    NSString *detail_reuseIndentifier = @"detail_reuseIndentifier";
    NSString *param_reuseIndentifier = @"param_reuseIndentifier";
    NSString *nice_reuseIndentifier = @"nice_reuseIndentifier";
    
    
    NSString *reuseIdentifier = title_reuseIdentifier;
    if (indexPath.section == 1) {
        if (_selectedIndex == 0) {
            reuseIdentifier = detail_reuseIndentifier;
        } else if (_selectedIndex == 1) {
            reuseIdentifier = param_reuseIndentifier;
        } else if(_selectedIndex == 2) {
            reuseIdentifier = nice_reuseIndentifier;
        }
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        if (indexPath.section == 0) {
            cell = [[DDetailHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
            [((DDetailHeaderCell*)cell) setDataForCell:_goodDetailForm andObje:self];
            
        } else if (indexPath.section == 1) {
            if (_selectedIndex == 0) {
                cell = [[DDetailViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
            } else if (_selectedIndex == 1) {
                cell = [[DParamViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
            } else if(_selectedIndex == 2) {
                cell = [[DDetailNiceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
            }
        }
    }
    
    
    if (indexPath.section != 0) {
        NSDictionary *dict = [_goodDetailForm.detailData objectAtIndex:_selectedIndex];
        id data = [dict objectForKey:@"Value"];
        
        if (_selectedIndex == 0) {
            [((DDetailViewCell*)cell) setDataForCell:data];
        } else if (_selectedIndex == 1) {
            [((DParamViewCell*)cell) setDataForCell:data];
        } else if(_selectedIndex == 2) {
            [((DDetailNiceCell*)cell) setDataForCell:data];
        }
    }
    
    [cell setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section ==0) return 0;
    return .5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    float h = [self tableView:tableView heightForHeaderInSection:section];
    
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, h)];
    [sectionView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.]];
    
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(0, sectionView.frame.size.height-.5, sectionView.frame.size.width, .5)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [sectionView addSubview:lineImageView];

    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
        return [DDetailHeaderCell heightForCell];
    
    if (_goodDetailForm.detailData.count>0) {
        if (_selectedIndex == 0) { // 商品详情
            return [DDetailViewCell heightForCell];
        } else if (_selectedIndex == 1) { // 参数规格
            return [DParamViewCell heightForCell];
        }else if (_selectedIndex == 2) { // 猜你喜欢
            return [DDetailNiceCell heightForCell];
        }
    }
    
    return 0;
}

- (void)doHomeTabBarClicked:(int)index {
    _selectedIndex = index;
    [_tableView reloadData];
}


@end

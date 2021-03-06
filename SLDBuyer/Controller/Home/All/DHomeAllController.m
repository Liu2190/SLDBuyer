//
//  DHomeAllController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeAllController.h"
#import "DDetailViewController.h"
#import "DCateGoodsViewController.h"

#define tabBar_height_size  45

@implementation DHomeAllController

- (id)initWithDelegate:(id)delegate {
    self = [super init];
    self.homeDelegate = delegate;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, tabBar_height_size);
    NSDictionary *tabSale = @{@"image":@"home_tab_sale.png",@"title":@"促销商品"};
    NSDictionary *tabCate = @{@"image":@"home_tab_cate.png",@"title":@"促销分类"};
    NSArray *tabTitles = @[tabSale,tabCate];
    _tabBarView = [[DHomeTabBarView alloc]initWithFrame:rect andTitles:tabTitles];
    [_tabBarView setHomeDelegate:self.homeDelegate];
    [self.view addSubview:_tabBarView];
    
    DCateGoodsViewController *cateGoodsList = [[DCateGoodsViewController alloc]initWithCateId:0 andTitle:@""];
    cateGoodsList.isBannerData = YES;
    [cateGoodsList.tableView setFrame:CGRectMake(0, tabBar_height_size, self.view.frame.size.width, self.view.frame.size.height-tabBar_height_size)];
    cateGoodsList.cateDelegate = self;
    [self.view addSubview:cateGoodsList.view];
}

/**
 * 点击更多获取分类商品
 */
- (void)openMoreCateGoods:(int)cateId andTitle:(NSString*)title {
    DCateGoodsViewController *cateGoodsList = [[DCateGoodsViewController alloc]initWithCateId:cateId andTitle:title];
    cateGoodsList.cateDelegate = self;
    [self.navigationController pushViewController:cateGoodsList animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)resetLayout {
    [_tabBarView resetLayout];
}

- (void)setDefaultNavigationStyle {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], NSBackgroundColorAttributeName,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], NSBackgroundColorAttributeName,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], NSTextEffectAttributeName,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:21.0], NSParagraphStyleAttributeName,
                                                                     nil]];
    
    
}

@end

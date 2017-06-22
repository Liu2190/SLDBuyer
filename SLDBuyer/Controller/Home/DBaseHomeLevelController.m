//
//  DBaseHomeLevelController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-4.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DBaseHomeLevelController.h"
#import "DShopGoodsListController.h"
#import "DDetailViewController.h"
#import "DHomeProductBlockView.h"
#import "DHomeGoodsAllCell.h"
#import "DHomeBlockView.h"
#import "DHomeAllController.h"
#import "DMainRootContrller.h"
#import "DHomeLevelController.h"

@implementation DBaseHomeLevelController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Goods
    DHomeAllController *allController = [[DHomeAllController alloc]initWithDelegate:self];
    _navigation = [[UINavigationController alloc]initWithRootViewController:allController];
    [_navigation.view setFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    _navigation.navigationBar.translucent = NO;
    [self.contentView addSubview:_navigation.view];
    
    // searchBar
    _theSearchBar = [[DSearchBar alloc]initWithFrame:CGRectMake(55,20.0f,200.0f,0.0f)];
    UIColor *bgColor = [UIColor colorWithRed:64./255.0 green:138.0/255 blue:57.0/255. alpha:1.0];
    _theSearchBar.tintColor = [UIColor colorWithRed:102./255.0 green:152.0/255 blue:73.0/255. alpha:1.0];
    [_theSearchBar resetPropertyByBgColor:bgColor andplaceHolderColor:[UIColor whiteColor] andLeftImageName:@""];
    _theSearchBar.delegate = self;
    self.navigationItem.titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.navigationController.navigationBar addSubview:_theSearchBar];
    
    _searchGoodsController = [[DSearchGoodsController alloc]init];
    [_searchGoodsController.view setFrame:CGRectMake(0, 0, self.contentView.frame.size.width,
                                                     self.contentView.frame.size.height)];
    
    // shop car
    _homeShopController = [DHomeShopController sharedInstance];
    _homeShopController.homeDelegate = self;
    [self.navigationController.navigationBar addSubview:_homeShopController.view];
    
    _saleCateController = [[DSaleCateViewController alloc]init];
    _saleCateController.view.frame = CGRectMake(0, 45, self.contentView.frame.size.width,
                                                self.contentView.frame.size.height-45);
}

/**
 * 打开购物车商品列表
 */
- (void)openShopGoodsListController {
    DShopGoodsListController *shopGoodsList = [[DShopGoodsListController alloc]init];
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:shopGoodsList];
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
}

/**
 * 促销商品及分类标签被触点
 * 1:禁用swipe侧滑功能
 * 2:把导航区域的搜索及购物车控件移除并改变导航栏标题
 * 3:内容区域添加分类视图
 */
- (void)doHomeTabBarClicked:(int)index {
    if (![self.contentView.subviews containsObject:_saleCateController.view]) {
        [self addLeftButtonItemForTabBar:self.navigationItem];
        [[DMainRootContrller sharedManager]setOpenDrawerGesture:NO];
        [_theSearchBar removeFromSuperview];
        [_homeShopController.view removeFromSuperview];
        self.title = @"购物专区";
        _saleCateController.startIndex = index;
        [self.contentView addSubview:_saleCateController.view];
        
    } else {
        [_saleCateController scrollPageByPageNum:index animated:YES];
    }
}

- (void)addLeftButtonItemForTabBar:(UINavigationItem*)navigationItem {
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,25,25)];
    [leftButton setImage:[UIImage imageNamed:@"Nav_Close_White.png"]forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(doCloseTabBar)forControlEvents:UIControlEventTouchUpInside];
    _leftCloseItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    navigationItem.leftBarButtonItem= _leftCloseItem;
}

- (void)doCloseTabBar {
    UIColor *bgColor = [UIColor colorWithRed:64./255.0 green:138.0/255 blue:57.0/255. alpha:1.0];
    [_theSearchBar resetPropertyByBgColor:bgColor andplaceHolderColor:[UIColor whiteColor] andLeftImageName:@""];
    [_saleCateController closeViewController:^(BOOL isFinish){
        [_saleCateController.view removeFromSuperview];
        for (UIView *view in [_saleCateController.view subviews]) {
            [view removeFromSuperview];
        }
        
        _leftCloseItem.customView.hidden = YES;
        [self.navigationController.navigationBar addSubview:_theSearchBar];
        [self.navigationController.navigationBar addSubview:_homeShopController.view];
        [[DHomeLevelController sharedInstance]setupLeftMenuButton];
        [[DMainRootContrller sharedManager]setOpenDrawerGesture:YES];
        
    }];
    
    DHomeAllController *homeAllController = [_navigation.viewControllers objectAtIndex:0];
    [homeAllController resetLayout];
}

- (void)openCateGoodsList:(int)cateId andTitle:(NSString*)title {}


/**
 * 触摸搜索控件触发
 * 1:改变搜索控件样式
 * 2:切换左按钮，使用用户可以关闭搜索模式
 * 3:新弹出的视图禁止swipe滑动
 * 4:内容区域添加搜索列表
 */
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [_theSearchBar resetPropertyByBgColor:[UIColor whiteColor] andplaceHolderColor:[UIColor grayColor] andLeftImageName:@""];
    [self addLeftButtonItemForSearch:self.navigationItem];
    [[DMainRootContrller sharedManager]setOpenDrawerGesture:NO];
    [self.contentView addSubview:_searchGoodsController.view];
}

- (void)addLeftButtonItemForSearch:(UINavigationItem*)navigationItem {
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,25,25)];
    [leftButton setImage:[UIImage imageNamed:@"Nav_Close_White.png"]forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(doCloseSearch)forControlEvents:UIControlEventTouchUpInside];
    _leftCloseItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    navigationItem.leftBarButtonItem= _leftCloseItem;
}

- (void)doCloseSearch {
    UIColor *bgColor = [UIColor colorWithRed:64./255.0 green:138.0/255 blue:57.0/255. alpha:1.0];
    [_theSearchBar resetPropertyByBgColor:bgColor andplaceHolderColor:[UIColor whiteColor] andLeftImageName:@""];
    [_searchGoodsController.view removeFromSuperview];
    _leftCloseItem.customView.hidden = YES;
    [_theSearchBar resignFirstResponder];
    [[DHomeLevelController sharedInstance]setupLeftMenuButton];
    [[DMainRootContrller sharedManager]setOpenDrawerGesture:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_navigation beginAppearanceTransition:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_navigation endAppearanceTransition];
}

@end

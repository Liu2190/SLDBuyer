//
//  DBaseHomeLevelController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-4.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DRootViewController.h"
#import "DHomeDelegate.h"
#import "DSaleCateViewController.h"
#import "DSearchBar.h"
#import "DHomeShopController.h"
#import "DSearchGoodsController.h"

@interface DBaseHomeLevelController : DRootViewController<DHomeDelegate,UISearchBarDelegate> {
    /**
     * 搜索栏定义，封装常用功能
     */
    DSearchBar *_theSearchBar;
    
    /**
     * 商品搜索列表栏
     */
    DSearchGoodsController *_searchGoodsController;
    
    
    /**
     * 导航栏右按钮项，此项为购物车入口
     */
    DHomeShopController *_homeShopController;
    
    /**
     * 当进入搜索界面时，导航栏左按钮项更新为关闭
     */
    UIBarButtonItem *_leftCloseItem;
    
    /**
     * 商品一级分类列表由一个UINavigation管理，
     * 以并在第二级分类商品列表中可以出现子导航
     */
    UINavigationController *_navigation;
    
    /**
     * 促销及分类
     */
    DSaleCateViewController *_saleCateController;
}

- (void)doCloseTabBar;
- (void)openCateGoodsList:(int)cateId andTitle:(NSString*)title;

@end

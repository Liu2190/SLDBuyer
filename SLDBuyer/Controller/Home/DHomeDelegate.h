//
//  DHomeDelegate.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DHomeDelegate <NSObject>


- (void)doHomeTabBarClicked:(int)index;

@optional
- (void)openShopGoodsListController;

@end

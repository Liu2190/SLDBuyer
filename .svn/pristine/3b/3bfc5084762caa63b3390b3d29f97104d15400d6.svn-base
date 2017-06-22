//
//  DShopAddGoodsController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-17.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DBaseViewController.h"
#import "DGoods.h"

@protocol MJSecondPopupDelegate;

@interface DShopAddGoodsController : DBaseViewController {
    DGoods *_goods;
}

@property (assign, nonatomic) id <MJSecondPopupDelegate>delegate;

- (id)initWithGoods:(DGoods*)goods;

@end


@protocol MJSecondPopupDelegate<NSObject>
@optional
- (void)cancelButtonClicked:(id)controller;
@end

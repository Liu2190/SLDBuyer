//
//  DShopCar.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-12.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DRecord.h"

@interface DShopCar : DRecord

/**
 * 与服务端最后更新时间
 */
@property (nonatomic,strong)NSDate *lastSynTime;

/**
 * 本地最近一次更新时间
 */
@property (nonatomic,strong)NSDate *lastUpdateTime;

/**
 * 商品加入购物车的类数
 */
@property (nonatomic,assign)int goodsCateNum;


@end

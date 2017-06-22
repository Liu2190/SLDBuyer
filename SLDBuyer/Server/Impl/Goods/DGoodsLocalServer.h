//
//  DGoodsLocalServer.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-12.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "TBaseServer.h"

@interface DGoodsLocalServer : TBaseServer

/**
 * 商品列表拖动商品添加购物车
 */
- (void)addGoods:(NSString*)serverId title:(NSString*)title sellPrice:(float)sellPrice imageUrl:(NSString*)imageUrl addNum:(int)addNum;

/**
 *  添加商品到购物车
 */
- (void)appendGoodNumByServerId:(NSString*)serverId appendNum:(int)appendNum;

/**
 * 获取商品记录总数
 */
- (NSInteger)getGoodsRowNum;

/**
 * 通过商品ID获取商品加入本地购物车中的数量
 */
- (DRecord *)selectRecordByServerId:(NSString*)serverId;

- (BOOL)deleteByServerId:(NSString*)serverId;
@end

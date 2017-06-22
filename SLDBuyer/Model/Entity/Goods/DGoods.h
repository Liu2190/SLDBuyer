//
//  DGoods.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-12.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DRecord.h"

@interface DGoods : DRecord

/**
 * 商品标题
 */
@property (nonatomic,strong)NSString *title;

/**
 * 商品价格
 */
@property (nonatomic,assign)float sellPrice;

/**
 * 商品图
 */
@property (nonatomic,strong)NSString *imageUrl;

/**
 * 商品数量
 */
@property (nonatomic,assign)int goodsNum;


- (id)initWithServerId:(NSString*)serverId;

@end

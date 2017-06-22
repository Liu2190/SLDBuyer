//
//  DHomeGoods.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-31.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeGoods.h"
#import "DGoodsServer.h"

#import "DGoods.h"

@implementation DHomeGoods

- (void)updateWithJSonDictionary:(NSDictionary *)dic {
    self.serverId = [dic objectForKey:@"commodityId"];
    self.commodityImage = [dic objectForKey:@"commodityImage"];
    self.commodityName = [dic objectForKey:@"commodityName"];
    self.marketPrice = [dic objectForKey:@"marketPrice"];
    self.productInCartNum = [[dic objectForKey:@"productInCartNum"]intValue];
    self.sellPrice = [dic objectForKey:@"sellPrice"];

    DGoods *goods = (DGoods*)[[TServerFactory getServerInstance:@"DGoodsServer"]
                              selectRecordByServerId:self.serverId];
    self.addNum = [NSNumber numberWithInt:goods.goodsNum];
}
@end

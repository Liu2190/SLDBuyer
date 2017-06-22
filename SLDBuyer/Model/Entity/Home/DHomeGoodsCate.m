//
//  DHomeGoodsForm.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeGoodsCate.h"
#import "DHomeGoods.h"

@implementation DHomeGoodsCate

- (void)updateWithJSonDictionary:(NSDictionary *)dic {
    self.serverId = [NSString stringWithFormat:@"%@",[dic objectForKey:@"ID"]];
    self.pic_url = [dic objectForKey:@"pic_url"];
    self.title = [dic objectForKey:@"title"];
    
    self.products = [[NSMutableArray alloc]init];
    
    NSArray *products = [dic objectForKey:@"poductList"];
    for (NSDictionary *proDic in products) {
        DHomeGoods *productForm = [[DHomeGoods alloc]initWithJsonDictionary:proDic];
        [self.products addObject:productForm];
    }
}

@end

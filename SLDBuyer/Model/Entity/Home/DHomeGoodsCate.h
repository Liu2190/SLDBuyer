//
//  DHomeGoodsForm.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DRecord.h"

@interface DHomeGoodsCate : DRecord

@property (nonatomic,strong)NSString *pic_url;
@property (nonatomic,strong)NSString *title;

@property (nonatomic,strong)NSMutableArray *products;

@end

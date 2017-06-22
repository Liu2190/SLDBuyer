//
//  MarketModel.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-10.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "MarketModel.h"

@implementation MarketModel
-(id)init
{
    self = [super init];
    _marketID = [[NSString alloc]init];
    _marketName = [[NSString alloc]init];
    _marketAddress = [[NSString alloc]init];
    _areaID = [[NSString alloc]init];
    _areaName = [[NSString alloc]init];
    _isDefault= NO;
    _marketType= NO;
    _latitude = [[NSString alloc]init];
    _longtitude = [[NSString alloc]init];
    _storeSort = [[NSString alloc]init];
    return self;
}
@end

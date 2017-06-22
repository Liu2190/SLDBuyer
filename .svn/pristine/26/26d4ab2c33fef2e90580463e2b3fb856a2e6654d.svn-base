//
//  DShopCarLocalServer.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DShopCarLocalServer.h"
#import "DShopCar.h"
#import "DGoodsServer.h"

#define TABLE_NAME  @"D_SHOPCAR"

@implementation DShopCarLocalServer

- (NSInteger)insertRecordWithObject:(DRecord *)record {
    DShopCar *shopCar = (DShopCar*)record;
    
    NSString *lastUpdateTime = [[DUtilities sharedInstance]stringLongFromDate:shopCar.lastUpdateTime];
    [db executeUpdate:[self SQL:@"INSERT INTO %@(goodsCateNum,lastUpdateTime) VALUES(?,?)" inTable:TABLE_NAME],[NSString stringWithFormat:@"%i",shopCar.goodsCateNum],lastUpdateTime];
    
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return NO;
	} else { // 每次新生成一个商品时，做一次本地购物车数量的更新
        
    }
    
    NSInteger lastRowId = (NSInteger)db.lastInsertRowId;
    
    return lastRowId;
}

- (int)getShopCarGoodsCateNum {
    NSInteger count = [[TServerFactory getServerInstance:@"DGoodsServer"]getGoodsRowNum];
    return count;
}

- (DRecord*)selectFirstRecord {
    DShopCar *shopCar = nil;

    NSString *sqlString = [NSString stringWithFormat:@"SELECT * FROM '%@'",TABLE_NAME];
    TResultSet *rs = [db executeQuery:sqlString];
    
    while ([rs next]){
        shopCar = [[DShopCar alloc]init];
        [shopCar setRecordId:[rs intForColumn:@"record_id"]];
        [shopCar setLastSynTime:[rs dateForColumn:@"lastSynTime"]];
        [shopCar setLastUpdateTime:[rs dateForColumn:@"lastUpdateTime"]];
        [shopCar setGoodsCateNum:[rs intForColumn:@"goodsCateNum"]];
        
    } [rs close];
    
    return shopCar;
}

- (DRecord*)genShopCarInstance {
    DShopCar *shopCar = [[DShopCar alloc]init];
    shopCar.goodsCateNum = 0;
    shopCar.lastUpdateTime = [NSDate date];
    
    return shopCar;
}

/**
 *
 */
- (void)appendGoodsCateNumByCateNum:(int)cateNum {
    DShopCar *shopCar = (DShopCar*)[self selectFirstRecord];
    if (shopCar == nil) {
        shopCar.goodsCateNum += cateNum;
        shopCar = (DShopCar*)[self genShopCarInstance];
        NSInteger theId = [self insertRecordWithObject:shopCar];
        shopCar.recordId = theId;
    }
}

@end

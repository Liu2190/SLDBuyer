//
//  DGoodsLocalServer.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-12.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DGoodsLocalServer.h"
#import "DGoods.h"

#define TABLE_NAME  @"D_Goods"

@implementation DGoodsLocalServer

- (DRecord *)selectRecordByServerId:(NSString*)serverId {
    DGoods *goods = nil;
    NSString *sqlString = [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE server_id = '%@'",
                           TABLE_NAME,serverId];
    TResultSet *rs = [db executeQuery:sqlString];
    
    while ([rs next]){
        goods = [[DGoods alloc]init];
        [goods setServerId:[rs stringForColumn:@"server_id"]];
        [goods setRecordId:[rs intForColumn:@"record_id"]];
        [goods setGoodsNum:[rs intForColumn:@"goodsNum"]];
        [goods setTitle:[rs stringForColumn:@"title"]];
        [goods setSellPrice:[rs doubleForColumn:@"sellPrice"]];
        [goods setImageUrl:[rs stringForColumn:@"imageUrl"]];
        
    } [rs close];
    
    return goods;
}

- (NSArray *)selectAllRecord {
    
    NSMutableArray *allRecord = [[NSMutableArray alloc]init];
    NSString *sqlString = [NSString stringWithFormat:@"SELECT * FROM '%@'",
                           TABLE_NAME];
    TResultSet *rs = [db executeQuery:sqlString];
    
    while ([rs next]){
        DGoods *goods = [[DGoods alloc]init];
        [goods setServerId:[rs stringForColumn:@"server_id"]];
        [goods setRecordId:[rs intForColumn:@"record_id"]];
        [goods setGoodsNum:[rs intForColumn:@"goodsNum"]];
        [goods setTitle:[rs stringForColumn:@"title"]];
        [goods setSellPrice:[rs doubleForColumn:@"sellPrice"]];
        [goods setImageUrl:[rs stringForColumn:@"imageUrl"]];
        
        [allRecord addObject:goods];
    } [rs close];
    
    return allRecord;
}

- (BOOL)insertWithObject:(DRecord *)record {
    
    DGoods *goods = (DGoods*)record;
    
    [db executeUpdate:[self SQL:@"INSERT INTO %@(server_id,title,sellPrice,goodsNum,imageUrl) VALUES(?,?,?,?,?)" inTable:TABLE_NAME],goods.serverId,goods.title,[NSString stringWithFormat:@"%f",goods.sellPrice],[NSString stringWithFormat:@"%i",goods.goodsNum],goods.imageUrl];
    
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return NO;
	} else { // 每次新生成一个商品时，做一次本地购物车数量的更新
        
    }
    
    return YES;
}

- (void)appendGoodNumByServerId:(NSString*)serverId appendNum:(int)appendNum {
    DGoods *goods = (DGoods*)[self selectRecordByServerId:serverId];
    int num = goods.goodsNum + appendNum;
    
    NSString *sqlString = [NSString stringWithFormat:@"Update %@ set goodsNum = %@ where server_id = '%@'",TABLE_NAME,[NSString stringWithFormat:@"%i",num],serverId];
    [db executeUpdate:sqlString];
    
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}

- (void)addGoods:(NSString*)serverId title:(NSString*)title
       sellPrice:(float)sellPrice imageUrl:(NSString*)imageUrl addNum:(int)addNum {
    DGoods *goods = (DGoods*)[self selectRecordByServerId:serverId];
    if (goods == nil) {
        DGoods *goods = [[DGoods alloc]initWithServerId:serverId];
        goods.goodsNum = 1;
        goods.title = title;
        goods.sellPrice = sellPrice;
        goods.imageUrl = imageUrl;
        [self insertWithObject:goods];
    } else {
        [self appendGoodNumByServerId:serverId appendNum:1];
    }
}

- (NSInteger)getGoodsRowNum {
    NSString *sqlString = [NSString stringWithFormat:@"SELECT COUNT(*) FROM '%@'",TABLE_NAME];
    TResultSet *rs = [db executeQuery:sqlString];
    
    NSInteger totalCount = 0;
    while ([rs next]){
        totalCount = [rs intForColumnIndex:0];
    } [rs close];
    
    return totalCount;
}

- (BOOL)deleteByServerId:(NSString*)serverId {
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@ where server_id = '%@'",TABLE_NAME,serverId]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return NO;
	}
    
    return YES;
}

@end

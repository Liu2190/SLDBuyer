//
//  DefaultMarketDB.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-13.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "MarketAreaModel.h"

#define dataBasePath  [[(NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)) lastObject]stringByAppendingPathComponent:dataBaseName]
#define dataBaseName @"DBuyerDefaultMarket.db"

@interface DefaultMarketDB : NSObject
{
    FMDatabase *mDB;
}
+ (DefaultMarketDB *)sharedDataBase;
+ (NSString *)filePath:(NSString *)fileName;
/**
 * 检查本地版本是否需要更新
 */
- (BOOL)ifNeedUpdateVersion:(NSInteger)netVersion;
/**
 * 更新本地版本
 */
- (void)updateVersion:(NSInteger)version;
/**
 * 地区表新数据
 */
- (void)insertAreaData:(NSMutableArray *)datas;
/**
 * 超市表新数据
 */
- (void)insertMarketListData:(NSMutableArray *)datas;
/**
 * 读取地区表数据
 */
- (NSMutableArray *)readDataFromArea;
/**
 * 读取超市表数据 生出模型
 */
- (NSMutableArray *)readFromMarketListWith:(MarketAreaModel *)areaModel;
@end

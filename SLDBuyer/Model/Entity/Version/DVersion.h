//
//  DVersion.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DRecord.h"

@interface DVersion : DRecord

/**
 * 本地数据库名
 */
@property (nonatomic,strong)NSString *dbName;

/**
 * 本地数据库管理版本号
 */
@property (nonatomic,strong)NSString *version;

/**
 * 最后更新时间
 */
@property (nonatomic,strong)NSString *lastUpdateTime;

/**
 * 是否需要向服务端获取最新数据
 */
@property (nonatomic,assign)int isSys;


/**
 * 版本描述
 */
@property (nonatomic,strong)NSString *desc;

@end

//
//  DBHandler.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHandler : NSObject

+ (DBHandler *)sharedInstance;

/**
 * 更新最新版本
 */
- (void)startUpdateVersionData;

/**
 * 查看dbName本地表是否需要同步更新
 */
- (BOOL)isSynServerByDbName:(NSString*)dbName;
@end

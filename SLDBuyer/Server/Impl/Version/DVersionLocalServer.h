//
//  DVersionLocalServer.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "TBaseServer.h"

@interface DVersionLocalServer : TBaseServer

- (void)insertObjectsWithRecords:(NSArray*)records;
- (DRecord *)selectRecordByDbName:(NSString*)dbName;

//
- (void)updateSetViersion:(NSString*)dbName andSyn:(NSString*)syn;
@end

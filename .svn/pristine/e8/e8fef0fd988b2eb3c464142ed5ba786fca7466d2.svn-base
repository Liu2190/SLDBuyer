//
//  DVersionLocalServer.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DVersionLocalServer.h"
#import "DVersion.h"

#define TABLE_NAME @"D_DBVersion"

@implementation DVersionLocalServer

- (BOOL)insertWithObject:(DRecord *)record {
    DVersion *version = (DVersion*)record;
    
    [db executeUpdate:[self SQL:@"INSERT INTO %@(dbName,version,update_time,isSys,desc) VALUES(?,?,?,?,?)" inTable:TABLE_NAME],version.dbName,version.version,version.lastUpdateTime,[NSString stringWithFormat:@"%i",version.isSys],version.desc];
    
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return NO;
	}
    
    return YES;
}

- (void)insertObjectsWithRecords:(NSArray*)records {
    for (DVersion *version in records) {
        [self insertWithObject:version];
    }
}

- (NSArray*)selectAllRecord {
    NSMutableArray *records = [[NSMutableArray alloc]init];
    NSString *sqlString = [NSString stringWithFormat:@"SELECT * FROM %@",TABLE_NAME];
    TResultSet *rs = [db executeQuery:sqlString];
    
    while ([rs next]){
        DVersion *version = [[DVersion alloc]init];
        [version setRecordId:[rs intForColumn:@"record_id"]];
        [version setDbName:[rs stringForColumn:@"dbName"]];
        [version setVersion:[rs stringForColumn:@"version"]];
        [version setLastUpdateTime:[rs stringForColumn:@"update_time"]];
        [version setIsSys:[rs intForColumn:@"isSys"]];
        [version setDesc:[rs stringForColumn:@"desc"]];
        
        [records addObject:version];
    } [rs close];
    
    return records;
}

- (DRecord *)selectRecordByDbName:(NSString*)dbName {
    NSString *sqlString = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE dbName = '%@'",TABLE_NAME,dbName];
    TResultSet *rs = [db executeQuery:sqlString];
    
    DVersion *version = [[DVersion alloc]init];
    while ([rs next]){
        [version setRecordId:[rs intForColumn:@"record_id"]];
        [version setDbName:[rs stringForColumn:@"dbName"]];
        [version setVersion:[rs stringForColumn:@"version"]];
        [version setLastUpdateTime:[rs stringForColumn:@"update_time"]];
        [version setIsSys:[rs intForColumn:@"isSys"]];
        [version setDesc:[rs stringForColumn:@"desc"]];
    } [rs close];
    return version;
}

- (void)updateSetViersion:(NSString*)dbName andSyn:(NSString*)syn {
    NSString *sqlString = [NSString stringWithFormat:@"Update %@ set isSys = %@ where dbName = '%@'",TABLE_NAME,syn,dbName];
    [db executeUpdate:sqlString];
    
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}

@end

//
//  DSaleCateLocalServer.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DSaleCateLocalServer.h"
#import "DCate.h"

#define TABLE_NAME @"D_Cate"

@implementation DSaleCateLocalServer

- (BOOL)insertWithObject:(DRecord *)record {
    DCate *cate = (DCate*)record;
    
    if (cate.parentId == nil) cate.parentId = @"0";
    
    [db executeUpdate:[self SQL:@"INSERT INTO %@(server_id,title,imageUrl,parent_Id) VALUES(?,?,?,?)" inTable:TABLE_NAME],cate.serverId,cate.cateTitle,cate.cateImageUrl,cate.parentId];
    
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return NO;
	}
    
    if (cate.childCate.count>0) {
        [self insertAllCate:cate.childCate];
    }
    
    return YES;
}

- (void)insertAllCate:(NSArray *)allCate {
    if (allCate.count == 0) return;
    
    for (DCate *cate in allCate) {
        [self insertWithObject:cate];
    }
}

- (NSArray *)selectFirstLevel {
    NSMutableArray *allCate = [[NSMutableArray alloc]init];
    NSString *sqlString = [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE parent_id = '0'",TABLE_NAME];
    TResultSet *rs = [db executeQuery:sqlString];
    
    while ([rs next]){
        DCate *cate = [[DCate alloc]init];
        [cate setRecordId:[rs intForColumn:@"record_id"]];
        [cate setServerId:[rs stringForColumn:@"server_id"]];
        [cate setCateTitle:[rs stringForColumn:@"title"]];
        [cate setCateImageUrl:[rs stringForColumn:@"imageUrl"]];
        [cate setParentId:[rs stringForColumn:@"parent_id"]];
    
        cate.childCate = [self selectSecondLevel:cate.serverId];
        
        [allCate addObject:cate];
    } [rs close];
    
    return allCate;
}

- (NSMutableArray*)selectSecondLevel:(NSString*)parentId {
    NSMutableArray *allCate = [[NSMutableArray alloc]init];
    NSString *sqlString = [NSString stringWithFormat:
                           @"SELECT * FROM %@ WHERE parent_id = %@",TABLE_NAME,parentId];
    TResultSet *rs = [db executeQuery:sqlString];
    
    while ([rs next]){
        DCate *cate = [[DCate alloc]init];
        [cate setRecordId:[rs intForColumn:@"record_id"]];
        [cate setServerId:[rs stringForColumn:@"server_id"]];
        [cate setCateTitle:[rs stringForColumn:@"title"]];
        [cate setCateImageUrl:[rs stringForColumn:@"imageUrl"]];
        [cate setParentId:[rs stringForColumn:@"parent_id"]];
        
        [allCate addObject:cate];
    } [rs close];
    
    return allCate;
}


@end

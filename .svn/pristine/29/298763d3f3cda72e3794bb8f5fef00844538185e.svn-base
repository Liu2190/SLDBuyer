//
//  TUserCenterLocalServer.m
//  DBuyer
//
//  Created by dilei liu on 14-3-5.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "TUserCenterLocalServer.h"
#import "DLoginUser.h"

#define TABLE_NAME @"D_User"

@implementation TUserCenterLocalServer

- (BOOL)insertWithObject:(DRecord *)record {
    DLoginUser *loginUser = (DLoginUser*)record;
    
    NSString *loginDate = [[DUtilities sharedInstance]formatDate:loginUser.loginDate];
    
    [db executeUpdate:[self SQL:@"INSERT INTO %@(server_id,password,account,loginDate,hadLogin) VALUES(?,?,?,?,?)" inTable:TABLE_NAME],loginUser.serverId,loginUser.password,loginUser.account,loginDate,[NSString stringWithFormat:@"%i",loginUser.hadLogin]];
    
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return NO;
	}
    
    return YES;
}

- (DRecord *)selectFirstRecord {
    NSString *sqlString = [NSString stringWithFormat:@"SELECT * FROM '%@'",TABLE_NAME];
    TResultSet *rs = [db executeQuery:sqlString];
    
    DLoginUser *loginUser;
    while ([rs next]){
        loginUser = [[DLoginUser alloc]init];
        [loginUser setRecordId:[rs intForColumn:@"record_id"]];
        [loginUser setServerId:[rs stringForColumn:@"server_id"]];
        [loginUser setName:[rs stringForColumn:@"name"]];
        [loginUser setAccount:[rs stringForColumn:@"account"]];
        [loginUser setPassword:[rs stringForColumn:@"password"]];
        [loginUser setLoginDate:[rs dateForColumn:@"loginDate"]];
        [loginUser setHadLogin:[rs intForColumn:@"hadLogin"]];
        
    } [rs close];
    
    return loginUser;
}

- (BOOL)deleteAllRecord {
    [db executeUpdate:[self SQL:@"delete from %@" inTable:TABLE_NAME]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return NO;
	}
    
    return YES;
}

- (BOOL)loginByLoginUser:(id)loginUser {
    // 是第一次
    [self deleteAllRecord];
    BOOL boolean = [self insertWithObject:loginUser];
    
    return boolean;
}

- (BOOL)hadUserLogin {
    DLoginUser *loginUser = (DLoginUser*)[self selectFirstRecord];
    if (loginUser.hadLogin == 0) return NO;
    
    return YES;
}


@end

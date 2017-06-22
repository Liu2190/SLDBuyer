//
//  TUserCenterLocalServer.h
//  DBuyer
//
//  Created by dilei liu on 14-3-5.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "TBaseServer.h"

@interface TUserCenterLocalServer : TBaseServer

/**
 * 登录
 */
- (BOOL)loginByLoginUser:(id)loginUser;
- (DRecord *)selectFirstRecord;

/**
 * 判断是否登录
 */
- (BOOL)hadUserLogin;

@end

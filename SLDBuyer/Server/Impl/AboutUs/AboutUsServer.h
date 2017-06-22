//
//  AboutUsServer.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-9.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "TBaseServer.h"

@interface AboutUsServer : TBaseServer
/**
 *  获取关于我们
 */
- (void)doGetAbountDataByCallback:(void(^)(NSArray *ret))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 提交用户反馈
 */
-(void)doCommitSuggestionWithContent:(NSString *)content AndContact:(NSString *)contact callback:(void (^)(int status))callback failureCallback:(void (^)(NSString *))failureCallback;
/**
 *检查是否需要更新
 */
-(void)doGetVersionThingsByCallback:(void(^)(NSDictionary *ret))callback failureCallback:(void(^)(NSString *resp))failureCallback;
@end

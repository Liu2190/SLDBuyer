//
//  OrderServer.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-19.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "OrderServer.h"
#import "OrderModel.h"

@implementation OrderServer

- (void)doGetOrderListByCallback:(void(^)(NSMutableArray *listArray))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/version/queryVersionInfoForFL", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:[TimeStamp timeStamp] forKey:@"stamp"];
    [item setPostValue:[MD5 md5] forKey:@"verify"];
    [item setPostValue:[[NSUserDefaults standardUserDefaults]objectForKey:@"versionNum"] forKey:@"versionNum"];
    [item setPostValue:@"2" forKey:@"os_code"];
    [item setPostValue:[NSString stringWithFormat:@"%d",[UIDevice currentResolution]] forKey:@"size_code"];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetOrderListRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
- (void)doGetOrderDetailByOrderID:(NSString *)orderID andCallback:(void(^)(NSMutableArray *listArray))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/version/queryVersionInfoForFL", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetOrderDetailRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];

}
- (void)doGetRefundInforByOrderID:(NSString *)orderID andCallback:(void(^)(NSMutableArray *listArray))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/version/queryVersionInfoForFL", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:[TimeStamp timeStamp] forKey:@"stamp"];
    [item setPostValue:[MD5 md5] forKey:@"verify"];
    [item setPostValue:[[NSUserDefaults standardUserDefaults]objectForKey:@"versionNum"] forKey:@"versionNum"];
    [item setPostValue:@"2" forKey:@"os_code"];
    [item setPostValue:[NSString stringWithFormat:@"%d",[UIDevice currentResolution]] forKey:@"size_code"];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetRefundInforRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
- (void)doGetDeliveryStatusByID:(NSString *)orderID andCallback:(void(^)(NSMutableArray *listArray))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/version/queryVersionInfoForFL", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:[TimeStamp timeStamp] forKey:@"stamp"];
    [item setPostValue:[MD5 md5] forKey:@"verify"];
    [item setPostValue:[[NSUserDefaults standardUserDefaults]objectForKey:@"versionNum"] forKey:@"versionNum"];
    [item setPostValue:@"2" forKey:@"os_code"];
    [item setPostValue:[NSString stringWithFormat:@"%d",[UIDevice currentResolution]] forKey:@"size_code"];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetDeliveryStatusRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];

}
- (void)requestFinished:(ASIHTTPRequest *)request {
    [super requestFinished:request];
    NSDictionary *requestDictionary = [request userInfo];
    NSDictionary *packData = [requestDictionary objectForKey:@"packedData"];
    
    if ([[packData objectForKey:@"status"]intValue] != 0) {
        NSString *error = [packData objectForKey:@"msg"];
        id failureCallback  = [requestDictionary objectForKey:kFailureCallback];
        ((void(^)(NSString *))failureCallback)(error);
        
        return;
    }
    
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoGetOrderListRequest) {
        NSDictionary *dict  = [requestDictionary objectForKey:@"packedData"];
        NSString *newVersion = [dict objectForKey:@"version"];
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(int ))callback)([newVersion intValue]);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue]==DoGetOrderDetailRequest){
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSDictionary *))callback)(dict);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue]==DoGetRefundInforRequest)
    {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSDictionary *))callback)(dict);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue]==DoGetDeliveryStatusRequest)
    {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSDictionary *))callback)(dict);
    }
}
@end

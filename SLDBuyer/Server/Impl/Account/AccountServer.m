//
//  AccountServer.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-10.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AccountServer.h"
@implementation AccountServer
- (void)doGetMarketVersionNumByCallback:(void(^)(int version))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/version/queryVersionInfoForFL", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:@"7" forKey:@"type"];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetMarketVersionNumRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    
    [self.requestQueue addOperation:item];
    [self start];
}
- (void)doGetMarketAreaByCallback:(void(^)(NSMutableArray *ret))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/store/queryCitys", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetMarketAreaRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
- (void)doGetMarketListByCallback:(void(^)(NSMutableArray *ret))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/store/queryStoreByStoreSort", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetMarketListRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
- (void)doGetDefaultMarketByCallback:(void(^)(NSString *marketName))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/userAttribute/queryUserAttrType", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:@"1" forKey:@"type"];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetDefaultMarketRequeat],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
- (void)DoUpdateMarketByID:(NSString *)marketID AndCallback:(void(^)(int ret))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/userAttribute/saveByUserIdAndAttrType", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:@"1" forKey:@"type"];
    [item setPostValue:marketID forKey:@"value"];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoUpdateMarketRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
- (void)doGetUserPointByCallback:(void(^)(NSString *point))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/settlementcommotitty/getPersonCenter", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetUserPointRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
/**
 * 获取地址列表
 */
- (void)doGetAddressListByCallBack:(void(^)(NSMutableArray *array))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/settlementcommotitty/queryAddressList", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetAddresslistRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
/**
 * 删除地址
 */
- (void)doDeleteAddressBy:(NSString *)addressID AndCallBack:(void(^)(int status))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/settlementcommotitty/detelAddressList", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:addressID forKey:@"addreId"];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoDeleteAddressRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
/**
 * 编辑地址
 */
- (void)doEditAddressBy:(AddressListModel *)address AndCallBack:(void(^)(int status))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/settlementcommotitty/getUpdateStatus", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:address.userName forKey:@"consignee"];
    [item setPostValue:address.addressName forKey:@"address"];
    [item setPostValue:address.phoneNum forKey:@"contact"];
    [item setPostValue:address.areaID forKey:@"areaId"];
    [item setPostValue:address.addressID forKey:@"addreId"];
    //[item setPostValue:nil forKey:@"boutique"];
    //[item setPostValue:nil forKey:@"stores"];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoUpdateAddressRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
/**
 * 新建地址
 */
- (void)doCreateAddressBy:(AddressListModel *)model AndCallBack:(void(^)(int status))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/settlementcommotitty/addCommoditityAddress", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    /*
     NSString *addressdetail=[NSString stringWithFormat:@"北京市%@%@",self.findAreaIdBtn.titleLabel.text,self.addressDetailInfoTextView.text];
     [dict setObject:self.nameTextField.text forKey:@"consignee"];
     [dict setObject:addressdetail forKey:@"address"];
     [dict setObject:self.phoneNumberTextField.text forKey:@"contact"];
     self.areaId = [[DBManager sharedDatabase]selectAreaIdWihtAreaname:self.findAreaIdBtn.titleLabel.text];
     [dict setObject:self.areaId forKey:@"areaId"];
     [dict setObject:self.boutique forKey:@"boutique"];
     [dict setObject:self.stores forKey:@"stores"];
     */
    
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoAddAddressRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];

}
/**
 * 获取个人账户信息
 */
- (void)doGetIndividualInformationByCallBack:(void(^)(IndividualModel *inModel))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/settlementcommotitty/getPersonCenter", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoGetUserInforRequest],USER_INFO_KEY_TYPE, nil]];
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}
/**
 * 修改个人账户信息
 */
- (void)doUpdateIndividualInforBy:(IndividualModel *)model AndCallBack:(void(^)(int status))callback failureCallback:(void(^)(NSString *resp))failureCallback
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/settlementcommotitty/getPersonCenter", serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    NSArray *objects = @[[callback copy] , [failureCallback copy] ];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:DoUpdateUserInforRequest],USER_INFO_KEY_TYPE, nil]];
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
    
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoGetMarketVersionNumRequest) {
        NSDictionary *dict  = [requestDictionary objectForKey:@"packedData"];
        NSString *newVersion = [dict objectForKey:@"version"];
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(int ))callback)([newVersion intValue]);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE] floatValue] == DoGetDefaultMarketRequeat)
    {
        NSDictionary *dict  = [requestDictionary objectForKey:@"packedData"];
        NSString *marketName = [[NSString alloc]init];
        for (NSDictionary *item in [dict objectForKey:@"storeList"])
        {
            marketName = [item objectForKey:@"name"];
        }
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSString *))callback)(marketName);
    }
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoGetMarketAreaRequest) {
        NSDictionary *dict  = [requestDictionary objectForKey:@"packedData"];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        for(NSDictionary *item in [dict objectForKey:@"resultList"])
        {
            MarketAreaModel *model = [[MarketAreaModel alloc]init];
            model.areaID = [item objectForKey:@"id"];
            model.areaName = [item objectForKey:@"name"];
            [resultArray addObject:model];
        }
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSMutableArray *))callback)(resultArray);
    }
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoUpdateMarketRequest) {
        NSDictionary *dict  = [requestDictionary objectForKey:@"packedData"];
        int status = [[dict objectForKey:@"status"] intValue];
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(int ))callback)(status);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue]== DoGetUserPointRequest)
    {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        NSString *point = [dict objectForKey:@"integralInfo"];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSString *))callback)(point);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoGetUserInforRequest)
    {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        IndividualModel *model = [[IndividualModel alloc]init];
        model.name = [dict objectForKey:@"name"];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(IndividualModel *))callback)(model);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE ]floatValue]==DoUpdateUserInforRequest)
    {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        int ret = [[dict objectForKey:@"status"] intValue];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(int))callback)(ret);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue]==DoGetMarketListRequest)
    {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        for(NSDictionary *item in [dict objectForKey:@"storeList"])
        {
            MarketModel *model = [[MarketModel alloc]init];
            model.areaID = [item objectForKey:@"areaId"];
            model.areaName = [item objectForKey:@"cityName"];
            model.marketID = [item objectForKey:@"ID"];
            model.marketName = [item objectForKey:@"NAME"];
            model.storeSort = [item objectForKey:@"storeSort"];
            model.marketAddress = [item objectForKey:@"address"];
            [resultArray addObject:model];
        }
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSMutableArray *))callback)(resultArray);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue]==DoGetAddresslistRequest){
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for(NSDictionary *item in [dict objectForKey:@"result"])
        {
            AddressListModel *model = [[AddressListModel alloc]init];
            model.phoneNum = [item objectForKey:@"contact"];
            model.userName = [item objectForKey:@"consignee"];
            model.addressID = [item objectForKey:@"ID"];
            model.addressName = [item objectForKey:@"address"];
            model.isDefault = [[item objectForKey:@"isDefault"] intValue]==1?YES:NO;
            model.areaID = [item objectForKey:@"areaId"];
            model.areaName = [item objectForKey:@"name"];
            [array addObject:model];
        }
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSMutableArray *))callback)(array);
    }
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue]==DoDeleteAddressRequest) {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        int status = [[dict objectForKey:@"status"] intValue];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(int))callback)(status);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue]==DoUpdateAddressRequest)
    {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        int status = [[dict objectForKey:@"status"] intValue];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(int))callback)(status);
    }
    if([[requestDictionary objectForKey:USER_INFO_KEY_TYPE] floatValue]==DoAddAddressRequest)
    {
        NSDictionary *dict = [requestDictionary objectForKey:@"packedData"];
        int status = [[dict objectForKey:@"status"] intValue];
        id callback = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(int))callback)(status);
    }
}
@end

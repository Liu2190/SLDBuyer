//
//  AccountServer.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-10.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "TBaseServer.h"
#import "IndividualModel.h"
#import "AddressListModel.h"
#import "MarketAreaModel.h"
#import "MarketModel.h"

@interface AccountServer : TBaseServer
/**
 *  获取自提超市的版本号
 */
- (void)doGetMarketVersionNumByCallback:(void(^)(int version))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取自提超市的地区
 */
- (void)doGetMarketAreaByCallback:(void(^)(NSMutableArray *ret))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取自提超市列表
 */
- (void)doGetMarketListByCallback:(void(^)(NSMutableArray *ret))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取自提超市
 */
- (void)doGetDefaultMarketByCallback:(void(^)(NSString *marketName))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 设置自提超市
 */
- (void)DoUpdateMarketByID:(NSString *)marketID AndCallback:(void(^)(int ret))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取用户积分
 */
- (void)doGetUserPointByCallback:(void(^)(NSString *pointArray))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取地址列表
 */
- (void)doGetAddressListByCallBack:(void(^)(NSMutableArray *array))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 删除地址
 */
- (void)doDeleteAddressBy:(NSString *)addressID AndCallBack:(void(^)(int status))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 编辑地址
 */
- (void)doEditAddressBy:(AddressListModel *)address AndCallBack:(void(^)(int status))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 新建地址
 */
- (void)doCreateAddressBy:(AddressListModel *)address AndCallBack:(void(^)(int status))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取个人账户信息
 */
- (void)doGetIndividualInformationByCallBack:(void(^)(IndividualModel *inModel))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 修改个人账户信息
 */
- (void)doUpdateIndividualInforBy:(IndividualModel *)model AndCallBack:(void(^)(int status))callback failureCallback:(void(^)(NSString *resp))failureCallback;
@end

//
//  OrderServer.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-19.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "TBaseServer.h"

@interface OrderServer : TBaseServer
/**
 *  获取订单列表
 */
- (void)doGetOrderListByCallback:(void(^)(NSMutableArray *listArray))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取订单详情
 */
- (void)doGetOrderDetailByOrderID:(NSString *)orderID andCallback:(void(^)(NSMutableArray *listArray))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取退款说明接口
 */
- (void)doGetRefundInforByOrderID:(NSString *)orderID andCallback:(void(^)(NSMutableArray *listArray))callback failureCallback:(void(^)(NSString *resp))failureCallback;
/**
 * 获取物流跟踪接口
 */
- (void)doGetDeliveryStatusByID:(NSString *)orderID andCallback:(void(^)(NSMutableArray *listArray))callback failureCallback:(void(^)(NSString *resp))failureCallback;
@end

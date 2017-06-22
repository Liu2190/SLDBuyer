//
//  DHomeServer.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-28.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeLocalServer.h"

@interface DHomeServer : DHomeLocalServer

/**
 * 获取首页Banner图数据
 */
- (void)doSelectBannerRecordByCallback:(void(^)(NSArray *datas))callback
                       failureCallback:(void(^)(NSString *resp))failureCallback;

/**
 * 获取一级分类商品
 */
- (void)queryProductsByOneCateByVersionNo:(int)versionNo
                              andCallBack:(void(^)(NSArray *datas))callback
                          failureCallback:(void(^)(NSString *resp))failureCallback;

/**
 * 获取二级分类列表
 */
- (void)queryCateListByCateId:(int)cateId andVersion:(int)versionNo
                  andCallBack:(void(^)(NSArray *datas))callback
              failureCallback:(void(^)(NSString *resp))failureCallback;

@end

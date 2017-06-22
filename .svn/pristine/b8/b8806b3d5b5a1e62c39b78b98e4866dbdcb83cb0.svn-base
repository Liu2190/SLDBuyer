//
//  DHomeServer.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-28.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeServer.h"
#import "DHomeBanner.h"
#import "DHomeGoodsCate.h"

@implementation DHomeServer

- (void)doSelectBannerRecordByCallback:(void(^)(NSArray *datas))callback
                       failureCallback:(void(^)(NSString *resp))failureCallback {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/homeManager/banner",serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    
    NSArray *objects = @[[callback copy], [failureCallback copy]];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary
                                        dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc]initWithObjectsAndKeys:
                                           [NSNumber numberWithInt:DoSelectBannerRequest],
                                           USER_INFO_KEY_TYPE, nil]];
    
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}

- (void)queryProductsByOneCateByVersionNo:(int)versionNo
                          andCallBack:(void(^)(NSArray *datas))callback
                      failureCallback:(void(^)(NSString *resp))failureCallback {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@interface/homeManager/queryPageByOneCate",serviceHost]];
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:[NSString stringWithFormat:@"%i",versionNo] forKey:@"version"];
    
    NSArray *objects = @[[callback copy], [failureCallback copy]];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary
                                        dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc]initWithObjectsAndKeys:
                                           [NSNumber numberWithInt:DoQueryCateProductsRequest],
                                           USER_INFO_KEY_TYPE, nil]];
    
    [item setUserInfo:requestInfo];
    [self.requestQueue addOperation:item];
    [self start];
}

- (void)queryCateListByCateId:(int)cateId andVersion:(int)versionNo
                  andCallBack:(void(^)(NSArray *datas))callback
              failureCallback:(void(^)(NSString *resp))failureCallback {
    
    NSURL *url = [NSURL URLWithString:
                  [NSString stringWithFormat:@"%@interface/homeManager/queryProductForSecondTypeByParentId",
                   serviceHost]];
    
    ASIFormDataRequest *item = [[ASIFormDataRequest alloc] initWithURL:url];
    [item setPostValue:[NSString stringWithFormat:@"%i",versionNo] forKey:@"version"];
    [item setPostValue:[NSString stringWithFormat:@"%i",cateId] forKey:@"categoryID"];
    
    NSArray *objects = @[[callback copy], [failureCallback copy]];
    NSArray *keys = @[kCompleteCallback, kFailureCallback];
    NSMutableDictionary *requestInfo = [NSMutableDictionary
                                        dictionaryWithObjects:objects forKeys:keys];
    [requestInfo addEntriesFromDictionary:[[NSDictionary alloc]initWithObjectsAndKeys:
                                           [NSNumber numberWithInt:DoQueryCateListRequest],
                                           USER_INFO_KEY_TYPE, nil]];
    
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
    
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoSelectBannerRequest) {
        NSMutableArray *banners = [[NSMutableArray alloc]init];
        NSArray *datas = [packData objectForKey:@"banner_list"];
        
        for (NSDictionary *dict in datas) {
            DHomeBanner *homeBannerForm = [[DHomeBanner alloc]initWithJsonDictionary:dict];
            [banners addObject:homeBannerForm];
        }

        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSArray *datas))callback)(banners);
    }
    
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoQueryCateProductsRequest) {
        NSArray *homeGoods = [packData objectForKey:@"cate_list"];
        NSMutableArray *goodsForms = [[NSMutableArray alloc]init];
        
        for (NSDictionary *dic in homeGoods) {
            DHomeGoodsCate *homeGoodsForm = [[DHomeGoodsCate alloc]initWithJsonDictionary:dic];
            if (homeGoodsForm.products.count < 6) continue;
            
            [goodsForms addObject:homeGoodsForm];
        }
        
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSArray *datas))callback)(goodsForms);
    }
    
    if ([[requestDictionary objectForKey:USER_INFO_KEY_TYPE]floatValue] == DoQueryCateListRequest) {
        NSArray *homeGoods = [packData objectForKey:@"cate_list"];
        NSMutableArray *goodsForms = [[NSMutableArray alloc]init];
        
        for (NSDictionary *dic in homeGoods) {
            DHomeGoodsCate *homeGoodsForm = [[DHomeGoodsCate alloc]initWithJsonDictionary:dic];
            [goodsForms addObject:homeGoodsForm];
        }
        
        id callback  = [requestDictionary objectForKey:kCompleteCallback];
        ((void(^)(NSArray *datas))callback)(goodsForms);
    }
}



@end

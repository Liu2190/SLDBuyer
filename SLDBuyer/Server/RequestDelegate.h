
#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

typedef enum {
    DefaultRequest,
    
    DoSelectBannerRequest,      // home
    DoQueryCateProductsRequest, // 一级分类商品
    DoQueryCateListRequest,     // 获取二级分类列表
    
    DoExitLoginRequest,// user
    DoLoginRequest,
    DoVerifyRequest,
    DoRegisterRequest,
    DoUpdatePasswordRequest,
    
    DoGetAbountDataRequest,//aboutUs
    DoCommitSuggestrRequest,
    DoGetVersionInformationRequest,
    
    DoGetMarketVersionNumRequest,//Account
    DoGetMarketAreaRequest,
    DoGetMarketListRequest,
    DoGetDefaultMarketRequeat,
    DoUpdateMarketRequest,
    DoGetUserPointRequest,
    DoGetUserInforRequest,
    DoUpdateUserInforRequest,
    DoGetAddresslistRequest,
    DoDeleteAddressRequest,
    DoUpdateAddressRequest,
    DoAddAddressRequest,
    
    DoGetOrderListRequest,//Order
    DoGetOrderDetailRequest,
    DoGetRefundInforRequest,
    DoGetDeliveryStatusRequest,
    
}RequestType;

@protocol RequestDelegate <NSObject>
- (void)requestFinished:(ASIHTTPRequest *)request;
- (void)requestFailed:(ASIHTTPRequest *)request;
- (void)request:(ASIHTTPRequest *)request willRedirectToURL:(NSURL *)newURL;

@end
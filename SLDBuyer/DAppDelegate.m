//
//  DAppDelegate.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-20.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DAppDelegate.h"
#import "DMainRootContrller.h"
#import "DBHandler.h"

@implementation DAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:WEIBOKEY];
    [WXApi registerApp:WEIXINKEY];
    
    //
    [[DBHandler sharedInstance]startUpdateVersionData];
    BOOL boolean = [[DUtilities sharedInstance]hadLogin];
    NSLog(@"%i",boolean);
    
    DMainRootContrller *rootController = [DMainRootContrller sharedManager];
    self.window.rootViewController = rootController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    if(_urlMark==SINA){
        return [WeiboSDK handleOpenURL:url delegate:self];
    }else if (_urlMark==WECHAT){
        return [WXApi handleOpenURL:url delegate:self];
    }
    return NO;
}
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    if(_urlMark==SINA){
        return [WeiboSDK handleOpenURL:url delegate:self];
    } else if (_urlMark==WECHAT){
        return [WXApi handleOpenURL:url delegate:self];
    }
    
    return NO;
}

#pragma mark - weibosdkdelegate
-(void)didReceiveWeiboRequest:(WBBaseRequest *)request{
    if([request isKindOfClass:WBProvideMessageForWeiboRequest.class]){
        
    }
}
-(void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    if([response isKindOfClass:WBSendMessageToWeiboResponse.class]){
        if(response.statusCode==WeiboSDKResponseStatusCodeSuccess){
            
        } else if (response.statusCode==WeiboSDKResponseStatusCodeUserCancel){
            
        } else if (response.statusCode == WeiboSDKResponseStatusCodeSentFail){
            
        }
        
    } else if ([response isKindOfClass:WBAuthorizeResponse.class]){
        if(response.statusCode==WeiboSDKResponseStatusCodeAuthDeny){
            
        } else if (response.statusCode==WeiboSDKResponseStatusCodeSuccess){
            
        }
    }
}

#pragma mark - WXAPIDELEGATE
-(void)onReq:(BaseReq *)req{
    
}

-(void)onResp:(BaseResp *)resp{
    int result=[resp errCode];
    if(result==0){
        
    }
}
@end

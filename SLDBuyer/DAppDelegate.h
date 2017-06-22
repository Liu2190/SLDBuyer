//
//  DAppDelegate.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-20.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"
#import "WeiboSDK.h"
enum{
    SINA=1,
    WECHAT=2,
};
@interface DAppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate,WeiboSDKDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,assign)int urlMark;
@end

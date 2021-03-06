//
//  DPopupHandler.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DPopupHandler.h"
#import "DPopupController.h"

@implementation DPopupHandler

+ (DPopupHandler *)sharedInstance {
    static DPopupHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DPopupHandler alloc] init];
        sharedInstance.pageHeight = 250;
        sharedInstance.pageWidth = 250;
    });
    
    return sharedInstance;
}

- (id)genPopupNavigation:(id)controllerObj {
    DPopupController *popupController = (DPopupController*)controllerObj;
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:popupController];
    [navi.view setFrame:CGRectMake(0, 0, _pageWidth, _pageHeight)];
    
    return navi;
}

- (id)genPopupNavigation:(id)controllerObj width:(float)width height:(float)height {
    DPopupController *popupController = (DPopupController*)controllerObj;
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:popupController];
    [navi.view setFrame:CGRectMake(0, 0, width, height)];
    
    return navi;
}



@end

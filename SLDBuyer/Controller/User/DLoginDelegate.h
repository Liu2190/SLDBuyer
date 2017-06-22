//
//  DLoginDelegate.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-30.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DLoginDelegate <NSObject>

@optional
- (void)doLoginFinish;
- (void)doRegisterFinish;
- (void)doForgetFinish;

@end

//
//  DMainRootContrller.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-21.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMainBracketController.h"

@interface DMainRootContrller : UIViewController {
    DMainBracketController *_bracketController;
    
}

@property (nonatomic,assign)UIStatusBarStyle statusBarStyle;



+ (DMainRootContrller *)sharedManager;
- (void)updateStatuBarColorByStyle:(UIStatusBarStyle)style;

/**
 * 是否打开侧滑功能，如果isOpen为YES，则可以侧滑打开左菜单列表;否则，反之
 */
- (void)setOpenDrawerGesture:(BOOL)isOpen;
- (void)setCloseDrawerGesture:(BOOL)isOpen;

/**
 * 登录后处理操作
 */
- (void)doHandlerLogining;


@end

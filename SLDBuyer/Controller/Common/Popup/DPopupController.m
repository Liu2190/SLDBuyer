//
//  DPopupController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DPopupController.h"
#import "DMainRootContrller.h"

@implementation DPopupController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setFrame:CGRectMake(0, 0,self.navigationController.view.frame.size.width,
                                   self.navigationController.view.frame.size.height - self.navigationController.navigationBar.frame.size.height)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[DMainRootContrller sharedManager]setCloseDrawerGesture:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[DMainRootContrller sharedManager]setCloseDrawerGesture:YES];
}

- (void)setDefaultNavigationStyle {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], NSBackgroundColorAttributeName,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], NSBackgroundColorAttributeName,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], NSTextEffectAttributeName,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:21.0], NSParagraphStyleAttributeName,
                                                                     nil]];
    
}


@end

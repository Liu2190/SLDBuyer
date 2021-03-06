//
//  DConsigneeController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-18.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DConsigneeController.h"
#import "UIButton+Extensions.h"

@implementation DConsigneeController

- (void)setDefaultNavigationStyle {
    UIImage * imageNormal = [UIImage imageNamed:@"Nav_Back_Green.png"];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    [button addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:imageNormal forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0.0, 0.0, 3*imageNormal.size.width/5, 3*imageNormal.size.height/5);
    [button setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -30)];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem= barButtonItem;
    
    
    UIColor *navBgColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:navBgColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"收货地址";
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:114./255.0 green:178.0/255 blue:110/255. alpha:1.0];
    self.navigationItem.titleView = label;
    [label sizeToFit];
}

- (void)leftButtonAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

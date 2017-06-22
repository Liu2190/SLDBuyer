//
//  DShopFlowViewController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-13.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DShopFlowViewController.h"
#import "UIButton+Extensions.h"

@implementation DShopFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)setDefaultNavigationStyle {
    UIImage * imageNormal = [UIImage imageNamed:@"Nav_Back_Green.png"];
    
    // create your button
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    [button addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:imageNormal forState:UIControlStateNormal];
    
    // set the frame of the button (better to grab actual offset of leftbarbuttonitem instead of magic numbers)
    button.frame = CGRectMake(0.0, 0.0, 3*imageNormal.size.width/5, 3*imageNormal.size.height/5);
    [button setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -30)];
    // set the barbuttonitem to be the view
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem= barButtonItem;
    
    
    UIColor *navBgColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    
    [self.navigationController.navigationBar setBarTintColor:navBgColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"自提超市";
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

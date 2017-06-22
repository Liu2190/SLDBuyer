//
//  DRootTableController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-22.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DRootTableController.h"
#import "DDrawerVisualStateManager.h"
#import "MMDrawerBarButtonItem.h"
#import "MMCenterTableViewCell.h"
#import "DLeftSideDrawerController.h"
#import "DRightSideDrawerController.h"

@implementation DRootTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:0 green:0.0 blue:0.0 alpha:.05]];
    
    [self setupLeftMenuButton];
}

-(void)setupLeftMenuButton{
    _leftButton = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,25,25)];
    [_leftButton setStyle:kFRDLivelyButtonStyleHamburger animated:NO];
    [_leftButton addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    self.navigationItem.leftBarButtonItem = buttonItem;
    
}

-(void)setupRightMenuButton{
    MMDrawerBarButtonItem *rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void)updateLeftBtnStyle:(BOOL)isClose {
    if (isClose) [_leftButton setStyle:kFRDLivelyButtonStyleClose animated:YES];
    else [_leftButton setStyle:kFRDLivelyButtonStyleHamburger animated:YES];
}


@end

//
//  DRootTableController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-22.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DBaseTableController.h"
#import "FRDLivelyButton.h"

@interface DRootTableController : DBaseTableController {
    FRDLivelyButton *_leftButton;
}

/**
 * 导航菜单显示标题
 */
@property (nonatomic,strong)NSString *menuTitle;

/**
 * 导航菜单显示标题
 */
@property (nonatomic,strong)NSString *menuImage;

/**
 *
 */
- (void)updateLeftBtnStyle:(BOOL)isClose;

@end

//
//  DRootTableController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-22.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBaseTableController : UITableViewController

- (void)setDefaultNavigationStyle;
- (void)removeAllRow:(void(^)(BOOL isFinish))callback;

@end

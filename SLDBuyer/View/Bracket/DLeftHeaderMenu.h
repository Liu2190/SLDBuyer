//
//  DLeftHeaderMenu.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLeftMenuDelegate.h"

@interface DLeftHeaderMenu : UIView

@property (nonatomic,assign)id<DLeftMenuDelegate> leftMenuDelegate;

@end

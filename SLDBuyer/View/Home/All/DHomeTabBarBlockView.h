//
//  DHomeTabBarBlockView.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHomeTabBarDelegate.h"

@interface DHomeTabBarBlockView : UIView

@property (nonatomic,assign)id<DHomeTabBarDelegate> tabBarDelegate;

- (id)initWithFrame:(CGRect)frame andDict:(NSDictionary*)dict;

@end

//
//  DHomeTabBarView.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHomeTabBarDelegate.h"
#import "DHomeDelegate.h"

@interface DHomeTabBarView : UIView<DHomeTabBarDelegate> {
    UIImageView *_lineImageView;
}

@property (nonatomic,strong)NSMutableArray *blocks;
@property (nonatomic,assign)id<DHomeDelegate> homeDelegate;
@property (nonatomic,assign)int selectIndex;

@property (nonatomic,assign)BOOL isLine;

- (id)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles;
- (id)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles andIsLine:(BOOL)isLine;

- (void)resetLayout;
@end

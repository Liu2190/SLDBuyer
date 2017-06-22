//
//  TAllscoOrderScrollView.h
//  DBuyer
//
//  Created by Dbuyer mac1 on 14-5-9.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHomeScrollView : UIScrollView {
    int _totalPage;
    
    NSMutableArray *_pageViews;
}

- (id)initWithFrame:(CGRect)frame andPageNum:(int)totalPage;

/**
 * 获得当前页号
 */
- (int)getCurrentPageNO;

/**
 * 根据页标获取页对象
 */
- (UIView*)getPageViewByPageIndex:(int)pageIndex;

/**
 * 滑动到指定页
 */
- (void)scrollPageByPageNum:(int)pageIndex animated:(BOOL)animated;


@end

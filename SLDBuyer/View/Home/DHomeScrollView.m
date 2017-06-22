//
//  TAllscoOrderScrollView.m
//  DBuyer
//
//  Created by Dbuyer mac1 on 14-5-9.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "DHomeScrollView.h"

@implementation DHomeScrollView

- (id)initWithFrame:(CGRect)frame andPageNum:(int)totalPage {
    self = [super initWithFrame:frame];
    self.pagingEnabled = false;
    self.scrollEnabled = NO;
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    _totalPage = totalPage;
    _pageViews = [[NSMutableArray alloc]init];
    
    self.contentSize = CGSizeMake(_totalPage*frame.size.width, frame.size.height);
    
    float page_w = frame.size.width;
    float page_h = frame.size.height;
    for (int i=0; i<_totalPage; i++) {
        UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(i*page_w, 0, page_w, page_h)];
        [_pageViews addObject:pageView];
        [self addSubview:pageView];
    }

    return self;
}

- (UIView*)getPageViewByPageIndex:(int)pageIndex {
    return [_pageViews objectAtIndex:pageIndex];
}

- (void)scrollPageByPageNum:(int)pageIndex animated:(BOOL)animated {
    CGPoint position = CGPointMake(pageIndex*self.frame.size.width, 0);
    [self setContentOffset:position animated:animated];
}

- (int)getCurrentPageNO {
    CGPoint point = [self contentOffset];
    int pageNO = point.x/self.frame.size.width;
    
    return pageNO;
}

@end

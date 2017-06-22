//
//  DHomeTabBarView.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeTabBarView.h"
#import "DHomeTabBarBlockView.h"

@implementation DHomeTabBarView

- (id)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles andIsLine:(BOOL)isLine {
    self = [super initWithFrame:frame];
    self.blocks = [[NSMutableArray alloc]init];
    self.selectIndex = 0;
    self.isLine = isLine;
    
    float w = self.frame.size.width/titles.count;
    float h = self.frame.size.height-1;
    
    for (int i=0;i<titles.count;i++) {
        NSDictionary *dict = [titles objectAtIndex:i];
        CGRect rect = CGRectMake(i*w, 0, w, h);
        DHomeTabBarBlockView *blockView = [[DHomeTabBarBlockView alloc]initWithFrame:rect andDict:dict];
        blockView.tabBarDelegate = self;
        blockView.tag = i;
        [_blocks addObject:blockView];
    }
    
    [self layoutSubviewsForBlockView];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles {
    self = [super initWithFrame:frame];
    self.blocks = [[NSMutableArray alloc]init];
    self.selectIndex = 0;
    self.isLine = YES;
    
    float w = self.frame.size.width/titles.count;
    float h = self.frame.size.height-1;
    
    for (int i=0;i<titles.count;i++) {
        NSDictionary *dict = [titles objectAtIndex:i];
        CGRect rect = CGRectMake(i*w, 0, w, h);
        DHomeTabBarBlockView *blockView = [[DHomeTabBarBlockView alloc]initWithFrame:rect andDict:dict];
        blockView.tabBarDelegate = self;
        blockView.tag = i;
        [_blocks addObject:blockView];
    }
    
    [self layoutSubviewsForBlockView];
    
    return self;
}

- (void)layoutSubviewsForBlockView {
    for (UIView *view in _blocks) {
        [self addSubview:view];
    }

    _lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1,
                                                                  self.frame.size.width/_blocks.count, 1)];
    [_lineImageView setImage:[UIImage imageNamed:@"home_tab_selLine.png"]];
    
    if (!_isLine) return;
    
    UIImageView *lineView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [lineView setFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1.5)];
    [self addSubview:lineView];
    
    lineView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [lineView setFrame:CGRectMake((self.frame.size.width-.5)/2, 0, .5, self.frame.size.height)];
    [self addSubview:lineView];
}

- (void)doTabBarClicked:(int)index {
    [self moveLineImageView:index];
    
    if (![self isAddLineImageView]) {
        [self addSubview:_lineImageView];
        [self.homeDelegate doHomeTabBarClicked:index];
    } else if (_selectIndex != index) {
        [self.homeDelegate doHomeTabBarClicked:index];
    }
    
    _selectIndex = index;
}

- (void)moveLineImageView:(int)index {
    if (![self isAddLineImageView]) {
        
        float w = self.frame.size.width/_blocks.count;
        float x = index*w;
        CGRect rect = _lineImageView.frame;
        rect.origin.x = x;
        [_lineImageView setFrame:rect];
        
    } else {
        if (index != _selectIndex) {
            CAKeyframeAnimation *moveAnimation = nil;
            
            float w = self.frame.size.width/_blocks.count;
            float x = index*w+w/2;
            CGPoint center = CGPointMake(x, _lineImageView.center.y);
            moveAnimation = [[DUtilities sharedInstance]objectMoveFrom:CGPointMake(_lineImageView.center.x, _lineImageView.center.y) toPoint:center duration:.2f];
            [_lineImageView.layer addAnimation:moveAnimation forKey:@"move"];
            [_lineImageView setCenter:center];
        }
    }
}

- (BOOL)isAddLineImageView {
    for (UIView *view in [self subviews]) {
        if (_lineImageView == view) {
            return YES;
        }
    }
    
    return NO;
}

- (void)resetLayout {
    self.selectIndex = 0;
    [_lineImageView removeFromSuperview];
}
@end

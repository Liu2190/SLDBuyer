//
//  DCateSectionTopView.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DCateSectionTopView.h"

#define imageview_size_width    46

@implementation DCateSectionTopView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:250./255 green:249./255 blue:246./255 alpha:1.0]];
    
    float w = frame.size.width/3;
    float h = frame.size.height;
    
    // nominate
    float x = (w-imageview_size_width)/2;
    float y = (h - imageview_size_width)/2;
    UIButton *nominateBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, imageview_size_width, imageview_size_width)];
    [nominateBtn setImage:[UIImage imageNamed:@"Cate_nominate.png"] forState:UIControlStateNormal];
    [self addSubview:nominateBtn];
    
    // store
    x = w + (w-imageview_size_width)/2;
    UIButton *storeBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, imageview_size_width, imageview_size_width)];
    [storeBtn setImage:[UIImage imageNamed:@"Cate_store.png"] forState:UIControlStateNormal];
    [self addSubview:storeBtn];
    
    //
    x = 2*w + (w-imageview_size_width)/2;
    UIButton *giftBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, imageview_size_width, imageview_size_width)];
    [giftBtn setImage:[UIImage imageNamed:@"Cate_gift.png"] forState:UIControlStateNormal];
    [self addSubview:giftBtn];
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(0, frame.size.height-.5, self.frame.size.width, .5)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [self addSubview:lineImageView];
    
    return self;
}

@end

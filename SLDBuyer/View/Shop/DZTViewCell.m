//
//  DZTViewCell.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-19.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DZTViewCell.h"

#define indicator_size_width    9
#define indicator_size_height   12

@implementation DZTViewCell

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:string];
    float H = 100;
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(15, (H-.5)/2, self.contentView.frame.size.width-2*15, .5)];
    [lineImageView setImage:[UIImage imageNamed:@"Shop_xxLine.png"]];
    [self addSubview:lineImageView];

    float x = self.contentView.frame.size.width - 25;
    float y = (H/2-indicator_size_height)/2.;
    UIImageView *indicatorView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(x, y, indicator_size_width, indicator_size_height)];
    [indicatorView setImage:[UIImage imageNamed:@"Shop_arrow.png"]];
    [self.contentView addSubview:indicatorView];
    
    
    y = H/2+y;
    indicatorView = [[UIImageView alloc]initWithFrame:
                     CGRectMake(x, y, indicator_size_width, indicator_size_height)];
    [indicatorView setImage:[UIImage imageNamed:@"Shop_arrow.png"]];
    [self.contentView addSubview:indicatorView];
    
    return self;
}

@end

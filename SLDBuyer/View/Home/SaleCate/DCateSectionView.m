//
//  DCateSectionView.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DCateSectionView.h"
#import "DCate.h"
#import "UIImageView+WebCache.h"

#define left_magin 10
#define top_magin  8

#define label_font_size 15

@implementation DCateSectionView

- (id)initWithFrame:(CGRect)frame andDelegate:(id)delegate {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(left_magin, top_magin,
                                                              frame.size.height-2*top_magin, frame.size.height-2*top_magin)];
    [self addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc]init];
    [_titleLabel setFont:[UIFont fontWithName:@"Heiti SC" size:label_font_size]];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel setTextColor:[UIColor colorWithRed:82./255.0 green:160.0/255 blue:73.0/255. alpha:1.0]];
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.numberOfLines = 2;
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_titleLabel];
    
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(0, frame.size.height-.5, self.frame.size.width, .5)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [self addSubview:lineImageView];
    
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:delegate action:@selector(doTouchSecton:)];
    [doubleTap setNumberOfTapsRequired:1];
    [self addGestureRecognizer:doubleTap];
    
    
    return self;
}

- (void)doTouchSecton:(UITapGestureRecognizer*)gesture {}

- (void)setDataForView:(id)data andIndex:(int)index {
    DCate *cate = (DCate*)data;
    [_imageView setImageWithURL:[NSURL URLWithString:cate.cateImageUrl]];
    
    _titleLabel.text = cate.cateTitle;
    CGSize titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_titleLabel.font, NSFontAttributeName,nil];
    titleSize =[_titleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_titleLabel setFrame:CGRectMake(_imageView.frame.origin.x+_imageView.frame.size.width+20, (self.frame.size.height-titleSize.height)/2, titleSize.width, titleSize.height)];
    
    self.tag = index;
}

@end

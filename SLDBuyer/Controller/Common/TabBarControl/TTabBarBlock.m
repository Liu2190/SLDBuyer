//
//  TTabBarBlock.m
//  DBuyer
//
//  Created by Dbuyer mac1 on 14-5-8.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "TTabBarBlock.h"

#define labelFont_size  16

@implementation TTabBarBlock

- (id)initWithFrame:(CGRect)frame andItemName:(NSString*)itemName {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0]];
    
    CGRect rect  = CGRectMake(0, 0, frame.size.width, frame.size.height-1);
    _tabBarLabel = [[UILabel alloc]initWithFrame:rect];
    [_tabBarLabel setText:itemName];
    [_tabBarLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
    _tabBarLabel.textAlignment = NSTextAlignmentCenter;
    _tabBarLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_tabBarLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_tabBarLabel];
    
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_tabBarLabel.font, NSFontAttributeName,nil];
    titleSize =[_tabBarLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    [_tabBarLabel setFrame:CGRectMake((frame.size.width-titleSize.width)/2, (frame.size.height-titleSize.height)/2, titleSize.width, titleSize.height)];

    return self;
}


- (void)updateCompentByisSelect:(BOOL)isSelect {
    if (isSelect) {
        [_tabBarLabel setTextColor:_colorSelected];
    } else {
        [_tabBarLabel setTextColor:_colorDefault];
    }
}

@end

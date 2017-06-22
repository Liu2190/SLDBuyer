//
//  DHomeTabBarBlockView.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeTabBarBlockView.h"

#define image_size_width    20
#define image_size_height   20

#define labelFont_size      14

@implementation DHomeTabBarBlockView

- (id)initWithFrame:(CGRect)frame andDict:(NSDictionary*)dict {
    self = [super initWithFrame:frame];
    
    NSString *imageName = [dict objectForKey:@"image"];
    NSString *title = [dict objectForKey:@"title"];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [titleLabel setText:title];
    [titleLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setTextColor:[UIColor colorWithRed:82./255.0 green:160.0/255 blue:73.0/255. alpha:1.0]];
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:titleLabel];
    
    
    CGSize titleSize = CGSizeMake(frame.size.width, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:titleLabel.font, NSFontAttributeName,nil];
    titleSize =[titleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    
    UIImage *image = [UIImage imageNamed:imageName];
    float x = (frame.size.width - (2*image.size.width+10+titleSize.width))/2;
    float y = (frame.size.height - 2*image.size.height)/2;
    CGRect rect = CGRectMake(x, y, 2*image.size.width, 2*image.size.height);
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [imageView setFrame:rect];
    [self addSubview:imageView];
    
    rect = imageView.frame;
    rect.origin.x += 10 + imageView.frame.size.width;
    rect.origin.y = (frame.size.height-titleSize.height)/2;
    rect.size.width = titleSize.width;
    rect.size.height = titleSize.height;
    [titleLabel setFrame:rect];
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.tabBarDelegate doTabBarClicked:self.tag];
}

@end

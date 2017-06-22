//
//  DCateViewCell.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-9.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DCateViewCell.h"
#import "UIImageView+WebCache.h"
#import "DCate.h"

@implementation DCateViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.]];
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(80, [DCateViewCell heightForCell]-.5, self.frame.size.width, .5)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [self.contentView addSubview:lineImageView];
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return self;
}
- (void)setDataForCell:(id)data {
    DCate *cate = (DCate*)data;
    [self.imageView setImageWithURL:[NSURL URLWithString:cate.cateImageUrl]];
    self.textLabel.text = cate.cateTitle;
}

+ (float)heightForCell {
    return 50;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self.imageView setFrame:CGRectMake(40, 10, [DCateViewCell heightForCell]-2*10, [DCateViewCell heightForCell]-2*10)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    
    [self.textLabel setFont:[UIFont systemFontOfSize:14]];
    [self.textLabel setTextColor:[UIColor grayColor]];
}

@end

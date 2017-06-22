//
//  DDetailViewCell.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-5.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DDetailViewCell.h"

@implementation DDetailViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, [DDetailViewCell heightForCell])];
    [label setText:@"商品详情"];
    [self.contentView addSubview:label];
    
    return self;
}

+ (float)heightForCell {
    return 200;
}

@end

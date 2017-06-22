//
//  DDetailNiceCell.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-5.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DDetailNiceCell.h"

@implementation DDetailNiceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, [DDetailNiceCell heightForCell])];
    [label setText:@"猜你喜欢"];
    [self.contentView addSubview:label];
    
    return self;
}

+ (float)heightForCell {
    return 45;
}

@end

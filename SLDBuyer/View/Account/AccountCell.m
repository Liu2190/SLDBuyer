//
//  AccountCell.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AccountCell.h"

@implementation AccountCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellWithModel:(AccountModel *)model
{
    CGPoint center = self.iconImage.center;
    UIImage *pic = [UIImage imageNamed:model.cellImage];
    CGRect frame = CGRectMake(0, 0, pic.size.width, pic.size.height);
    self.iconImage.frame = frame;
    self.iconImage.center = center;
    self.titleLabel.text = model.cellName;
    self.iconImage.image = pic;
    self.directImage.hidden = !model.isHaveTriangle;
    self.bottomImage.hidden = YES;
    frame = self.topImage.frame;
    frame.origin.x = 60;
    frame.size.width = [UIScreen mainScreen].bounds.size.width - 60;
    self.topImage.frame = frame;
    if(model.isFirst == YES)
    {
        frame.origin.x = 0;
        frame.size.width = [UIScreen mainScreen].bounds.size.width;
        self.topImage.frame = frame;
    }
    if(model.isLast == YES)
    {
        
        self.bottomImage.hidden = NO;
    }
}
@end

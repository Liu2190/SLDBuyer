//
//  AccountLoginCell.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AccountLoginCell.h"

@implementation AccountLoginCell

- (void)awakeFromNib
{
    // Initialization code
    self.logOffButton.layer.cornerRadius = 5.0f;
    self.logOffButton.autoresizingMask = UIViewAutoresizingNone;
    self.tipLabel.autoresizingMask = UIViewAutoresizingNone;
}
-(void)setLogOffButtonStatusWith:(BOOL)status AndColor:(UIColor *)color
{
    self.logOffButton.userInteractionEnabled = status;
    self.logOffButton.backgroundColor = (status == YES?color:[UIColor lightGrayColor]);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

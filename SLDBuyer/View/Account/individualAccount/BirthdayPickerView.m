//
//  BirthdayPickerView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-5.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "BirthdayPickerView.h"

@implementation BirthdayPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)awakeFromNib
{
    self.confirmButton.layer.cornerRadius = 5.0f;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

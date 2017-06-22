//
//  AreaPickerView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AreaPickerView.h"

@implementation AreaPickerView

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

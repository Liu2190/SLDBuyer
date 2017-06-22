//
//  DefaultTitleView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-30.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DefaultTitleView.h"

@implementation DefaultTitleView

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
    self.selectedImage.hidden = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)setViewStatusWith:(BOOL)status
{
    self.areaNameLabel.textColor = (status == YES?[UIColor colorWithRed:54.0/255.0 green:123.0/255.0 blue:156.0/255.0 alpha:1]:[UIColor colorWithRed:107.0/255.0 green:107.0/255.0 blue:107.0/255.0 alpha:1]);
    self.selectedImage.hidden = !status;
}
@end

//
//  FeedBackGroundView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-27.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "FeedBackGroundView.h"

@implementation FeedBackGroundView

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
    //NSInteger len = [signatureText.text lengthOfBytesUsingEncoding:NSUTF8StringEncoding];//计算字符串长度
    self.OKButton.layer.cornerRadius = 4.0f;
}
-(void)checkButtonStatus:(NSString *)text
{
    if(text.length == 0)
    {
        self.OKButton.backgroundColor = [UIColor grayColor];
        self.OKButton.userInteractionEnabled = NO;
    }
    else
    {
        self.OKButton.backgroundColor = [UIColor colorWithRed:82.0/255.0 green:161.0/255.0 blue:73.0/255.0 alpha:1];
        self.OKButton.userInteractionEnabled = YES;
    }
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

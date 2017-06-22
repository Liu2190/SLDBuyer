//
//  TDbuyerTextView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-4.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "TDbuyerTextView.h"
@interface TDbuyerTextView()
@property (nonatomic,assign)CGRect originFrame;
@end
@implementation TDbuyerTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.originFrame = frame;
    }
    return self;
}
-(void)setPlaceholderWithString:(NSString *)placeholder
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(4, 7, self.originFrame.size.width, 30)];
    label.textColor = [UIColor lightGrayColor];
    label.backgroundColor = [UIColor redColor];
    label.text = self.placeholder;
    label.font = [UIFont systemFontOfSize:self.placeholder_size];
    [self addSubview:label];
    
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

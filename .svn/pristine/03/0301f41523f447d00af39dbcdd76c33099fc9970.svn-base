//
//  DefaultMarketSectionView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-5.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DefaultMarketSectionView.h"
#import "DefaultTitleView.h"
@interface DefaultMarketSectionView()
{
    int _count;
}

@end
@implementation DefaultMarketSectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initDefaultMarketSectionViewWith:(NSArray *)areaArray
{
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0);
    _count = areaArray.count;
    if(areaArray.count>=1)
    {
        frame.size.height = ((areaArray.count-1)/4+1)*55 +10;
    }
    self = [super initWithFrame:frame];
    self.userInteractionEnabled = YES;
    if(self)
    {
        UIView *backGound = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, frame.size.height-10)];
        backGound.backgroundColor = [UIColor whiteColor];
        backGound.userInteractionEnabled = YES;
        [self addSubview:backGound];
        for(int i = 0;i < areaArray.count;i++)
        {
            DefaultTitleView *areaView = [[[NSBundle mainBundle]loadNibNamed:@"DefaultTitleView" owner:self options:nil]lastObject];
            areaView.frame = CGRectMake((i%4)*80, (i/4)*55, 80, 55);
            areaView.userInteractionEnabled = YES;
            [areaView setViewStatusWith:(i==0?YES:NO)];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 80, 55);
            [areaView addSubview:button];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 10+i;
            [backGound addSubview:areaView];
        }
    }
    self.backgroundColor = [UIColor clearColor];
    return self;
}
-(void)buttonClick:(UIButton *)button
{
    NSInteger index = (NSInteger )button.tag;
    
    for(int i =0;i<_count;i++)
    {
        UIButton *but = (UIButton *)[self viewWithTag:i+10];
        if([but isKindOfClass:[UIButton class]])
        {
            DefaultTitleView *view = (DefaultTitleView *)but.superview;
            if([view isKindOfClass:[DefaultTitleView class]])
            {
                [view setViewStatusWith:((i+10) == index?YES:NO)];
            }
        }
    }
    [self.delegate defaultMarketDidSelectArea:(index-10)];
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

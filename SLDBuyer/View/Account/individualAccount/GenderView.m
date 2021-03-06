//
//  GenderView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-5.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "GenderView.h"
#import "GenderSelectView.h"
@interface GenderView()
@property (nonatomic,retain)GenderSelectView *selectView;
@end
@implementation GenderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedCancel)];
        [self addGestureRecognizer:tap];
        [self creatButtons];
    }
    return self;
}

- (void)showInView:(UIView *)view
{
    [[[UIApplication sharedApplication]keyWindow]addSubview:self];
}
-(void)creatButtons
{
    self.selectView = [[[NSBundle mainBundle]loadNibNamed:@"GenderSelectView" owner:self options:nil]lastObject];
    [self.selectView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
    self.selectView.userInteractionEnabled = YES ;
    [self addSubview:self.selectView];
    [self.selectView.cancelButton addTarget:self action:@selector(tappedCancel) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView.mButton addTarget:self action:@selector(MbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView.fButton addTarget:self action:@selector(FbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:0.25 animations:^{
        [self.selectView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-144, [UIScreen mainScreen].bounds.size.width, 187)];
    } completion:^(BOOL finished) {
    }];
}
-(void)MbuttonClick
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.selectView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
    [self.delegate selectGenderWithButtonIndex:0];//选择男性
}
-(void)FbuttonClick
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.selectView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
    [self.delegate selectGenderWithButtonIndex:1];//选择女性
}
-(void)tappedCancel
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.selectView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
    [self.delegate selectGenderWithButtonIndex:2];
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

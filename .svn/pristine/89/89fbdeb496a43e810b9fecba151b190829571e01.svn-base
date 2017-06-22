//
//  XDAlertView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-9.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "XDAlertView.h"
#import "XDView.h"
@interface XDAlertView ()
{
    id _delegate;
    NSMutableArray *_buttonArray;
}
@property (nonatomic,retain)XDView *alertView;
@end
@implementation XDAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...
{
    self = [super init];
    if(self)
    {
        _delegate = delegate;
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        self.userInteractionEnabled = YES;
        _buttonArray = [[NSMutableArray alloc] init];
        [_buttonArray addObject:cancelButtonTitle];
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *str = otherButtonTitles; str != nil; str = va_arg(args,NSString*)) {
            [_buttonArray addObject:str];
        }
        va_end(args);
        self.alertView = [[[NSBundle mainBundle]loadNibNamed:@"XDView" owner:self options:nil]lastObject];
        float height = [self.alertView heightOfViewValuesWithTitle:title AndContent:message AndButtonArray:_buttonArray];
        self.alertView.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height-height)/2, 320, height);
        self.alertView.userInteractionEnabled = YES;
        [self addSubview:self.alertView];
        [self makeButtonAction];
    }
    return self;
}
-(void)makeButtonAction
{
    [self.alertView.confirmButton addTarget:self action:@selector(firstButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertView.cancelButton addTarget:self action:@selector(secondButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertView.thirdButton addTarget:self action:@selector(thirdButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)firstButtonDidClick:(UIButton *)button
{
    [self dismiss];
    if(_delegate !=nil)
    {
        [_delegate xdAlertViewClickedButtonAtIndex:0];
    }
    else{
        
    }
}
-(void)secondButtonDidClick:(UIButton *)button
{
    [self dismiss];
    if(_delegate !=nil)
    {
        [_delegate xdAlertViewClickedButtonAtIndex:1];
    }
    else{
    }
}
-(void)thirdButtonDidClick:(UIButton *)button
{
    [self dismiss];
    if(_delegate !=nil)
    {
        [_delegate xdAlertViewClickedButtonAtIndex:2];
    }
    else{
        
    }
}
-(void)show
{
    [[[UIApplication sharedApplication]keyWindow]addSubview:self];
    self.alertView.alpha = 0;
    self.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.alertView.alpha = 1.;
                         self.alertView.transform = CGAffineTransformMakeScale(1.0,1.0);
                     }
                     completion:^(BOOL finished) {
                     }];
}
-(void)dismiss
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.alertView.alpha = 0;
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
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

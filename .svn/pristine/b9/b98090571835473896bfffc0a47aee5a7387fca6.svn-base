//
//  CommonTextField.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-11.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "CommonTextField.h"

@implementation CommonTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)checkTextFieldWithStatus:(TextFieldStatus)status AndTipsLabel:(NSString *)tips
{
    if(status == Status_Default)
    {
        [self.tipImage setImage:[UIImage imageNamed:@""]];
        [UIView animateWithDuration:0.5 animations:^{
            [UIView animateWithDuration:0.5 animations:^{
                [self.tipsLabel setFrame:CGRectMake(-200, 0, self.tipsLabel.frame.size.width, self.tipsLabel.frame.size.height)];
            }completion:^(BOOL finished){
                [self.tipsLabel setFrame:CGRectMake(0, 0, 0, 0)];
            }];
        }completion:^(BOOL finished){
            
        }];
    }
    if(status == Status_NO)
    {
        [self.tipImage setImage:[UIImage imageNamed:@"Login_validation_no"]];
        self.tipsLabel.text = tips;
        CGRect frame = CGRectMake(20, 0, 280, 10);
        [UIView animateWithDuration:0.5 animations:^{
            [self.tipsLabel setFrame:frame];
        }completion:^(BOOL finished){
            
        }];
    }
    if(status == Status_YES)
    {
        
        if(tips.length==0)
        {
            [self.tipImage setImage:[UIImage imageNamed:@"Login_validation_yes"]];
            [UIView animateWithDuration:0.5 animations:^{
                [self.tipsLabel setFrame:CGRectMake(-200, 0, self.tipsLabel.frame.size.width, self.tipsLabel.frame.size.height)];
            }completion:^(BOOL finished){
                [self.tipsLabel setFrame:CGRectMake(0, 0, 0, 0)];
            }];
        }
        else
        {
            self.tipsLabel.text = tips;
            [self.tipImage setImage:[UIImage imageNamed:@"Login_validation_yes"]];
            [UIView animateWithDuration:0.5 animations:^{
                [self.tipsLabel setFrame:CGRectMake(-200, 0, self.tipsLabel.frame.size.width, self.tipsLabel.frame.size.height)];
            }completion:^(BOOL finished){
                [self.tipsLabel setFrame:CGRectMake(0, 0, 0, 0)];
            }];
        }
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

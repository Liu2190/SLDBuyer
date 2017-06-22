//
//  CreateAddressView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-30.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "CreateAddressView.h"
#define easyToRemember_placeholder @"设置一个易记的名字，如“家”，“公司地址”"
#define name_placeholder @"收货人姓名"
#define phone_placeholder @"手机号"
#define address_placeholder @"详细地址"
@interface CreateAddressView ()
{
    BOOL tipsStatus;
    BOOL nameStatus;
    BOOL phoneStatus;
    BOOL detailAddressStatus;
    AddressListModel *model;
}
@end
@implementation CreateAddressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        tipsStatus = YES;
        nameStatus = NO;
        phoneStatus = NO;
        detailAddressStatus = NO;
        model = [[AddressListModel alloc]init];
    }
    return self;
}

-(void)awakeFromNib
{
    self.tipsField = [[[NSBundle mainBundle]loadNibNamed:@"CommonTextField" owner:self options:nil]lastObject];
    self.tipsField.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    self.tipsField.cTextField.placeholder = easyToRemember_placeholder;
    [self.tipBack addSubview:self.tipsField];
    self.nameField = [[[NSBundle mainBundle]loadNibNamed:@"CommonTextField" owner:self options:nil]lastObject];
    self.nameField.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    self.nameField.cTextField.placeholder = name_placeholder;
    [self.nameBack addSubview:self.nameField];
    self.phoneField = [[[NSBundle mainBundle]loadNibNamed:@"CommonTextField" owner:self options:nil]lastObject];
    self.phoneField.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    self.phoneField.cTextField.placeholder = phone_placeholder;
    [self.phoneBack addSubview:self.phoneField];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setDelegate:(id)delegate
{
    self.tipsField.cTextField.delegate = delegate;
    self.nameField.cTextField.delegate = delegate;
    self.phoneField.cTextField.delegate = delegate;
    self.detailAddressTextView.delegate = delegate;
}
- (BOOL)updateByTextView:(UITextView *)textView
{
    
    BOOL isValida = YES;
        if (textView.text.length == 0) {
            self.textViewPlaceHolder.hidden = NO;
            [self checkTextViewWithStatus:Status_NO AndTipsLabel:@"详细地址不能为空"];
            isValida = NO;
        } else {
            self.textViewPlaceHolder.hidden = YES;
            [self checkTextViewWithStatus:Status_YES AndTipsLabel:@""];
            isValida = YES;
        }
    detailAddressStatus = isValida;
    model.addressName = textView.text;
    [self.delegate AllStatus:((detailAddressStatus && nameStatus) && phoneStatus &&tipsStatus ) AndData:model];
    return isValida;
}
- (BOOL)updateByTextField:(UITextField*)field {
    BOOL isValida = YES;
    if([field.placeholder isEqualToString:easyToRemember_placeholder])
    {
        if([field.text length] == 0)
        {
            [self.tipsField checkTextFieldWithStatus:Status_Default AndTipsLabel:@""];
            tipsStatus = YES;
        }
        else if([field.text length]<=20 )
        {
            [self.tipsField checkTextFieldWithStatus:Status_YES AndTipsLabel:@""];
            tipsStatus = YES;
        }
        else
        {
            [self.tipsField checkTextFieldWithStatus:Status_NO AndTipsLabel:@"地址名称最多20字"];
            tipsStatus = NO;
        }
        model.tips = field.text;
    }
    if([field.placeholder isEqualToString:phone_placeholder]) {
        if (field.text.length == 0) {
            [self.phoneField checkTextFieldWithStatus:Status_NO AndTipsLabel:@"手机号不能为空"];
            isValida = NO;
        } else if(field.text.length < 11) {
            [self.phoneField checkTextFieldWithStatus:Status_NO AndTipsLabel:@"请准确填写11位手机号码"];
            isValida = NO;
        } else if(field.text.length > 11) {
            [self.phoneField checkTextFieldWithStatus:Status_NO AndTipsLabel:@"请准确填写11位手机号码"];
            isValida = NO;
        } else if (field.text.length == 11 && [field.text isMatchedByRegex:PhoneRegex]==NO) {
            [self.phoneField checkTextFieldWithStatus:Status_NO AndTipsLabel:@"请准确填写11位手机号码"];
            isValida = NO;
        } else if([field.text isMatchedByRegex:PhoneRegex]==YES){
            [self.phoneField checkTextFieldWithStatus:Status_YES AndTipsLabel:@""];
        } else {
            [self.phoneField checkTextFieldWithStatus:Status_Default AndTipsLabel:@""];
            isValida = NO;
        }
        phoneStatus = isValida;
        model.phoneNum = field.text;
    }
    
    if([field.placeholder isEqualToString:name_placeholder]) {
        if (field.text.length == 0) {
            [self.nameField checkTextFieldWithStatus:Status_NO AndTipsLabel:@"收货人姓名不能为空"];
            isValida = NO;
        }else if (field.text.length >20)
        {
            [self.nameField checkTextFieldWithStatus:Status_NO AndTipsLabel:@"收货人姓名最多20字"];
            isValida = NO;
        }
        else {
            [self.nameField checkTextFieldWithStatus:Status_YES AndTipsLabel:@""];
            isValida = YES;
        }
        nameStatus = isValida;
        model.userName = field.text;
    }
    [self.delegate AllStatus:((detailAddressStatus && nameStatus) && phoneStatus && tipsStatus) AndData:model];
    return isValida;
}
-(void)cancelKeyboard
{
    [self.tipsField.cTextField resignFirstResponder];
    [self.nameField.cTextField resignFirstResponder];
    [self.phoneField.cTextField resignFirstResponder];
    [self.detailAddressTextView resignFirstResponder];
}
-(void)checkTextViewWithStatus:(TextFieldStatus)status AndTipsLabel:(NSString *)tips
{
    if(status == Status_Default)
    {
        [self.textViewTipImage setImage:[UIImage imageNamed:@""]];
        [UIView animateWithDuration:0.5 animations:^{
            [UIView animateWithDuration:0.5 animations:^{
                [self.textViewTipLabel setFrame:CGRectMake(-200, 185, self.textViewTipLabel.frame.size.width, self.textViewTipLabel.frame.size.height)];
            }completion:^(BOOL finished){
                [self.textViewTipLabel setFrame:CGRectMake(0, 185, 0, 0)];
            }];
        }completion:^(BOOL finished){
            
        }];
    }
    if(status == Status_NO)
    {
        [self.textViewTipImage setImage:[UIImage imageNamed:@"Login_validation_no"]];
        self.textViewTipLabel.text = tips;
        CGRect frame = CGRectMake(20, 185, 280, 10);
        [UIView animateWithDuration:0.5 animations:^{
            [self.textViewTipLabel setFrame:frame];
        }completion:^(BOOL finished){
            
        }];
    }
    if(status == Status_YES)
    {
        if(tips.length==0)
        {
            [self.textViewTipImage setImage:[UIImage imageNamed:@"Login_validation_yes"]];
            [UIView animateWithDuration:0.5 animations:^{
                [self.textViewTipLabel setFrame:CGRectMake(-200, 185, self.textViewTipLabel.frame.size.width, self.textViewTipLabel.frame.size.height)];
            }completion:^(BOOL finished){
                [self.textViewTipLabel setFrame:CGRectMake(0, 185, 0, 0)];
            }];
        }
        else
        {
            self.textViewTipLabel.text = tips;
            [self.textViewTipImage setImage:[UIImage imageNamed:@"Login_validation_yes"]];
            [UIView animateWithDuration:0.5 animations:^{
                [self.textViewTipLabel setFrame:CGRectMake(-200, 185, self.textViewTipLabel.frame.size.width, self.textViewTipLabel.frame.size.height)];
            }completion:^(BOOL finished){
                [self.textViewTipLabel setFrame:CGRectMake(0, 185, 0, 0)];
            }];
        }
    }
}
- (void)setViewValueWith:(AddressListModel *)thisModel
{
    self.tipsField.cTextField.text = [NSString stringWithFormat:@"送到%@",thisModel.tips];
    self.areaLabel.text = thisModel.areaName;
    self.detailAddressTextView.text = thisModel.addressName;
    self.phoneField.cTextField.text = thisModel.phoneNum;
    self.nameField.cTextField.text = thisModel.userName;
}
@end

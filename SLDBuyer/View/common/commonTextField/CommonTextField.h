//
//  CommonTextField.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-11.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    Status_Default,
    Status_NO,
    Status_YES,
} TextFieldStatus;
@interface CommonTextField : UIView<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *cTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tipImage;
-(void)checkTextFieldWithStatus:(TextFieldStatus)status AndTipsLabel:(NSString *)tips;
@end

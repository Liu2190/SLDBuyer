//
//  TDbuyerTextField.m
//  DBuyer
//
//  Created by dilei liu on 14-3-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "TDbuyerTextField.h"

@implementation TDbuyerTextField

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    _placeholder_size = 15;
    _isCenter = NO;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return self;
}

- (void)drawPlaceholderInRect:(CGRect)rect {
    [[UIColor colorWithRed:176./255.0 green:176./255.0 blue:176./255.0 alpha:.5] setFill];
    rect.origin.y = 2;
    
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:_placeholder_size], NSFontAttributeName,nil];
    titleSize =[[self placeholder] boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    if (_isCenter)
    rect.origin.x = (rect.size.width-titleSize.width)/2;
    

    tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:_placeholder_size], NSFontAttributeName,nil];
    [[self placeholder]drawInRect:rect withAttributes:tdic];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([textField.text length] > 10) {
        textField.text = [textField.text substringToIndex:10-1];
        return NO;
    }
    return YES;
}



@end

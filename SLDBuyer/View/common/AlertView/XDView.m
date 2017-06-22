//
//  XDView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-9.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "XDView.h"

@implementation XDView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)awakeFromNib
{
    self.backView.layer.cornerRadius = 4.0f;
    self.confirmButton.layer.cornerRadius = 4.0f;
    self.cancelButton.layer.cornerRadius = 4.0f;
    self.thirdButton.layer.cornerRadius = 4.0f;
}
-(float )heightOfViewValuesWithTitle:(NSString *)title AndContent:(NSString *)content AndButtonArray:( NSMutableArray *)buttons
{
    self.userInteractionEnabled = YES;
    self.confirmButton.autoresizingMask = UIViewAutoresizingNone;
    self.cancelButton.autoresizingMask = UIViewAutoresizingNone;
    self.confirmLabel.autoresizingMask = UIViewAutoresizingNone;
    self.cancelLabel.autoresizingMask = UIViewAutoresizingNone;
    self.thirdButton.autoresizingMask = UIViewAutoresizingNone;
    self.thirdLabel.autoresizingMask = UIViewAutoresizingNone;
    self.autoresizingMask = UIViewAutoresizingNone;
    self.backView.autoresizingMask = UIViewAutoresizingNone;
    self.titleLabel.text = title;
    self.messageLabel.text = content;
    self.confirmLabel.text = [buttons firstObject];
    UIFont *font = self.messageLabel.font;
    CGSize size = CGSizeMake(300, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size =[content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    float ch = size.height;
    CGRect frame = self.messageLabel.frame;
    float dif = ch - frame.size.height ;
    frame.size.height = ch;
    self.messageLabel.frame = frame;
    
    frame = self.confirmLabel.frame;
    frame.origin.y = frame.origin.y +dif;
    self.confirmLabel.frame = frame;
    
    frame = self.confirmButton.frame;
    frame.origin.y = frame.origin.y +dif;
    self.confirmButton.frame = frame;
    
    frame = self.cancelButton.frame;
    frame.origin.y = frame.origin.y +dif;
    self.cancelButton.frame = frame;
    
    frame = self.cancelLabel.frame;
    frame.origin.y = frame.origin.y +dif;
    self.cancelLabel.frame = frame;
    
    frame = self.thirdButton.frame;
    frame.origin.y = frame.origin.y + dif ;
    self.thirdButton.frame = frame;
    
    frame = self.thirdLabel.frame;
    frame.origin.y = frame.origin.y +dif ;
    self.thirdLabel.frame = frame;
    
    if (buttons.count == 1)
    {
        self.cancelLabel.hidden = YES;
        self.cancelButton.hidden = YES;
        self.thirdLabel.hidden = YES;
        self.thirdButton.hidden = YES;
        frame = self.backView.frame;
        frame.size.height = frame.size.height +dif-55-55;
        self.backView.frame = frame;
        return 260 + dif-55;
    }
    if (buttons.count == 2)
    {
        self.thirdButton.hidden = YES;
        self.thirdLabel.hidden = YES;
        self.cancelLabel.text = [buttons lastObject];
        frame = self.backView.frame;
        frame.size.height = frame.size.height +dif-55;
        self.backView.frame = frame;
        return 260 + dif;
    }
    if (buttons.count == 3)
    {
        self.thirdLabel.text = [buttons lastObject];
        self.cancelLabel.text = [buttons objectAtIndex:1];
        frame = self.backView.frame;
        frame.size.height = frame.size.height +dif;
        self.backView.frame = frame;
        return 315 + dif;
    }
    return 0;
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

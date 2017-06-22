//
//  XDAlertView.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-9.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XDAlertViewDelegate
- (void)xdAlertViewClickedButtonAtIndex:(NSInteger)buttonIndex;
@end
@interface XDAlertView : UIView

-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;//otherButton最多有两个
-(void)show;

@end

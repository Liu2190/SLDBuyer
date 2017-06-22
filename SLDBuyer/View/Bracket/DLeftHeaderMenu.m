//
//  DLeftMenuLogin.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DLeftHeaderMenu.h"
#import "DLoginUser.h"

#define login_btn_width     60
#define login_btn_height    40

@implementation DLeftHeaderMenu

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if ([[DUtilities sharedInstance]hadLogin]) [self hadLoginFace];
    else [self unLoginFace];

    return self;
}

- (void)unLoginFace {
    UIImageView *lineView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [lineView setFrame:CGRectMake((self.frame.size.width-.5)/2, 8, .5, self.frame.size.height-2*8)];
    [self addSubview:lineView];
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.frame.size.width/2-login_btn_width)/2, (self.frame.size.height-login_btn_height)/2, login_btn_width, login_btn_height)];
    [loginBtn setImage:[UIImage imageNamed:@"Bracket_Login.png"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(doLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:loginBtn];
    
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2+(self.frame.size.width/2-login_btn_width)/2, (self.frame.size.height-login_btn_height)/2, login_btn_width, login_btn_height)];
    [registerBtn setImage:[UIImage imageNamed:@"Bracket_register.png"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(doRegisterAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:registerBtn];
}

- (void)hadLoginFace {
    UIImageView *faceImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Bracket_FaceBook.png"]];
    [faceImageView setFrame:CGRectMake(10, 0, self.frame.size.height, self.frame.size.height)];
    [self addSubview:faceImageView];
    
    UILabel *accountLabel = [[UILabel alloc]init];
    accountLabel.font = [UIFont systemFontOfSize:16];
    [accountLabel setBackgroundColor:[UIColor clearColor]];
    [accountLabel setTextColor:[UIColor grayColor]];
    [self addSubview:accountLabel];
    
    DLoginUser *loginUser = [[DUtilities sharedInstance]getLoginUser];
    NSString *account = [loginUser.account stringByReplacingCharactersInRange:NSMakeRange (3, 4) withString:@"****"];
    accountLabel.text = account;
    CGSize maximumLabelSize = CGSizeMake(200, 999);
    CGSize titleSize = [accountLabel.text sizeWithFont:accountLabel.font constrainedToSize:maximumLabelSize lineBreakMode:NSLineBreakByWordWrapping];
    [accountLabel setFrame:CGRectMake(faceImageView.frame.origin.x+faceImageView.frame.size.width+10, (self.frame.size.height-titleSize.height)/2, titleSize.width, titleSize.height)];
    
}

- (void)doLoginAction {
    [self.leftMenuDelegate doOpenLoginController];
}

- (void)doRegisterAction {
    [self.leftMenuDelegate doOpenRegisterController];
}

@end

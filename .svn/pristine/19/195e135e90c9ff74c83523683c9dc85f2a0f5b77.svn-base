//
//  DRegisterViewController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DRegisterViewController.h"

@implementation DRegisterViewController

- (id)init {
    self = [super init];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    root.title = @"注册";
    self.root = root;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    QSection *loginSection = [[QSection alloc]init];
    [self.root addSection:loginSection];
    
    QEntryElement *accountElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"手机号"];
    [loginSection addElement:accountElement];
    
    QEntryElement *passwordElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"密码"];
    [loginSection addElement:passwordElement];
    
    QEntryElement *repasswordElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"确认密码"];
    [loginSection addElement:repasswordElement];
    
    QEntryElement *validataElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"验证码"];
    [loginSection addElement:validataElement];
    
    //
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    
    QButtonElement *loginBtnElement = [[QButtonElement alloc]initWithTitle:@"注册"];
    loginBtnElement.appearance.buttonAlignment = NSTextAlignmentCenter;
    loginBtnElement.appearance.actionColorEnabled = [UIColor colorWithRed:23./255 green:109./255 blue:250./255. alpha:1.];
    [actionSection addElement:loginBtnElement];
}


@end

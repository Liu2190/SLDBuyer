//
//  DLoginViewController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DLoginViewController.h"
#import "TUserCenterServer.h"
#import "DMainRootContrller.h"
#import "DLoginUser.h"

@implementation DLoginViewController

- (id)init {
    self = [super init];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    root.title = @"登录";
    self.root = root;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    QSection *loginSection = [[QSection alloc]init];
    [self.root addSection:loginSection];
    
    QEntryElement *accountElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"手机号"];
    [accountElement setKey:@"AccountElement"];
    accountElement.keyboardType = UIKeyboardTypePhonePad;
    [loginSection addElement:accountElement];
    
    QEntryElement *passwordElement = [[QEntryElement alloc]initWithTitle:@"" Value:@"" Placeholder:@"密码"];
    [passwordElement setKey:@"PasswordElement"];
    [passwordElement setSecureTextEntry:YES];
    [loginSection addElement:passwordElement];
    
    //
    QSection *actionSection = [[QSection alloc]init];
    [self.root addSection:actionSection];
    
    QButtonElement *loginBtnElement = [[QButtonElement alloc]initWithTitle:@"登录"];
    [loginBtnElement setKey:@"LoginBtnElement"];
    loginBtnElement.appearance.buttonAlignment = NSTextAlignmentCenter;
    [loginBtnElement setControllerAction:@"doLoginAction"];
    loginBtnElement.appearance.actionColorEnabled = [UIColor colorWithRed:23./255 green:109./255 blue:250./255. alpha:1.];
    [actionSection addElement:loginBtnElement];
    

    
}

- (void)showMessage:(NSString*)error {
    QSection *section = [self.root.sections firstObject];
    section.footer = error;
    self.root.appearance.sectionFooterColor = [UIColor redColor];
    [self.quickDialogTableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                                            withRowAnimation:UITableViewRowAnimationFade];
}

- (void)doLoginAction {
    QEntryElement *accountElement = (QEntryElement*)[self.root elementWithKey:@"AccountElement"];
    NSString *accountValue = accountElement.textValue;
    if (accountValue.length == 0) {
        [self showMessage:@"账号不能为空"]; return;
    } else if ([accountValue isMatchedByRegex:PhoneRegex]==NO) {
        [self showMessage:@"输入的账号格式不符"]; return;
    }
    
    
    QEntryElement *passwordElement = (QEntryElement*)[self.root elementWithKey:@"PasswordElement"];
    NSString *passwordValue = passwordElement.textValue;
    if (passwordValue.length == 0) {
        [self showMessage:@"密码不能为空"]; return;
    } else if (passwordValue.length < 6) {
        [self showMessage:@"密码长度不能小于六位"]; return;
    }
    
    QButtonElement *loginBtnElement = (QButtonElement*)[self.root elementWithKey:@"LoginBtnElement"];
    [loginBtnElement startLoadingAnimation];
    [[TServerFactory getServerInstance:@"TUserCenterServer"]doLoginByUserName:accountValue andPassword:passwordValue
                                                                  andCallback:^(DLoginUser*loginUser) {
                                                                      [loginBtnElement stopLoadingAnimation];
                                                                      [[DUtilities sharedInstance]popMessage:@"登录功能" target:self completion:^(BOOL isFinish) {
                                                                          loginUser.account = accountValue;
                                                                          loginUser.password = passwordValue;
                                                                          loginUser.loginDate = [NSDate date];
                                                                          loginUser.hadLogin = 1; // 登录标志
                                                                          [self storeLoginInfo:loginUser];
                                                                          
                                                                          [[DMainRootContrller sharedManager]doHandlerLogining];
                                                                          [self leftButtonAction];
                                                                      }];
                                                                      
                                                                  } failureCallback:^(NSString *resp) {
                                                                      [loginBtnElement stopLoadingAnimation];
                                                                      [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
                                                                          
                                                                      }];
                                                                  }];
}

- (void)storeLoginInfo:(DLoginUser*)loginUser {
    [[TServerFactory getServerInstance:@"TUserCenterServer"]loginByLoginUser:loginUser];
}

@end

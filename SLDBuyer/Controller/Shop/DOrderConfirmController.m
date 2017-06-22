//
//  DOrderConfirmController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-13.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DOrderConfirmController.h"
#import "DMainRootContrller.h"
#import "UIButton+Extensions.h"
#import "DSettlementViewController.h"

@implementation DOrderConfirmController


- (id)init {
    self = [super init];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    root.title = @"确认订单";
    self.root = root;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    QSection *baseOrderSection = [[QSection alloc]init];
    [self.root addSection:baseOrderSection];
    
    QLabelElement *orderAccountElement = [[QLabelElement alloc]initWithTitle:@"订单号" Value:@"1112334412"];
    [orderAccountElement setKey:@"OrderAccountElement"];
    [baseOrderSection addElement:orderAccountElement];
    
    QLabelElement *orderAmtElement = [[QLabelElement alloc]initWithTitle:@"订单金额" Value:@"￥120.00"];
    [orderAmtElement setKey:@"OrderAmtElement"];
    [baseOrderSection addElement:orderAmtElement];
    
    QLabelElement *giveIntegralElement = [[QLabelElement alloc]initWithTitle:@"赠送积分" Value:@"120"];
    [giveIntegralElement setKey:@"GiveIntegralElement"];
    [baseOrderSection addElement:giveIntegralElement];
    
    //
    QSection *payWaySection = [[QRadioSection alloc]initWithItems:[NSArray arrayWithObjects:@"银联支付", @"快钱支付", @"电子预付卡支付", nil] selected:0 title:@"支付方式"];
    [payWaySection setKey:@"PayWaySection"];
    self.root.appearance.sectionFooterColor = [UIColor grayColor];
    payWaySection.footer = @"请在两小时内完成支付,超出时间订单将被自动取消";
    [self.root addSection:payWaySection];
    
    //
    QSection *payActionSection = [[QSection alloc]init];
    [self.root addSection:payActionSection];
    
    QButtonElement *payBtnElement = [[QButtonElement alloc]initWithTitle:@"确认支付"];
    [payBtnElement setKey:@"PayBtnElement"];
    payBtnElement.appearance.buttonAlignment = NSTextAlignmentCenter;
    [payBtnElement setControllerAction:@"doPayAction"];
    payBtnElement.appearance.actionColorEnabled = [UIColor colorWithRed:23./255 green:109./255 blue:250./255. alpha:1.];
    [payActionSection addElement:payBtnElement];
}

- (void)doPayAction {

}


- (void)setDefaultNavigationStyle {
    UIImage * imageNormal = [UIImage imageNamed:@"Nav_Back_Green.png"];
    
    // create your button
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    [button addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:imageNormal forState:UIControlStateNormal];
    
    // set the frame of the button (better to grab actual offset of leftbarbuttonitem instead of magic numbers)
    button.frame = CGRectMake(0.0, 0.0, 3*imageNormal.size.width/5, 3*imageNormal.size.height/5);
    [button setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -30)];
    // set the barbuttonitem to be the view
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem= barButtonItem;
    
    
    UIColor *navBgColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    
    [self.navigationController.navigationBar setBarTintColor:navBgColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"确认订单";
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:114./255.0 green:178.0/255 blue:110/255. alpha:1.0];
    self.navigationItem.titleView = label;
    [label sizeToFit];
}

- (void)leftButtonAction {
    [self.navigationController popViewControllerAnimated:YES];
}


@end

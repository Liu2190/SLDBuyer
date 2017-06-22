//
//  AskForRefundCell.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AskForRefundCell.h"
#define CONTACTTELEPHONE @"010-64322705"
@implementation AskForRefundCell

- (void)awakeFromNib
{
    // Initialization code
    [self.callButton addTarget:self action:@selector(callAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)callAction
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow ;
    UIWebView*callWebview =[[UIWebView alloc] init];
    NSURL *telURL =[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",CONTACTTELEPHONE]];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [keyWindow addSubview:callWebview];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  AddressListModel.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-10.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AddressListModel.h"

@implementation AddressListModel

-(id)init
{
    self = [super init];
    _addressID = [[NSString alloc]init];
    _userName = [[NSString alloc]init];
    _addressName = [[NSString alloc]init];
    _phoneNum = [[NSString alloc]init];
    _tips = [[NSString alloc]init];
    _isDefault = NO;
    _areaID = [[NSString alloc]init];
    _areaName = [[NSString alloc]init];
    return self;
}
@end

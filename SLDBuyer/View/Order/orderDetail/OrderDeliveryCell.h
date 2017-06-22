//
//  OrderDeliveryCell.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-17.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDeliveryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *marketNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *marketAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;

@end

//
//  OrderPayCell.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-17.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderPayCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *commodityPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *freightLabel;
@property (weak, nonatomic) IBOutlet UILabel *decreaseLabel;

@end

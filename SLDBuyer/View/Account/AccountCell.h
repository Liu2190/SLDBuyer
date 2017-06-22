//
//  AccountCell.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountModel.h"
@interface AccountCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *directImage;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImage;
@property (weak, nonatomic) IBOutlet UIImageView *topImage;
-(void)setCellWithModel:(AccountModel *)model;
@end

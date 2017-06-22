//
//  AboutMeFirstCell.h
//  DBuyer
//
//  Created by liuxiaodan on 14-4-18.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutMeFirstCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *currentVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailAddressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backView;
-(void)setFirstCellWithTelephoneNum:(NSString *)TelephoneNum AndArea:(NSString *)areaString AndDetailAddress:(NSString *)detailAddress;
@end

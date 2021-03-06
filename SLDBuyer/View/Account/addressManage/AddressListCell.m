//
//  AddressListCell.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AddressListCell.h"

@implementation AddressListCell

- (void)awakeFromNib
{
    // Initialization code
    CGPoint center = self.editImage.center;
    UIImage *pic = [UIImage imageNamed:@"accountList_edit"];
    CGRect frame = CGRectMake(0, 0, pic.size.width, pic.size.height);
    self.editImage.frame = frame;
    self.editImage.center = center;
    self.editImage.image = pic;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellValueWith:(AddressListModel *)model
{
    self.defaultLabel.hidden = !model.isDefault;
    self.nameLabel.text = model.userName;
    self.phoneLabel.text = model.phoneNum;
    self.addressDetailLabel.text = model.addressName;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    if ([super isEditing]) {
        //编辑时的需要的frame
        
        self.defaultLabel.frame = CGRectMake(239-30, 36, 81, 21);
        CGPoint center = self.editImage.center;
        center.x = center.x-30;
        self.editImage.center = center;
    }else {
        //取消编辑时的需要的frame
        self.defaultLabel.frame = CGRectMake(239, 36, 81, 21);
        CGPoint center = self.editImage.center;
        center.x = center.x;
        self.editImage.center = center;
    }
}
@end

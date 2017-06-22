//
//  SaveAndDeleteCell.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-12.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "SaveAndDeleteCell.h"

@implementation SaveAndDeleteCell

- (void)awakeFromNib
{
    // Initialization code
    self.saveButton.layer.cornerRadius = 5.0f;
    self.deleteButton.layer.cornerRadius = 5.0f;
}
-(void)setSaveButtonStatusWith:(BOOL)status
{
    self.saveButton.userInteractionEnabled = !status;
    self.saveButton.backgroundColor = (status== YES?[UIColor redColor]:[UIColor grayColor]);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

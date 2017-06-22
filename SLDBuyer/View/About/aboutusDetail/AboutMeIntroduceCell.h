//
//  AboutMeIntroduceCell.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutMeIntroduceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentWhiteView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
-(void)setCellWithTitle:(NSString *)title AndContent:(NSString *)content;
@end

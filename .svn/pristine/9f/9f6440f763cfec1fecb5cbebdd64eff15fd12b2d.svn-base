//
//  AboutMeIntroduceCell.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AboutMeIntroduceCell.h"

@implementation AboutMeIntroduceCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellWithTitle:(NSString *)title AndContent:(NSString *)content
{
    UIFont *font = self.contentLabel.font;
    self.titleLabel.text = title;
    CGRect frame = self.contentLabel.frame;
    frame.size.height = [self heightForString:content fontSize:font andWidth:280];
    CGFloat height1 = frame.size.height;
    self.contentLabel.frame = frame;
    NSLog(@"frame size height %f",frame.size.height);
    self.contentLabel.numberOfLines = 0;
    frame = self.contentWhiteView.frame ;
    CGFloat height = frame.size.height;
    frame.size.height = height + height1 ;
    self.contentWhiteView.frame = frame;
    self.contentLabel.text = content;
}
- (float)heightForString:(NSString *)value fontSize:(UIFont *)font andWidth:(float)width
{
    CGSize size = CGSizeMake(280, 20000.0f);
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0)//IOS 7.0 以上
    {
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
        size =[value boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }
    else
    {
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
        size =[value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }
    
    float ch = size.height;
    return ch;
}
@end

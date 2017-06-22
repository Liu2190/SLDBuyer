//
//  DefaultCell.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-30.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DefaultCell.h"

@implementation DefaultCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellValueWithMarket:(MarketModel *)market AndDefault:(NSString *)defaultMarket
{
    self.marketNameLabel.text = market.marketName;
    self.defaultLabel.hidden = !(market.marketName == defaultMarket);
    self.marketAddressLabel.text = market.marketAddress;
    NSString *imageName = (market.marketName == defaultMarket?@"market_on":@"market_off");
    UIImage *pic = [UIImage imageNamed:imageName];
    CGPoint center = self.roundImage.center;
    CGRect frame = CGRectMake(0, 0, pic.size.width, pic.size.height);
    self.roundImage.frame = frame;
    self.roundImage.center = center;
    self.roundImage.image = pic;
}
@end

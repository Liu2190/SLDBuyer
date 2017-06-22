//
//  GoodsOrderListCell.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "GoodsOrderListCell.h"
#import "ScrollViewInOrderListCell.h"
@implementation GoodsOrderListCell

- (void)awakeFromNib
{
    // Initialization code
    self.orderTrackButton.layer.cornerRadius  = 2.0f;
    self.payButton.layer.cornerRadius = 2.0f;
    
}
-(void)setCellValueWith:(NSDictionary *)dict
{
    ScrollViewInOrderListCell *scrol = [[ScrollViewInOrderListCell alloc]initScollViewWithArray:[dict objectForKey:@"prodcut"]];
    [self.orderGoodsView addSubview:scrol];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if(selected)
    {
        self.backGroundView.backgroundColor = [UIColor lightGrayColor];
    }
    else
    {
        self.backGroundView.backgroundColor = [UIColor whiteColor];
    }
    // Configure the view for the selected state
}

@end

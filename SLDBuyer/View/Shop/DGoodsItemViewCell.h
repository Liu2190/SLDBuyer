//
//  DGoodsItemViewCell.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-19.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "QTableViewCell.h"

@interface DGoodsItemViewCell : QTableViewCell {
    UIImageView *_goodsImageView;
    UILabel *_goodsTitleLabel;
    
    UILabel *_sellPriceLabel;
    UILabel *_sellNumLabel;
    
    UILabel *_subtotalPriceTitle;
    UILabel *_subtotalPriceValue;
}

- (void)setDataForCell:(id)data;

@end

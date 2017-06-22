//
//  DGoodsItemViewCell.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-19.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DGoodsItemViewCell.h"
#import "UIImageView+WebCache.h"
#import "DGoods.h"

#define image_magin_size      15
#define title_label_size      14

@implementation DGoodsItemViewCell

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:string];
    
    float h = 80;
    
    _goodsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(image_magin_size, image_magin_size, h-2*image_magin_size, h-2*image_magin_size)];
    [self.contentView addSubview:_goodsImageView];
    
    _goodsTitleLabel = [[UILabel alloc]init];
    [_goodsTitleLabel setFont:[UIFont fontWithName:@"Heiti SC" size:title_label_size]];
    _goodsTitleLabel.textAlignment = NSTextAlignmentLeft;
    [_goodsTitleLabel setTextColor:[UIColor grayColor]];
    _goodsTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _goodsTitleLabel.numberOfLines = 2;
    [_goodsTitleLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_goodsTitleLabel];
    
    _sellPriceLabel = [[UILabel alloc]init];
    [_sellPriceLabel setFont:[UIFont fontWithName:@"Heiti SC" size:title_label_size]];
    _sellPriceLabel.textAlignment = NSTextAlignmentLeft;
    [_sellPriceLabel setTextColor:[UIColor grayColor]];
    _sellPriceLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _sellPriceLabel.numberOfLines = 1;
    [_sellPriceLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_sellPriceLabel];
    
    _sellNumLabel = [[UILabel alloc]init];
    [_sellNumLabel setFont:[UIFont fontWithName:@"Heiti SC" size:title_label_size]];
    _sellNumLabel.textAlignment = NSTextAlignmentLeft;
    [_sellNumLabel setTextColor:[UIColor grayColor]];
    _sellNumLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _sellNumLabel.numberOfLines = 1;
    [_sellNumLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_sellNumLabel];
    
    _subtotalPriceTitle = [[UILabel alloc]init];
    [_subtotalPriceTitle setFont:[UIFont fontWithName:@"Heiti SC" size:title_label_size]];
    _subtotalPriceTitle.textAlignment = NSTextAlignmentLeft;
    [_subtotalPriceTitle setTextColor:[UIColor redColor]];
    _subtotalPriceTitle.lineBreakMode = NSLineBreakByWordWrapping;
    _subtotalPriceTitle.numberOfLines = 1;
    [_subtotalPriceTitle setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_subtotalPriceTitle];
    
    _subtotalPriceValue = [[UILabel alloc]init];
    [_subtotalPriceValue setFont:[UIFont fontWithName:@"Heiti SC" size:title_label_size]];
    _subtotalPriceValue.textAlignment = NSTextAlignmentLeft;
    [_subtotalPriceValue setTextColor:[UIColor redColor]];
    _subtotalPriceValue.lineBreakMode = NSLineBreakByWordWrapping;
    _subtotalPriceValue.numberOfLines = 1;
    [_subtotalPriceValue setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_subtotalPriceValue];
    
    return self;
}

- (void)setDataForCell:(id)data {
    DGoods *goods = (DGoods*)data;
    [_goodsImageView setImageWithURL:[NSURL URLWithString:goods.imageUrl]];
    
    float x = _goodsImageView.frame.origin.x + _goodsImageView.frame.size.width+10;
    float w = self.contentView.frame.size.width-x-20;
    [_goodsTitleLabel setText:goods.title];
    CGSize titleSize = CGSizeMake(w, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_goodsTitleLabel.font,
                           NSFontAttributeName,nil];
    titleSize =[_goodsTitleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_goodsTitleLabel setFrame:CGRectMake(x, image_magin_size, titleSize.width, titleSize.height)];
    
    
    [_sellPriceLabel setText:[NSString stringWithFormat:@"￥%.2f",goods.sellPrice]];
    titleSize = CGSizeMake(w, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_sellPriceLabel.font,
            NSFontAttributeName,nil];
    titleSize =[_sellPriceLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    float y = 80-image_magin_size-titleSize.height;
    [_sellPriceLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    
    x = _sellPriceLabel.frame.origin.x + _sellPriceLabel.frame.size.width + 10;
    [_sellNumLabel setText:[NSString stringWithFormat:@"x %i",goods.goodsNum]];
    titleSize = CGSizeMake(w, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_sellNumLabel.font,
            NSFontAttributeName,nil];
    titleSize =[_sellNumLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_sellNumLabel setFrame:CGRectMake(x, y, titleSize.width, titleSize.height)];
    
    
    NSString *subtotalPrice = [NSString stringWithFormat:@"￥%.2f",goods.sellPrice * goods.goodsNum];
    [_subtotalPriceValue setText:subtotalPrice];
    titleSize = CGSizeMake(w, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_subtotalPriceValue.font,
            NSFontAttributeName,nil];
    titleSize =[_subtotalPriceValue.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_subtotalPriceValue setFrame:CGRectMake(self.contentView.frame.size.width-titleSize.width-20, y, titleSize.width, titleSize.height)];
    
    
    [_subtotalPriceTitle setText:@"小计:"];
    titleSize = CGSizeMake(w, 20000.0f);
    tdic = [NSDictionary dictionaryWithObjectsAndKeys:_subtotalPriceTitle.font,
            NSFontAttributeName,nil];
    titleSize =[_subtotalPriceTitle.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    [_subtotalPriceTitle setFrame:CGRectMake(_subtotalPriceValue.frame.origin.x-3-titleSize.width, y, titleSize.width, titleSize.height)];
}



@end

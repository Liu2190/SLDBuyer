//
//  DHomeProductBlockView.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-31.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeProductBlockView.h"
#import "UIImageView+WebCache.h"
#import "DHomeGoods.h"
#import "DGoodDetailForm.h"

#import "DGoods.h"
#import "DGoodsServer.h"

#define labelFont_size              12
#define price_labelFont_size        12
#define left_spe_size               5

#define productImage_size           84

#define addNum_size_width           20
#define addNum_size_height          20


@implementation DHomeProductBlockView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _imageBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    [_imageBgView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_imageBgView];
    
    _productImageView = [[UIImageView alloc]initWithFrame:
                         CGRectMake((_imageBgView.frame.size.width-productImage_size)/2, (_imageBgView.frame.size.height-productImage_size)/2, productImage_size, productImage_size)];
    _productImageView.contentMode = UIViewContentModeScaleAspectFill;
    _productImageView.clipsToBounds = YES;
    [_imageBgView addSubview:_productImageView];
    
    
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(left_spe_size, _productImageView.frame.size.height+_productImageView.frame.origin.y+10, frame.size.width-2*left_spe_size, self.frame.size.height/3/2)];
    [_titleLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [_titleLabel setTextColor:[UIColor blackColor]];
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.numberOfLines = 2;
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_titleLabel];
    
    _sellPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(left_spe_size, _titleLabel.frame.size.height+_titleLabel.frame.origin.y+5, self.frame.size.width/2-left_spe_size, self.frame.size.height/3/2)];
    [_sellPriceLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
    _sellPriceLabel.textAlignment = NSTextAlignmentLeft;
    [_sellPriceLabel setTextColor:[UIColor redColor]];
    _sellPriceLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _sellPriceLabel.numberOfLines = 2;
    [_sellPriceLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_sellPriceLabel];
    
    _salePriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2+left_spe_size, _titleLabel.frame.size.height+_titleLabel.frame.origin.y+5, self.frame.size.width/2-left_spe_size, self.frame.size.height/3/2)];
    [_salePriceLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
    _salePriceLabel.textAlignment = NSTextAlignmentLeft;
    [_salePriceLabel setTextColor:[UIColor grayColor]];
    _salePriceLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _salePriceLabel.numberOfLines = 2;
    [_salePriceLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_salePriceLabel];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2, _titleLabel.frame.size.height+_titleLabel.frame.origin.y+18, self.frame.size.width/2-2*left_spe_size, .5)];
    [lineLabel setBackgroundColor:[UIColor grayColor]];
    [self addSubview:lineLabel];
    
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(frame.size.width-.5, 0, .5, frame.size.height)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [self addSubview:lineImageView];
    
    
    _addNumImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Shop_AddNum.png"]];
    float x = frame.size.width - addNum_size_width -3;
    [_addNumImageView setFrame:CGRectMake(x, 3, addNum_size_width, addNum_size_height)];
    _addNumImageView.hidden = YES;
    [self addSubview:_addNumImageView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [titleLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setTextColor:[UIColor whiteColor]];
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    titleLabel.numberOfLines = 1;
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setFrame:CGRectMake(0, 0, _addNumImageView.frame.size.width, _addNumImageView.frame.size.height)];
    [_addNumImageView addSubview:titleLabel];
    
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self
                                               action:@selector(singleTouch:)];
    singleFingerOne.numberOfTouchesRequired = 1;
    singleFingerOne.numberOfTapsRequired = 1;
    [self addGestureRecognizer:singleFingerOne];
    
    UILongPressGestureRecognizer *longPress =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(longPressed:)];
    [self addGestureRecognizer:longPress];
    
    return self;
}

- (void)singleTouch:(UITapGestureRecognizer *)sender {
    UIView *view = [self superview];    // DHomeBlockView
    UIView *paView = [view superview];  // UITableViewCellContentView
    UIView *cell = [paView superview];  // UITableViewCellScrollView
    UIView *allCell = [cell superview]; // DHomeGoodsAllCell
    
    NSString *GoodTitle = _titleLabel.text;
    NSString *sellPrice = _salePriceLabel.text;
    DGoodDetailForm *goodDetailForm = [[DGoodDetailForm alloc]init];
    goodDetailForm.title = GoodTitle;
    goodDetailForm.sellPrice = sellPrice;
    goodDetailForm.stock = 100;
    
    NSDictionary *userInfo = @{@"DetailForm":goodDetailForm,@"HomeBlockID":[NSString stringWithFormat:@"%i",view.tag],@"BlockID":[NSString stringWithFormat:@"%i",self.tag]};
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationGoodsClicked" object:allCell userInfo:userInfo];
}

- (void)longPressed:(UIGestureRecognizer *)gestureRecognizer {
    NSString *GoodTitle = _titleLabel.text;
    DGoodDetailForm *goodDetailForm = [[DGoodDetailForm alloc]init];
    goodDetailForm.title = GoodTitle;
    goodDetailForm.sellPrice = _sellPrice;
    goodDetailForm.stock = 100;
    goodDetailForm.serverId = _goodId;
    goodDetailForm.imageUrl = _imageUrl;
    
    NSDictionary *userInfo = @{@"DetailForm":goodDetailForm};
    UIView *imageView = gestureRecognizer.view;
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationGoodsLongPress" object:imageView userInfo:userInfo];
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationGoodsLongChange" object:gestureRecognizer userInfo:nil];
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationGoodsLongEnd" object:imageView userInfo:userInfo];
    }

}


- (void)setDataForView:(id)data {
    DHomeGoods *homeGoods = (DHomeGoods*)data;
    [_productImageView setImageWithURL:[NSURL URLWithString:homeGoods.commodityImage]];
    
    [_titleLabel setText:homeGoods.commodityName];
    [_sellPriceLabel setText:[NSString stringWithFormat:@"￥%@",homeGoods.sellPrice]];
    [_salePriceLabel setText:[NSString stringWithFormat:@"￥%@",homeGoods.marketPrice]];
   
    _goodId = homeGoods.serverId;
    _sellPrice = homeGoods.sellPrice;
    _imageUrl = homeGoods.commodityImage;
    
    DGoods *goods = (DGoods*)[[TServerFactory getServerInstance:@"DGoodsServer"]
                              selectRecordByServerId:_goodId];
    int addNum = goods.goodsNum;
    
    
    if (addNum ==0) {
        _addNumImageView.hidden = YES;
    } else {
        _addNumImageView.hidden = NO;
        UILabel *addNumLabel = [[_addNumImageView subviews]lastObject];
        [addNumLabel setText:[NSString stringWithFormat:@"%i",addNum]];
    }
}

@end

//
//  DShopAddGoodsController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-17.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DShopAddGoodsController.h"
#import "UIButton+Extensions.h"
#import "UIImageView+WebCache.h"

#define toolBar_height      70
#define navigation_height   44

#define statusBar_height    0

#define tab_size_height     40
#define number_size_height  40
#define title_size_number   50

#define title_label_size    18
#define number_label_size   14

@implementation DShopAddGoodsController

- (id)initWithGoods:(DGoods*)goods {
    self = [super init];
    _goods = goods;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)setDefaultNavigationStyle {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:19.0], NSFontAttributeName, nil]];
    
    UIColor *navBgColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:navBgColor];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    UIView *naviBarView = [[UIView alloc]initWithFrame:CGRectMake(0, statusBar_height, self.view.frame.size.width, navigation_height)];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
    [button setImage:[UIImage imageNamed:@"Nav_Close_Green.png"] forState:UIControlStateNormal];
    [button setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -30)];
    [button addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [naviBarView addSubview:button];
    [naviBarView setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:0.]];
    [self.view addSubview:naviBarView];
    
    UIImageView *_imageView = [[UIImageView alloc]init];
    __weak UIImageView *imageView = _imageView;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageView setImageWithURL:[NSURL URLWithString:_goods.imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        CGSize imageSize = [[DUtilities sharedInstance]scaleImage:image.size reference:120 isWidth:NO];
        float x = (self.view.frame.size.width - imageSize.width)/2;
        [imageView setFrame:CGRectMake(x, 30, imageSize.width, imageSize.height)];
    }];
    [self.view addSubview:imageView];
    
    
    UILabel *titleLabel = [[UILabel alloc]init];
    float y = self.view.frame.size.height - toolBar_height-number_size_height -title_size_number;
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, y, self.view.frame.size.width-2*25, title_size_number)];
    [titleLabel setText:_goods.title];
    [titleLabel setFont:[UIFont fontWithName:@"Heiti SC" size:title_label_size]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setTextColor:[UIColor grayColor]];
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    titleLabel.numberOfLines = 2;
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:titleLabel];
    
    
    UIView *numberView = [[UIView alloc]initWithFrame:CGRectMake(15, y+title_size_number,
                                                                 self.view.frame.size.width-2*15, number_size_height)];
    [numberView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.]];
    [self.view addSubview:numberView];
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(numberView.frame.size.width/2-.5/2, 10, .5, numberView.frame.size.height-20)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [numberView addSubview:lineImageView];
    
    UILabel *sellPriceLabel = [[UILabel alloc]initWithFrame:
                       CGRectMake(numberView.frame.size.width/2+15, 0,
                                  numberView.frame.size.width/2-30, numberView.frame.size.height)];
    [sellPriceLabel setText:[NSString stringWithFormat:@"￥%.2f",_goods.sellPrice]];
    [sellPriceLabel setFont:[UIFont fontWithName:@"Heiti SC" size:number_label_size]];
    sellPriceLabel.textAlignment = NSTextAlignmentLeft;
    [sellPriceLabel setTextColor:[UIColor grayColor]];
    sellPriceLabel.lineBreakMode = NSLineBreakByCharWrapping;
    sellPriceLabel.numberOfLines = 1;
    [sellPriceLabel setBackgroundColor:[UIColor clearColor]];
    [numberView addSubview:sellPriceLabel];
    
    UILabel *stockLabel = [[UILabel alloc]initWithFrame:
                   CGRectMake(0, 0, numberView.frame.size.width/2-15, numberView.frame.size.height)];
    [stockLabel setText:[NSString stringWithFormat:@"库存 %i",100]];
    [stockLabel setFont:[UIFont fontWithName:@"Heiti SC" size:number_label_size]];
    stockLabel.textAlignment = NSTextAlignmentRight;
    [stockLabel setTextColor:[UIColor grayColor]];
    stockLabel.lineBreakMode = NSLineBreakByWordWrapping;
    stockLabel.numberOfLines = 1;
    [stockLabel setBackgroundColor:[UIColor clearColor]];
    [numberView addSubview:stockLabel];
    
    
    UIView *toolBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-toolBar_height, self.view.frame.size.width, toolBar_height)];
    lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(0, 0, toolBarView.frame.size.width, .3)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [toolBarView addSubview:lineImageView];
    
    
    UIButton *reduceBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, toolBar_height-2*15, toolBar_height-2*15)];
    [reduceBtn setImage:[UIImage imageNamed:@"Detail_Goods_Reduce.png"] forState:UIControlStateNormal];
    [toolBarView addSubview:reduceBtn];
    
    
    UIButton *plusBtn = [[UIButton alloc]initWithFrame:CGRectMake(15+toolBar_height-2*15+35, 15, toolBar_height-2*15, toolBar_height-2*15)];
    [plusBtn setImage:[UIImage imageNamed:@"Detail_Goods_Plus.png"] forState:UIControlStateNormal];
    [toolBarView addSubview:plusBtn];
    
    UIButton *shopCarBtn = [[UIButton alloc]initWithFrame:CGRectMake(toolBarView.frame.size.width-130, (toolBarView.frame.size.height-40)/2, 120, 40)];
    //shopCarBtn.enabled = NO;
    [shopCarBtn setImage:[UIImage imageNamed:@"Detail_ShopCar_Opration.png"] forState:UIControlStateNormal];
    [shopCarBtn setImage:[UIImage imageNamed:@"Detail_ShopCar_disable.png"] forState:UIControlStateDisabled];
    [shopCarBtn setImage:[UIImage imageNamed:@"Detail_ShopCar_sel.png"] forState:UIControlStateHighlighted];
    [toolBarView addSubview:shopCarBtn];
    
    [self.view addSubview:toolBarView];
}

- (void)leftButtonAction {
    [self.delegate cancelButtonClicked:self];
}


@end

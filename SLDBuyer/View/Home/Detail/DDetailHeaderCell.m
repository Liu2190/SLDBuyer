//
//  DDetailHeaderCell.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-5.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DDetailHeaderCell.h"
#import "DGoodDetailForm.h"
#import "DHomeTabBarView.h"

#define tab_size_height     40
#define number_size_height  40
#define title_size_number   50

#define title_label_size    18
#define number_label_size   14

@implementation DDetailHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _titleLabel = [[UILabel alloc]init];
    float y = [DDetailHeaderCell heightForCell] - tab_size_height - number_size_height - title_size_number;
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, y, self.frame.size.width-2*15, title_size_number)];
    [_titleLabel setFont:[UIFont fontWithName:@"Heiti SC" size:title_label_size]];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel setTextColor:[UIColor blackColor]];
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.numberOfLines = 2;
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_titleLabel];
    
    
    UIView *numberView = [[UIView alloc]initWithFrame:CGRectMake(15, y+title_size_number,
                                                                self.frame.size.width-2*15, number_size_height)];
    [numberView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.]];
    [self.contentView addSubview:numberView];
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(numberView.frame.size.width/2-.5/2, 10, .5, numberView.frame.size.height-20)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [numberView addSubview:lineImageView];
    
    _sellPriceLabel = [[UILabel alloc]initWithFrame:
                       CGRectMake(numberView.frame.size.width/2, 0,
                                  numberView.frame.size.width/2, numberView.frame.size.height)];
    [_sellPriceLabel setFont:[UIFont fontWithName:@"Heiti SC" size:number_label_size]];
    _sellPriceLabel.textAlignment = NSTextAlignmentCenter;
    [_sellPriceLabel setTextColor:[UIColor redColor]];
    _sellPriceLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _sellPriceLabel.numberOfLines = 1;
    [_sellPriceLabel setBackgroundColor:[UIColor clearColor]];
    [numberView addSubview:_sellPriceLabel];
    
    _stockLabel = [[UILabel alloc]initWithFrame:
                   CGRectMake(0, 0, numberView.frame.size.width/2-15, numberView.frame.size.height)];
    [_stockLabel setFont:[UIFont fontWithName:@"Heiti SC" size:number_label_size]];
    _stockLabel.textAlignment = NSTextAlignmentCenter;
    [_stockLabel setTextColor:[UIColor grayColor]];
    _stockLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _stockLabel.numberOfLines = 1;
    [_stockLabel setBackgroundColor:[UIColor clearColor]];
    [numberView addSubview:_stockLabel];
    
    return self;
}

- (void)setDataForCell:(id)data andObje:(id)target{
    DGoodDetailForm *goodDetailForm = (DGoodDetailForm*)data;
    [_titleLabel setText:goodDetailForm.title];
    [_sellPriceLabel setText:goodDetailForm.sellPrice];
    [_stockLabel setText:[NSString stringWithFormat:@"库存: %i",goodDetailForm.stock]];
    
    float y = [DDetailHeaderCell heightForCell] - tab_size_height - number_size_height - title_size_number;
    UIView *tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, y+title_size_number+number_size_height,
                                                                 self.frame.size.width, tab_size_height)];
    CGRect rect = CGRectMake(0, 0, tabBarView.frame.size.width, tabBarView.frame.size.height);
    NSMutableArray *tabTitles = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in goodDetailForm.detailData) {
        NSString *title = [dict objectForKey:@"Title"];
        NSDictionary *tabTitle = @{@"title":title};
        [tabTitles addObject:tabTitle];
    }
    
    DHomeTabBarView *tabBar = [[DHomeTabBarView alloc]initWithFrame:rect andTitles:tabTitles andIsLine:NO];
    [tabBar setHomeDelegate:target];
    [tabBarView addSubview:tabBar];
    [self.contentView addSubview:tabBarView];
}

+ (float)heightForCell {
    return 270;
}

@end

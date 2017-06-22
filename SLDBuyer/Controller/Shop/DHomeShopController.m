//
//  DHomeShopController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-27.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeShopController.h"
#import "DShopGoodsListController.h"
#import "DShopCarServer.h"

#define labelFont_size              10

#define carshop_size_width          45
#define carshop_size_height         40

#define car_size_width              25
#define car_size_height             20

#define bgNum_size_width            25
#define bgNum_size_height           17

@implementation DHomeShopController

+ (id)sharedInstance {
    static DHomeShopController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DHomeShopController alloc] init];
    });
    
    return sharedInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(self.view.frame.size.width-carshop_size_width-5, 1,
                                   carshop_size_width, carshop_size_height)];
    
    float x = 5;
    float y = (self.view.frame.size.height - car_size_height)/2;
    
    UIImageView *carImageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, car_size_width, car_size_height)];
    carImageView.image = [UIImage imageNamed:@"Shop_Car"];
    [self.view addSubview:carImageView];
    
    x = self.view.frame.size.width/2;
    y = 0;
    _numImageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, bgNum_size_width, bgNum_size_height)];
    _numImageView.image = [UIImage imageNamed:@"Shop_Num.png"];
    [self.view addSubview:_numImageView];
    
    _numLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, y, bgNum_size_width, bgNum_size_height)];
    [_numLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
    _numLabel.textAlignment = NSTextAlignmentCenter;
    [_numLabel setTextColor:[UIColor whiteColor]];
    _numLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_numLabel setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_numLabel];
    
    [self updateRemindNum];
}

- (void)updateRemindNum {
    int cateNum = [[TServerFactory getServerInstance:@"DShopCarServer"]getShopCarGoodsCateNum];
    
    if (cateNum == 0) {
        _numImageView.hidden = YES;
        _numLabel.hidden = YES;
    } else {
        _numImageView.hidden = NO;
        _numLabel.hidden = NO;
    }
    
    _numLabel.text = [NSString stringWithFormat:@"%i",cateNum];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.homeDelegate openShopGoodsListController];
}


@end

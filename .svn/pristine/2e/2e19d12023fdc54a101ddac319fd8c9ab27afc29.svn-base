//
//  DDetailBaseController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-4.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DDetailBaseController.h"
#import "DMainRootContrller.h"

#define title_label_size  17
#define title_button_size 35

#define left_btn_size_width     20
#define left_btn_size_height    16

#define right_btn_size_width     25
#define right_btn_size_height    20

@implementation DDetailBaseController

- (id)initWithFrame:(CGRect)startFrame andProductImage:(UIImage*)image andDetailForm:(DGoodDetailForm*)goodDetailForm {
    self = [super init];
    _startFrame = startFrame;
    _goodsImage = image;
    _goodDetailForm = goodDetailForm;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.view setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.]];
    [self.view setBackgroundColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:1.f]];
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.navigationController setNavigationBarHidden:YES];
    [[DMainRootContrller sharedManager]updateStatuBarColorByStyle:UIStatusBarStyleDefault];
    [[DMainRootContrller sharedManager]setOpenDrawerGesture:NO];
    
    _imageView = [[UIImageView alloc]initWithFrame:_startFrame];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.image = _goodsImage;
    [self.view addSubview:_imageView];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = _startFrame;
        frame.size.width = 126;
        frame.size.height = 126;
        
        frame.origin.x = (self.view.frame.size.width-frame.size.width)/2;
        frame.origin.y = 64;
        
        _imageView.frame = frame;
        
    } completion:^(BOOL finished) {
        _tableView.hidden = NO;
    }];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _distance = scrollView.contentOffset.y;
    
    ScrollDirection direction = direction_up;
    if (_distance-_startY < 0) direction = direction_down;
    
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    if (y > h) direction = direction_bottom;
    
    if (scrollView.contentOffset.y < 0) {
        direction = direction_top;
    }
    
    [self scrollByDistance:fabs(_distance)  andDirection:direction];
    
    _startY = scrollView.contentOffset.y;
}

- (void)scrollByDistance:(float)distance andDirection:(ScrollDirection)direction {
    if (direction == direction_up) { // hiden
        
    }
    
    if (direction == direction_down) { // show
    
    }
    
    _imageView.alpha = 1-2*distance/250;
}

@end

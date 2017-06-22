//
//  DDetailBaseController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-4.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DBaseViewController.h"
#import "DGoodDetailForm.h"


typedef enum {
    direction_up,
    direction_down,
    direction_bottom,
    direction_top,
    direction_up_none,
    direction_down_none
}ScrollDirection;

@interface DDetailBaseController : DBaseViewController {
    UIImage *_goodsImage;
    CGRect _startFrame;
    UIImageView *_imageView;
    
    
    UITableView *_tableView;
    NSMutableArray *_datas;
    
    DGoodDetailForm *_goodDetailForm;
    float _startY;
    float _distance;
}

- (id)initWithFrame:(CGRect)startFrame andProductImage:(UIImage*)image andDetailForm:(DGoodDetailForm*)goodDetailForm;


- (void)scrollByDistance:(float)distance andDirection:(ScrollDirection)direction;

@end

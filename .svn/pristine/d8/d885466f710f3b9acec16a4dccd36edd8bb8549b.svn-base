//
//  DCateGoodsViewController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-26.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DBaseTableController.h"
#import "ICETutorialController.h"
#import "DCateGoodsDelegate.h"

@interface DCateGoodsViewController : DBaseTableController {
    ICETutorialController *_iceController;
    NSString *_naviTitle;
}

@property (nonatomic,assign)int cateId;
@property (nonatomic,assign)id<DCateGoodsDelegate> cateDelegate;

@property (nonatomic,strong)NSMutableArray *goodsAllDatas;
@property (nonatomic,strong)NSMutableArray *goodsBannerDatas;
@property (nonatomic,assign)BOOL isBannerData;


- (id)initWithCateId:(int)cateId andTitle:(NSString*)title;


@end

//
//  DSaleCateViewController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-28.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DBaseViewController.h"
#import "DHomeScrollView.h"

#import "DCateListViewController.h"
#import "DSaleListViewController.h"

@interface DSaleCateViewController : DBaseViewController {
    DHomeScrollView *mainScrollView;
    
    DCateListViewController *_cateList;
    DSaleListViewController *_saleList;
}

@property (nonatomic,assign)int startIndex;

- (void)scrollPageByPageNum:(int)pageNo animated:(BOOL)animated;
- (void)closeViewController:(void(^)(BOOL isFinish))callback;
@end

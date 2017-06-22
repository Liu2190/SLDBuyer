//
//  DSaleCateViewController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-28.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DSaleCateViewController.h"

#import "DCateListViewController.h"
#import "DSaleListViewController.h"

@implementation DSaleCateViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    CGRect mainRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    mainScrollView = [[DHomeScrollView alloc]initWithFrame:mainRect andPageNum:2];
    [mainScrollView setContentSize:CGSizeMake(mainRect.size.width, mainRect.size.height+1)];
    mainScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mainScrollView];
   
    // sale
    UIView *saleView = [mainScrollView getPageViewByPageIndex:0];
    _saleList = [[DSaleListViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [_saleList.view setFrame:CGRectMake(0, 0, saleView.frame.size.width, saleView.frame.size.height)];
    [saleView addSubview:_saleList.view];
    
    // cate
    UIView *cateView = [mainScrollView getPageViewByPageIndex:1];
    _cateList = [[DCateListViewController alloc]init];
    [_cateList.view setFrame:CGRectMake(0, 0, cateView.frame.size.width, cateView.frame.size.height)];
    [cateView addSubview:_cateList.view];
    
    [self scrollPageByPageNum:_startIndex animated:NO];
}

- (void)scrollPageByPageNum:(int)pageNo animated:(BOOL)animated{
    [mainScrollView scrollPageByPageNum:pageNo animated:NO];
}

- (void)cleanBackGround {
    [_cateList.tableView setBackgroundColor:[UIColor colorWithRed:250./255 green:249./255 blue:246./255 alpha:1.0]];
}

- (void)closeViewController:(void(^)(BOOL isFinish))callback {
    int pageNo = [mainScrollView getCurrentPageNO];
    
    if (pageNo == 0) {
        [_saleList removeAllRow:^(BOOL isFnish){
            ((void(^)(BOOL))callback)(YES);
        }];
    } else if (pageNo == 1) {
        [_cateList removeAllRow:^(BOOL isFnish){
            ((void(^)(BOOL))callback)(YES);
        }];
    }
}

@end

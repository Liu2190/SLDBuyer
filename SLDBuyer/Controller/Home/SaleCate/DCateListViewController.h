//
//  DCateListViewController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DBaseTableController.h"

@interface DCateListViewController : DBaseTableController {
    NSMutableArray *_cateLeves;
    NSMutableArray *_goodDatas;
    
    /**
     * 重使用
     */
    NSMutableArray *_sectionViews;
}

@end

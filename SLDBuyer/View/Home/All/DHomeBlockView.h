//
//  DHomeBlockView.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-31.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHomeBlockView : UIView

@property (nonatomic,strong)NSMutableArray *blocks;

- (void)setDataForView:(NSArray*)datas;
@end

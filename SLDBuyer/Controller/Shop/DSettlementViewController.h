//
//  DSettlementViewController.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-17.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "QuickDialogController.h"

@interface DSettlementViewController : QuickDialogController


@property (nonatomic,strong)NSArray *goods;

- (id)initWithGoods:(NSArray*)goods;

@end

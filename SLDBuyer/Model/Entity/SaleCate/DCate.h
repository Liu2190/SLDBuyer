//
//  DCate.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DRecord.h"

@interface DCate : DRecord

@property (nonatomic,strong)NSString *cateImageUrl;
@property (nonatomic,strong)NSString *cateTitle;

@property (nonatomic,strong)NSString *parentId;

@property (nonatomic,strong)NSMutableArray *childCate;

@end

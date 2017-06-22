//
//  DChecklistElement.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-18.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "QLabelElement.h"

@interface DChecklistElement : QLabelElement {
    BOOL _animationFlag;
    UIImageView *_indicatorView;
}

@property (nonatomic,assign)BOOL isSelected;

@end

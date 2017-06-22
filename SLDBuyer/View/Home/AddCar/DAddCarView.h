//
//  DAddCarView.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-11.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAddCarView : UIView {
    UIImageView *_cardView;
    BOOL _isAddCar;
}

@property (nonatomic,assign)CGRect startFrame;
@property (nonatomic,assign)CGPoint startCenter;

- (id)initWithFrame:(CGRect)frame andGoodView:(UIView*)goodView;

/**
 * 释放手指返回商品图到列表位置
 */
- (void)moveAndEndAddCar:(void(^)(BOOL isAddCar))callback;


/**
 * 移动中缩放
 */
- (void)scalingByMoveY:(float)moveY;



@end

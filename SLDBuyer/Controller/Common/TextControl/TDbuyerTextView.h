//
//  TDbuyerTextView.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-4.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDbuyerTextView : UITextView
@property (nonatomic,assign) int placeholder_size;
@property (nonatomic,retain)NSString *placeholder;
/**
 * 是否让placeholder文字在控件位置居中
 */
@property (nonatomic,assign) BOOL isCenter;
-(void)setPlaceholderWithString:(NSString *)placeholder;
@end

//
//  GenderView.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-5.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol genderDelegate
-(void)selectGenderWithButtonIndex:(NSInteger)index;//0代表男，1代表女 
@end
@interface GenderView : UIView
@property (nonatomic,assign)id delegate;
- (void)showInView:(UIView *)view;
@end

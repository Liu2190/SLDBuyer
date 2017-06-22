//
//  DCateSectionView.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCateSectionView : UIView {
    UIImageView *_imageView;
    UILabel *_titleLabel;
}

- (id)initWithFrame:(CGRect)frame andDelegate:(id)delegate;
- (void)setDataForView:(id)data andIndex:(int)index;

@end

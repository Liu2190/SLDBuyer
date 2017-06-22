//
//  DSearchBar.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-26.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DSearchBar.h"

@implementation DSearchBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.tintColor = [UIColor whiteColor];
    self.placeholder = @"搜索";
    self.autoresizingMask = UIViewAutoresizingNone;
    
    return self;
}

- (void)resetPropertyByBgColor:(UIColor*)bgcolor andplaceHolderColor:(UIColor*)placeColor
              andLeftImageName:(NSString*)leftImageName {
    if (IsIOS7) {
        if ([[self subviews] count] > 0) {
            UIView * thesuperview = [[self subviews] objectAtIndex:0];
            NSArray *viewSubvies = [thesuperview subviews];
            for (UIView *_theview in viewSubvies) {
                if ([_theview isKindOfClass:[UITextField class]]) {
                    [_theview setBackgroundColor:bgcolor];
                    [((UITextField*)_theview) setValue:placeColor forKeyPath:@"_placeholderLabel.textColor"];
                    
                    //UIImage *image = [UIImage imageNamed:leftImageName]; // 需要一个放大镜
                    //UIImageView *iView = [[UIImageView alloc] initWithImage:image];
                    //((UITextField*)_theview).leftView = iView;
                }
                
                if ([_theview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                    [_theview removeFromSuperview];
                }
            }
        }
    }
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    UIImage *img = [UIImage imageNamed: @"background.png"];
    UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectZero];
    [v setImage:img];
    v.bounds = CGRectMake(0, 0, img.size.width, img.size.height);
    NSArray *subs = self.subviews;
    for (int i = 0; i < [subs count]; i++) {
        id subv = [self.subviews objectAtIndex:i];
        if ([subv isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            CGRect viewRect = [subv frame];
            [v setFrame:viewRect];
            [self insertSubview:v atIndex:i];
        }
    }
    [v setNeedsDisplay];
    [v setNeedsLayout];
}

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed: @"background.png"];
    [image drawInRect:rect];
}

@end

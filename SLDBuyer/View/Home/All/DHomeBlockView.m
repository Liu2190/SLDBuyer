//
//  DHomeBlockView.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-31.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeBlockView.h"
#import "DHomeProductBlockView.h"
#import "DHomeGoods.h"

@implementation DHomeBlockView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.blocks = [[NSMutableArray alloc]init];
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:
                                  CGRectMake(0, frame.size.height-.3, frame.size.width, .3)];
    [lineImageView setImage:[UIImage imageNamed:@"home_spe_line.png"]];
    [self addSubview:lineImageView];
    
    float bw = self.frame.size.width/3;
    float bh = self.frame.size.height-1;
    
    for (int i=0; i<3; i++) {
        DHomeProductBlockView *blockView = [[DHomeProductBlockView alloc]initWithFrame:CGRectMake(i*bw, 0, bw, bh)];
        blockView.tag = i;
        [self.blocks addObject:blockView];
        [self addSubview:blockView];
    }

    return self;
}

- (void)setDataForView:(NSArray*)datas {
    for (int i=0;i<datas.count;i++) {
        DHomeGoods *product = [datas objectAtIndex:i];
        
        if (!(self.blocks.count>i)) return;
        
        DHomeProductBlockView *blockView = [self.blocks objectAtIndex:i];
        [blockView setDataForView:product];
    }
}

@end

//
//  TTabBarControl.m
//  DBuyer
//
//  Created by Dbuyer mac1 on 14-5-8.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "TTabBarControl.h"
#import "TTabBarBlock.h"
#import "DUtilities.h"


@implementation TTabBarControl

- (id)initWithFrame:(CGRect)frame andNameItems:(NSArray*)itemNames {
    self = [super init];
    _frame = frame;
    
    self.colorSelected = [UIColor blueColor];
    self.colorDefault = [UIColor grayColor];
    
    _tabBarItems = [[NSMutableArray alloc]init];
    _indexSelected = 0;
    _nameItems = itemNames;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:_frame];

    [self genTabBarItmesByItemNames:_nameItems];
    TTabBarBlock *blockView = (TTabBarBlock*)[_tabBarItems objectAtIndex:0];
    _lineImageView = [[UIImageView alloc]initWithFrame:
                      CGRectMake(0, blockView.frame.size.height-1, blockView.frame.size.width, 1)];
    [_lineImageView setImage:[UIImage imageNamed:@"TabBar_Line.png"]];
    [self.view addSubview:_lineImageView];
    
    CGRect rect = CGRectMake(0, self.view.frame.size.height-.5, self.view.frame.size.width, .5);
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:rect];
    [lineImageView setImage:[UIImage imageNamed:@"TabBar_ListLine.png"]];
    [self.view addSubview:lineImageView];

}

- (void)genTabBarItmesByItemNames:(NSArray*)itemNames {
    float w = self.view.frame.size.width/itemNames.count;
    float h = self.view.frame.size.height;
    
    for (int i=0;i<itemNames.count;i++) {
        NSString *itemName = [itemNames objectAtIndex:i];
        float x = i*w; float y = 0;
        
        TTabBarBlock *blockView = [[TTabBarBlock alloc]initWithFrame:CGRectMake(x, y, w, h)
                                                         andItemName:itemName];
        blockView.tag = i;
        blockView.colorSelected = self.colorSelected;
        blockView.colorDefault = self.colorDefault;
        
        if (i == _indexSelected) [blockView updateCompentByisSelect:YES];
        else [blockView updateCompentByisSelect:NO];
        
        [_tabBarItems addObject:blockView];
        [self.view addSubview:blockView];
        
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]init];
        [singleTap addTarget:self action:@selector(gestureRecognizer:)];
        singleTap.numberOfTapsRequired = 1;
        singleTap.numberOfTouchesRequired = 1;
        [blockView addGestureRecognizer:singleTap];
    }
}

- (void)updateLineOnSwitch:(int)index {
    TTabBarBlock *blockView = [_tabBarItems objectAtIndex:_indexSelected];
    [blockView updateCompentByisSelect:NO];
    
    _indexSelected = index;
    blockView = [_tabBarItems objectAtIndex:_indexSelected];
    [blockView updateCompentByisSelect:YES];
    
    CAKeyframeAnimation *moveAnimation = nil;
    
    float w = self.view.frame.size.width/_tabBarItems.count;
    float x = _indexSelected*w+w/2;
    CGPoint center = CGPointMake(x, _lineImageView.center.y);
    moveAnimation = [[DUtilities sharedInstance]objectMoveFrom:CGPointMake(_lineImageView.center.x, _lineImageView.center.y) toPoint:center duration:.2f];
    [_lineImageView.layer addAnimation:moveAnimation forKey:@"move"];
    [_lineImageView setCenter:center];
}

- (void)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer {
    int index = [gestureRecognizer view].tag;
    if (_indexSelected == index) return;
    [self updateLineOnSwitch:index];
    
    [self.tabBarDelegate doTabBarClicked:_indexSelected];
}


@end

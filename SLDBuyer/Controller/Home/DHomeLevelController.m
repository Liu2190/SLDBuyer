//
//  DHomeLevelController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-21.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeLevelController.h"
#import "DDetailViewController.h"
#import "DHomeAllController.h"
#import "DMainRootContrller.h"
#import "DShopGoodsListController.h"
#import "DSearchBar.h"

#import "DHomeProductBlockView.h"
#import "DHomeGoodsAllCell.h"
#import "DHomeBlockView.h"
#import "DGoodDetailForm.h"
#import "DHomeGoods.h"

#import "DAddCarView.h"

#import "DGoods.h"
#import "DShopCar.h"
#import "DGoodsServer.h"
#import "DShopCarServer.h"


@implementation DHomeLevelController

+ (id)sharedInstance {
    static DHomeLevelController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DHomeLevelController alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    self.menuTitle = @"购物专区";
    self.menuImage = @"Bracket_Home.png";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doGoodsClicked:)
                                                 name:@"NotificationGoodsClicked" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doStartAnimation:)
                                                 name:@"NotificationStartAnimation" object:nil];
    
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doGoodsLongPress:)
                                                 name:@"NotificationGoodsLongPress" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doGoodsLongChange:)
                                                 name:@"NotificationGoodsLongChange" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doGoodsLongEnd:)
                                                 name:@"NotificationGoodsLongEnd" object:nil];
}

/**
 * 商品列表项被Tap点击
 */
- (void)doGoodsClicked:(NSNotification *)notification {
    
    NSDictionary *userInfo = notification.userInfo;
    DGoodDetailForm *detailForm = [userInfo objectForKey:@"DetailForm"];
    homeBlockId = [[userInfo objectForKey:@"HomeBlockID"]intValue];
    blockId = [[userInfo objectForKey:@"BlockID"]intValue];
    
    homeGoodsAllCell = notification.object;
    DHomeBlockView *homeBlockView = [homeGoodsAllCell.viewBlocks objectAtIndex:homeBlockId];
    DHomeProductBlockView *productBlockView = [homeBlockView.blocks objectAtIndex:blockId];
    
    UIImageView *imageview = productBlockView.productImageView;
    imageview.hidden = YES;
    startAnimationFrame = [productBlockView convertRect:imageview.frame toView:self.view];
    DDetailViewController *detailController = [[DDetailViewController alloc]
                                               initWithFrame:startAnimationFrame
                                               andProductImage:imageview.image andDetailForm:detailForm];
    
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:detailController];
    [self.navigationController addChildViewController:navigation];
    [self.navigationController.view addSubview:navigation.view];
    [self.navigationController didMoveToParentViewController:self];
    
    CGRect frame = startAnimationFrame;
    frame.size.width = 126;
    frame.size.height = 126;
    
    frame.origin.x = (self.view.frame.size.width-frame.size.width)/2;
    frame.origin.y = 0;
    
    _animationImageView = [[UIImageView alloc]initWithFrame:frame];
    _animationImageView.image = imageview.image;
    [self.view addSubview:_animationImageView];
}

- (void)doStartAnimation:(NSNotification *)notification {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = startAnimationFrame;
        _animationImageView.frame = frame;
    } completion:^(BOOL finished) {
        DHomeBlockView *homeBlockView = [homeGoodsAllCell.viewBlocks objectAtIndex:homeBlockId];
        DHomeProductBlockView *productBlockView = [homeBlockView.blocks objectAtIndex:blockId];
        
        productBlockView.productImageView.image = _animationImageView.image;
        productBlockView.productImageView.hidden = NO;
        [_animationImageView removeFromSuperview];
    }];
}

- (void)openCateGoodsList:(int)cateId andTitle:(NSString*)title {
    UIColor *bgColor = [UIColor colorWithRed:64./255.0 green:138.0/255 blue:57.0/255. alpha:1.0];
    [_theSearchBar resetPropertyByBgColor:bgColor andplaceHolderColor:[UIColor whiteColor] andLeftImageName:@""];
    [_saleCateController closeViewController:^(BOOL isFinish){
        [_saleCateController.view removeFromSuperview];
        for (UIView *view in [_saleCateController.view subviews]) {
            [view removeFromSuperview];
        }
        
        _leftCloseItem.customView.hidden = YES;
        [self.navigationController.navigationBar addSubview:_theSearchBar];
        [self.navigationController.navigationBar addSubview:_homeShopController.view];
        [[DHomeLevelController sharedInstance]setupLeftMenuButton];
        [[DMainRootContrller sharedManager]setOpenDrawerGesture:YES];
        
        DHomeAllController *homeAllController = [_navigation.viewControllers objectAtIndex:0];
        [homeAllController resetLayout];
        
        DHomeAllController *allController = [_navigation.viewControllers objectAtIndex:0];
        [allController openMoreCateGoods:cateId andTitle:title];
    }];
}



/**
 * 商品列表项被长按
 */
- (void)doGoodsLongPress:(NSNotification *)notification {
    DHomeProductBlockView *blockView = notification.object;
    UIView *bgimage = blockView.imageBgView;
    
    NSDictionary *userInfo = notification.userInfo;
    DHomeGoods *homeGoods = [userInfo objectForKey:@"DetailForm"];
    
    CGRect startFrame = [blockView convertRect:bgimage.frame toView:self.navigationController.view];
    CGRect startFrame_ = [bgimage convertRect:blockView.productImageView.frame toView:blockView];
    
    UIView *bgImageView = [[UIView alloc]initWithFrame:startFrame];
    [bgImageView setBackgroundColor:[UIColor whiteColor]];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:startFrame_];
    imageView.image = blockView.productImageView.image;
    [bgImageView addSubview:imageView];
    
    bgImageView.userInteractionEnabled = NO;
    imageView.userInteractionEnabled = NO;
    
    [self startAddCarFun:bgImageView blockFrom:homeGoods];
}

/**
 * 长按拖动
 */
- (void)doGoodsLongChange:(NSNotification *)notification {
    UIGestureRecognizer *gestureRecognizer = notification.object;
    CGPoint point = [gestureRecognizer locationInView:self.navigationController.view];

    DAddCarView *addCarView = [[self.navigationController.view subviews] lastObject];
    UIView *view = [[addCarView subviews]lastObject];
    [view setCenter:point];
    [addCarView scalingByMoveY:point.y];
}

/**
 * 长按释放
 */
- (void)doGoodsLongEnd:(NSNotification *)notification {
    DAddCarView *addCarView = [[self.navigationController.view subviews] lastObject];
    
    NSDictionary *userInfo = notification.userInfo;
    DGoodDetailForm *blockFrom = [userInfo objectForKey:@"DetailForm"];

    [addCarView moveAndEndAddCar:^(BOOL isAddCar) {
        for (UIView *view in [addCarView subviews])
            [view removeFromSuperview];
        [addCarView removeFromSuperview];
        
        [[DMainRootContrller sharedManager]setOpenDrawerGesture:YES];
        
        if (isAddCar) {
            [[TServerFactory getServerInstance:@"DGoodsServer"]addGoods:blockFrom.serverId title:blockFrom.title sellPrice:[blockFrom.sellPrice floatValue] imageUrl:blockFrom.imageUrl addNum:1];
            [_homeShopController updateRemindNum];
            
            DHomeProductBlockView *blockView = notification.object;
            UILabel *addNumLabel = [[[blockView addNumImageView] subviews]lastObject];
            int newAddNum = [addNumLabel.text intValue] + 1;
            [addNumLabel setText:[NSString stringWithFormat:@"%i",newAddNum]];
            [blockView addNumImageView].hidden = NO;
        }
    }];
}

/**
 * 开启加购物车功能
 */
- (void)startAddCarFun:(UIView*)bgImageView blockFrom:(DHomeGoods*)blockFrom {
    DAddCarView *addCarView = [[DAddCarView alloc]initWithFrame:CGRectMake(0, 0, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height) andGoodView:bgImageView];
    [self.navigationController.view addSubview:addCarView];

    [[DMainRootContrller sharedManager]setOpenDrawerGesture:NO];
}


- (void)dealloc {
    // 商品点击
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"NotificationGoodsClicked" object:nil];
    
    // 商品长按
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"NotificationGoodsLongPress" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"NotificationGoodsLongChange" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"NotificationGoodsLongEnd" object:nil];
    
    //
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"NotificationStartAnimation" object:nil];
}

@end

//
//  DCateListViewController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DCateListViewController.h"
#import "DCateSectionTopView.h"
#import "DCateSectionView.h"
#import "DCate.h"
#import "DCateViewCell.h"
#import "DSaleCateServer.h"
#import "DHomeLevelController.h"


@implementation DCateListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:1.0]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.]];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _goodDatas = [[NSMutableArray alloc]init];
    _sectionViews = [[NSMutableArray alloc]init];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cateLeves.count>0?_cateLeves.count+1:0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.view.tag == section && section != 0) {
        return _goodDatas.count;
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    float h = [self tableView:tableView heightForHeaderInSection:section];
    
    UIView *sectionView;
    if (_sectionViews.count > section) {
        sectionView = [_sectionViews objectAtIndex:section];
    }
    
    if (sectionView == nil) {
        if (section == 0) {
            sectionView = [[DCateSectionTopView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, h)];
            [_sectionViews addObject:sectionView];
        } else {
            sectionView = [[DCateSectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, h) andDelegate:self];
            [_sectionViews addObject:sectionView];
        }
    }
    
    if (section != 0) {
        DCate *cate = [_cateLeves objectAtIndex:section-1];
        [(DCateSectionView*)sectionView setDataForView:cate andIndex:section-1];
    }
    

    return sectionView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        cell = [[DCateViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    DCate *cate = [_cateLeves objectAtIndex:indexPath.section-1];
    DCate *childCate = [cate.childCate objectAtIndex:indexPath.row];
    [((DCateViewCell*)cell) setDataForCell:childCate];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) return 55;
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DCateViewCell heightForCell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DCate *cate = [_cateLeves objectAtIndex:indexPath.section-1];
    DCate *childCate = [cate.childCate objectAtIndex:indexPath.row];

    [[DHomeLevelController sharedInstance]openCateGoodsList:5 andTitle:childCate.cateTitle];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _cateLeves = [[TServerFactory getServerInstance:@"DSaleCateServer"]selectFirstLevel];
    
    [self.tableView beginUpdates];
    [self.tableView insertSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange (0, _cateLeves.count+1)]
                  withRowAnimation:UITableViewRowAnimationBottom];
    [self.tableView endUpdates];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.tableView setBackgroundColor:[UIColor colorWithRed:250./255 green:249./255 blue:246./255 alpha:1.0]];
}

- (void)removeAllRow:(void(^)(BOOL isFinish))callback {
    int rows = _cateLeves.count;
    [_cateLeves removeAllObjects];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        ((void(^)(BOOL))callback)(YES);
    }];
    
    [self.tableView beginUpdates];
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, rows+1)] withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
    [CATransaction commit];
}

- (void)doTouchSecton:(UITapGestureRecognizer*)gesture {
    [self.tableView setBackgroundColor:[UIColor colorWithRed:250./255 green:249./255 blue:246./255 alpha:1.0]];
    BOOL isCollect = NO;
    if (_goodDatas.count > 0) isCollect = YES;
    [_goodDatas removeAllObjects];
    
    int newSelectIndex = gesture.view.tag + 1;
    int oldSelectIndex = self.view.tag;
    
    if (!isCollect) {
        self.view.tag = newSelectIndex;
        [self expandRowBySection:newSelectIndex];
    } else {
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            if (oldSelectIndex != newSelectIndex) {
                self.view.tag = newSelectIndex;
                [self expandRowBySection:newSelectIndex];
            }
        }];
        
        [self collectBySection:oldSelectIndex];
        [CATransaction commit];
    }
}

- (void)expandRowBySection:(int)sectionIndex {
    DCate *cate = [_cateLeves objectAtIndex:sectionIndex-1];
    [_goodDatas addObjectsFromArray:cate.childCate];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                  withRowAnimation:UITableViewRowAnimationFade];
    
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:sectionIndex];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)collectBySection:(int)sectionIndex {
    [self.tableView beginUpdates];
    NSMutableArray *indexPaths = [[NSMutableArray alloc]init];
    
    DCate *cate = (DCate*)[_cateLeves objectAtIndex:sectionIndex-1];
    NSArray *levels = cate.childCate;
    for (int i=0;i<levels.count;i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:sectionIndex];
        [indexPaths addObject:indexPath];
    }
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
}

@end

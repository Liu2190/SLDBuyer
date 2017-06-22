//
//  DSaleListViewController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-3.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DSaleListViewController.h"

@implementation DSaleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    _saleLeves = [[NSMutableArray alloc]init];

}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _saleLeves.count>0?_saleLeves.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    for (int i=0; i<3; i++) {
        NSString *s = [[NSString alloc] initWithFormat:@"hello %d",i];
        [_saleLeves addObject:s];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexPaths addObject: indexPath];
    }
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    
    [self.tableView setBackgroundColor:[UIColor colorWithRed:250./255 green:249./255 blue:246./255 alpha:1.0]];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.tableView setBackgroundColor:[UIColor colorWithRed:250./255 green:249./255 blue:246./255 alpha:1.0]];
}

- (void)removeAllRow:(void(^)(BOOL isFinish))callback {
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];

    for (int i=0; i<_saleLeves.count; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    
    [CATransaction begin];
    
    [CATransaction setCompletionBlock:^{
        ((void(^)(BOOL))callback)(YES);
    }];
    
    [_saleLeves removeAllObjects];
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
    
    [CATransaction commit];
    
}

@end

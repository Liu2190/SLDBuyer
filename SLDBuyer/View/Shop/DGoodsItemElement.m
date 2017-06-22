//
//  DGoodsItemElement.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-19.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DGoodsItemElement.h"
#import "UIImageView+MJWebCache.h"
#import "DGoodsItemViewCell.h"

@implementation DGoodsItemElement

- (id)initWithGoods:(DGoods*)goods {
    self = [super init];
    self.goods = goods;
    
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    DGoodsItemViewCell *cell = (DGoodsItemViewCell *) [super getCellForTableView:tableView controller:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setDataForCell:_goods];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    DGoodsItemViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    if (cell == nil){
        cell = [[DGoodsItemViewCell alloc] initWithReuseIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    }
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return _height > 0 ? _height : 80;
}

@end

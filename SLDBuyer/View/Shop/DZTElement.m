//
//  DZTElement.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-19.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DZTElement.h"
#import "DZTViewCell.h"

@implementation DZTElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    DZTViewCell *cell = (DZTViewCell *) [super getCellForTableView:tableView controller:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setBackgroundColor:[UIColor colorWithRed:255./255. green:252./255. blue:230/255. alpha:1.0f]];
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    DZTViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    if (cell == nil){
        cell = [[DZTViewCell alloc] initWithReuseIdentifier:
                [NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
        
    }
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return _height > 0 ? _height : 100;
}

@end

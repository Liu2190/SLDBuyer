//
//  DChecklistElement.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-18.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DChecklistElement.h"

@implementation DChecklistElement


- (QLabelElement *)initWithTitle:(NSString *)title Value:(id)value {
    self = [super initWithTitle:title Value:value];
    
    _isSelected = NO;
    _animationFlag = YES;
    
    _indicatorView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 13, 13)];
    [_indicatorView setImage:[UIImage imageNamed:@"Shop_Indicator.png"]];
    
    return self;
}

- (QRootElement *)init {
    self = [super init];
    _isSelected = NO;
    _animationFlag = YES;
    
    _indicatorView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 13, 13)];
    [_indicatorView setImage:[UIImage imageNamed:@"Shop_Indicator.png"]];
    
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView
                              controller:(QuickDialogController *)controller {
    
    QTableViewCell *cell = (QTableViewCell *) [super getCellForTableView:tableView controller:controller];
    cell.accessoryView.autoresizesSubviews = NO;
    cell.accessoryView = _indicatorView;
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)selected:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller indexPath:(NSIndexPath *)path {
    if(!_animationFlag) return;
    
    _animationFlag = NO;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
    UIView *accessoryView = cell.accessoryView;
    
    [UIView animateWithDuration:.3 delay:0 options:0 animations: ^{
        if (_isSelected)accessoryView.transform = CGAffineTransformRotate(accessoryView.transform, M_PI_2);
        else accessoryView.transform = CGAffineTransformRotate(accessoryView.transform, -M_PI_2);
    } completion: ^(BOOL completed) {
        _animationFlag = YES;
        _isSelected = !_isSelected;
        _onSelected();
    }];
}


- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return _height > 0 ? _height : 40;
}

@end

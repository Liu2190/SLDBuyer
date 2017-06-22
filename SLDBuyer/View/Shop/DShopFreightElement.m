//
//  DShopFreightElement.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-19.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DShopFreightElement.h"

#define labelFont_size  14
#define image_size      10

@implementation DShopFreightElement

- (QRootElement *)init {
    self = [super init];
    self.plusValue = 10.00f;
    
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    QTableViewCell *cell = (QTableViewCell *) [super getCellForTableView:tableView controller:controller];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    _plusValue = 10.00;
    
    return cell;
}

- (QTableViewCell *)getOrCreateEmptyCell:(QuickDialogTableView *)tableView {
    QTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
    if (cell == nil){
        cell = [[QTableViewCell alloc] initWithReuseIdentifier:
                [NSString stringWithFormat:@"QuickformElementCell%@%@", self.key, self.class]];
        
        UILabel *plusLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 15)];
        [plusLabel setText:@"运费:"];
        [plusLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
        plusLabel.textAlignment = NSTextAlignmentLeft;
        [plusLabel setTextColor:[UIColor grayColor]];
        plusLabel.lineBreakMode = NSLineBreakByWordWrapping;
        plusLabel.numberOfLines = 1;
        [plusLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:plusLabel];
        
        UILabel *reduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 33, 100, 15)];
        [reduceLabel setText:@"减免:"];
        [reduceLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
        reduceLabel.textAlignment = NSTextAlignmentLeft;
        [reduceLabel setTextColor:[UIColor grayColor]];
        reduceLabel.lineBreakMode = NSLineBreakByWordWrapping;
        reduceLabel.numberOfLines = 1;
        [reduceLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:reduceLabel];
        
        UILabel *plusLabel_ = [[UILabel alloc]initWithFrame:CGRectMake(150, 13, 15, 15)];
        [plusLabel_ setText:@"+"];
        [plusLabel_ setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
        plusLabel_.textAlignment = NSTextAlignmentLeft;
        [plusLabel_ setTextColor:[UIColor grayColor]];
        plusLabel_.lineBreakMode = NSLineBreakByWordWrapping;
        plusLabel_.numberOfLines = 1;
        [plusLabel_ setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:plusLabel_];
        
        UILabel *reduceLabel_ = [[UILabel alloc]initWithFrame:CGRectMake(151, 33, 20, 15)];
        [reduceLabel_ setText:@"-"];
        [reduceLabel_ setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
        reduceLabel_.textAlignment = NSTextAlignmentLeft;
        [reduceLabel_ setTextColor:[UIColor grayColor]];
        reduceLabel_.lineBreakMode = NSLineBreakByWordWrapping;
        reduceLabel_.numberOfLines = 1;
        [reduceLabel_ setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:reduceLabel_];
        
        
        UILabel *plusValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 13, 100, 15)];
        [plusValueLabel setText:[NSString stringWithFormat:@"￥%.2f,",_plusValue]];
        [plusValueLabel setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
        plusValueLabel.textAlignment = NSTextAlignmentLeft;
        [plusValueLabel setTextColor:[UIColor grayColor]];
        plusValueLabel.lineBreakMode = NSLineBreakByWordWrapping;
        plusValueLabel.numberOfLines = 1;
        [plusValueLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:plusValueLabel];
        
        UILabel *reduceValueLabel_ = [[UILabel alloc]initWithFrame:CGRectMake(250, 33, 100, 15)];
        [reduceValueLabel_ setText:@"￥2.00"];
        [reduceValueLabel_ setFont:[UIFont fontWithName:@"Heiti SC" size:labelFont_size]];
        reduceValueLabel_.textAlignment = NSTextAlignmentLeft;
        [reduceValueLabel_ setTextColor:[UIColor grayColor]];
        reduceValueLabel_.lineBreakMode = NSLineBreakByWordWrapping;
        reduceValueLabel_.numberOfLines = 1;
        [reduceValueLabel_ setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:reduceValueLabel_];
    }
    
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return _height > 0 ? _height : 60;
}

@end

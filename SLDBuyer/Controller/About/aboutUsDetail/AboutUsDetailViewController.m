//
//  AboutUsDetailViewController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "AboutUsDetailViewController.h"
#import "AboutMeFirstCell.h"
#import "AboutMeIntroduceCell.h"
#import "AboutUsServer.h"

@interface AboutUsDetailViewController ()
@property (nonatomic,retain)NSArray *titleArray;
@property (nonatomic,retain)NSMutableArray *contentArray;
@end

@implementation AboutUsDetailViewController
-(id)init
{
    self = [super init];
    if(self)
    {
       self.title = @"关于我们";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleArray = @[@"公司介绍",@"品质保证"];
    self.contentArray = [[NSMutableArray alloc]initWithObjects:@"公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍",@"品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证品质保证",nil];
    //[[DUtilities sharedInstance]popTarget:self.view status:@"提交中......"];
    [[TServerFactory getServerInstance:@"AboutUsServer"]doGetAbountDataByCallback:^(NSArray *rep)
     {
         [self.contentArray removeAllObjects];
         [self.contentArray addObjectsFromArray:rep];
       //  [self.tableView reloadData];
         
     } failureCallback:^(NSString *resp) {
         [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
             
         }];
     }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
      return 102.0f;
    }
    if(indexPath.row == 1)
    {
        return [self heightForString:[self.contentArray objectAtIndex:0] fontSize:[UIFont systemFontOfSize:13] andWidth:280]+60.0f;
    }
    return [self heightForString:[self.contentArray objectAtIndex:1] fontSize:[UIFont systemFontOfSize:13] andWidth:280]+60.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    if(indexPath.row == 0)
    {
        AboutMeFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"AboutMeFirstCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
    AboutMeIntroduceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AboutMeIntroduceCell" owner:self options:nil]lastObject];
    }
    [cell setCellWithTitle:[self.titleArray objectAtIndex:indexPath.row - 1] AndContent:[self.contentArray objectAtIndex:indexPath.row -1]];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (float)heightForString:(NSString *)value fontSize:(UIFont *)font andWidth:(float)width
{
    CGSize size = CGSizeMake(300, 20000.0f);
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0)//IOS 7.0 以上
    {
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
        size =[value boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }
    else
    {
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
        size =[value boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }
    float ch = size.height;
    return ch;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

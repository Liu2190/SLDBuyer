//
//  DAboutLevelController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-21.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DAboutLevelController.h"
#import "AboutUsDetailViewController.h"
#import "SharePlatformView.h"
#import "FeedBackViewController.h"
#import "NSString+SBJSON.h"
#import "AbountCell.h"
#import "AboutUsServer.h"

#define AboutUsCell 0
#define FeedBackCell 1
#define ShareCell 2
#define GradeCell 3
#define UpdateCell 4
@implementation DAboutLevelController


+ (id)sharedInstance {
    static DAboutLevelController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DAboutLevelController alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    self.menuTitle = @"关于我们";
    self.menuImage = @"Bracket_About.png";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    self.view.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:249.0/255.0 blue:246.0/255.0 alpha:1];
    dataArray = @[@"关于我们",@"意见反馈",@"喜欢尚超市BHG分享给好友",@"喜欢尚超市BHG打分鼓励下",@"检查更新"];
    NSString *versionNum=[NSString stringWithFormat:@"当前版本:V%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    detailArray = @[@"",@"",@"",@"",versionNum];
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-([[[UIDevice currentDevice]systemVersion]compare:@"7.0"]==NSOrderedAscending ?44.0f:64.0f)) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor clearColor];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 12)];
    v.backgroundColor = [UIColor clearColor];
    return v;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    AbountCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AbountCell" owner:self options:nil]lastObject];
    }
    cell.titleLabel.text = [dataArray objectAtIndex:indexPath.row];
    cell.contentLabel.text = [detailArray objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == AboutUsCell)
    {//关于我们
        AboutUsDetailViewController *aVC = [[AboutUsDetailViewController alloc]init];
        [self.navigationController pushViewController:aVC animated:YES];
    }
    if(indexPath.row == FeedBackCell)
    {//意见反馈
        FeedBackViewController *fbVC = [[FeedBackViewController alloc]init];
        [self.navigationController pushViewController:fbVC animated:YES];
        
    }
    if(indexPath.row == ShareCell)
    {//分享
        SharePlatformView *shareView = [[SharePlatformView alloc]initWithTitle:nil target:self AndShareTitle:nil AndShareContent:nil AndImage:nil];
        [shareView showInView:self.view];
    }
    if(indexPath.row == GradeCell)
    {
        //打分鼓励
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id764279408"]];
    }
    if(indexPath.row == UpdateCell)
    {
        //检查更新
        [self onCheckVersion];
    }
}
-(void)onCheckVersion
{
    [[TServerFactory getServerInstance:@"AboutUsServer"]doGetVersionThingsByCallback:^(NSDictionary *dict)
     {
         if([[dict objectForKey:@"status"] intValue]==1)
         {
             XDAlertView *ale  = [[XDAlertView alloc]initWithTitle:[NSString stringWithFormat:@"发现新版本：V%@",[dict objectForKey:@"version"]] message:[dict objectForKey:@"message"] delegate:self cancelButtonTitle:@"去升级" otherButtonTitles:@"取消",nil];
             [ale show];
         }
         if([[dict objectForKey:@"status"] intValue]!=1)
         {
             XDAlertView *ale  = [[XDAlertView alloc]initWithTitle:@"提示" message:@"当前版本已是最新版本，祝您使用愉快。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
             [ale show];
         }
         
     } failureCallback:^(NSString *resp) {
         [[DUtilities sharedInstance]popMessageError:@"网络连接错误，提交失败，请稍候重试" target:self.view completion:^(BOOL isFinish) {
             
         }];
     }];
}
- (void)xdAlertViewClickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        NSURL *url = [NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id764279408"];
        [[UIApplication sharedApplication]openURL:url];
    }
}
@end

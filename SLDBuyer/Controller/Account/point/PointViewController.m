//
//  PointViewController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-30.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "PointViewController.h"
#import "PointCell.h"
#import "AccountServer.h"

@interface PointViewController ()
@property (nonatomic,assign)float pointCount;
@end

@implementation PointViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"积分";
        self.headerViewHeight = 50.0f;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[TServerFactory getServerInstance:@"AccountServer"] doGetUserPointByCallback:^(NSString  *point){
        self.pointCount = [point floatValue];
        [self.tableView reloadData];
    }failureCallback:^(NSString *resp){
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
        }];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    PointCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PointCell" owner:self options:nil]lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCellValue:self.pointCount];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

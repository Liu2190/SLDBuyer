//
//  AddressManageController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//  整个表视图有三个Section 分别展示地址列表 地址列表为空 以及新建地址

#import "AddressManageController.h"
#import "AddressListCell.h"
#import "AccountLoginCell.h"
#import "CreateNewAddressController.h"
#import "EditAddressViewController.h"
#import "AccountServer.h"
#import "AddressListModel.h"
#import "AddressEmptyCell.h"

#define list_section    0
#define empty_section   1
#define create_section  2
#define section_count   3
@interface AddressManageController ()<UIAlertViewDelegate>
{
    int _editCellNum;
    BOOL isEmpty;
}
@property (nonatomic,retain)UIBarButtonItem *rightItem;
@property (nonatomic,assign)BOOL isEditing;
@end

@implementation AddressManageController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"地址管理";
        self.isEditing = NO;
        isEmpty = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.datas removeAllObjects];
    self.rightItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(doEditAction)];
    self.navigationItem.rightBarButtonItem= self.rightItem;
   /* [[TServerFactory getServerInstance:@"AccountServer"]doGetAddressListByCallBack:^(NSMutableArray *array) {
        [self.datas addObjectsFromArray:array];
        [self.tableView reloadData];
    } failureCallback:^(NSString *resp) {
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
            [self.tableView reloadData];
        }];
    }];*/
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == list_section)
    {
        return self.datas.count;
    }
    if(section == empty_section)
    {
        return (self.datas.count == 0?1:0);
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return section_count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == list_section)
    {
        return 120.0f;
    }
    else if (indexPath.section == empty_section)
    {
        return 220.0f;
    }
    return 200.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    if(indexPath.section == create_section)
    {
        AccountLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"AccountLoginCell" owner:self options:nil]lastObject];
        }
        cell.tipLabel.text = @"新建地址";
        cell.logOffButton.backgroundColor = [UIColor colorWithRed:65.0/255.0 green:133.0/255.0 blue:57.0/255.0 alpha:1];
        cell.editing = NO;
        [cell.logOffButton addTarget:self action:@selector(createNewAddress) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    if(indexPath.section == list_section)
    {
        AddressListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"AddressListCell" owner:self options:nil]lastObject];
        }
        AddressListModel *model = (AddressListModel *)[self.datas objectAtIndex:indexPath.row];
        [cell setCellValueWith:model];
        return cell;
    }
    AddressEmptyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AddressEmptyCell" owner:self options:nil]lastObject];
    }
    return cell;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"确定删除该收货地址？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [al show];
    _editCellNum = indexPath.row;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        AddressListModel *model = (AddressListModel *)[self.datas objectAtIndex:_editCellNum];
        [[TServerFactory getServerInstance:@"AccountServer"]doDeleteAddressBy:model.addressID AndCallBack:^(int status) {
            if(status == 0)
            {
                [self.datas removeObjectAtIndex:_editCellNum];
                NSIndexPath *path = [NSIndexPath indexPathForRow:_editCellNum inSection:0];
                [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
            }
            else
            {
                [[DUtilities sharedInstance]popMessage:@"删除失败" target:self completion:^(BOOL isFinish) {
                }];
            }
        } failureCallback:^(NSString *resp) {
            [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
            }];
        }];
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
-(void)doEditAction
{
    self.isEditing = !self.isEditing;
    self.rightItem.title = ((self.isEditing== NO)?@"编辑": @"完成");
    [self.tableView setEditing:self.isEditing animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EditAddressViewController *edi = [[EditAddressViewController alloc]init];
    [self.navigationController pushViewController:edi animated:YES];

}
-(BOOL)tableView:(UITableView *) tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0?YES:NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createNewAddress
{
    CreateNewAddressController *cvc = [[CreateNewAddressController alloc]init];
    [self.navigationController pushViewController:cvc animated:YES];
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

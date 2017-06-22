//
//  EditAddressViewController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-6-4.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "EditAddressViewController.h"
#import "CreateAddressView.h"
#import "PickerView.h"
#import "keyBoardView.h"
#import "AccountServer.h"
#import "SaveAndDeleteCell.h"
#import "XDAlertView.h"

@interface EditAddressViewController ()<UITextFieldDelegate,UITableViewDelegate,PickerViewSelectAreaDelegate,XDAlertViewDelegate>
{
    BOOL enable;
    BOOL textStatus;
}
@property (nonatomic,retain)CreateAddressView *createView;

@end

@implementation EditAddressViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"编辑地址";
        enable = YES;
        textStatus = NO;
        self.headerViewHeight = 35;
        self.model = [[AddressListModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.createView = [[[NSBundle mainBundle]loadNibNamed:@"CreateAddressView" owner:self options:nil]lastObject];
    self.createView.frame = CGRectMake(0, 0, self.view.frame.size.width, 400);
    self.createView.delegate = self;
    [self.createView.showAreaButton addTarget:self action:@selector(showDetailArea) forControlEvents:UIControlEventTouchUpInside];
    [self addInputAccessoryView];
    [self.createView setViewValueWith:self.model];
}
-(void)finishAction
{
    [self.view endEditing:YES];
    [self checkIfCanSave:textStatus];
}
-(void)cancelAction
{
    [self.view endEditing:YES];
    [self checkIfCanSave:textStatus];
}
-(void)showDetailArea
{
    [self.view endEditing:YES];
    PickerView *picker = [[PickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    picker.delegate = self;
    [picker showInView:self.view];
}
-(void)pickerViewDidSelectedArea:(NSString *)areaName
{
    self.createView.areaLabel.text = areaName;
    [self checkIfCanSave:textStatus];
    self.model.areaName = areaName;
}
-(void)doDeleteAction
{
    XDAlertView *al = [[XDAlertView alloc]initWithTitle:@"确定删除该地址？" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [al show];
}
-(void)xdAlertViewClickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        [[TServerFactory getServerInstance:@"AccountServer"] doDeleteAddressBy:self.model.addressID  AndCallBack:^(int status){
            if(status == 0)
            {
                [[DUtilities sharedInstance]popMessage:@"删除成功" target:self completion:^(BOOL isFinish) {
                    [self.navigationController popViewControllerAnimated:YES];
                }];
            }
        }failureCallback:^(NSString *resp){
            [[DUtilities sharedInstance]popMessageError:@"成功退出登录账号" target:self completion:^(BOOL isFinish) {
            }];
        }]; 
    }
}
//保存
-(void)doSaveAction
{
    [[TServerFactory getServerInstance:@"AccountServer"] doEditAddressBy:self.model AndCallBack:^(int status){
        if(status == 0)
        {
            [[DUtilities sharedInstance]popMessage:@"修改成功" target:self completion:^(BOOL isFinish) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }
    }failureCallback:^(NSString *resp){
        [[DUtilities sharedInstance]popMessageError:@"成功退出登录账号" target:self completion:^(BOOL isFinish) {
        }];
    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row == 0?400:120;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    if(indexPath.section == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell.contentView addSubview:self.createView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        return cell;
    }
    SaveAndDeleteCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SaveAndDeleteCell" owner:self options:nil]lastObject];
    }
    [cell.saveButton addTarget:self action:@selector(doSaveAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.deleteButton addTarget:self action:@selector(doDeleteAction) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setSaveButtonStatusWith:enable];
    return cell;
}
#pragma mark -
#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textView {
    [self.createView updateByTextField:textView];
}

- (void) textFieldDidChange:(UITextField *) textField{
    [self.createView updateByTextField:textField];
}
-(void)textViewDidChange:(UITextView *)textView
{
    [self.createView updateByTextView:textView];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self.createView updateByTextView:textView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)AllStatus:(BOOL)status AndData:(AddressListModel *)model
{
    textStatus = status;
    [self checkIfCanSave:textStatus];
    [self setmodelData:model];
}
-(void)checkIfCanSave:(BOOL)status
{
    enable = status && ([self.createView.areaLabel.text length]==0?NO :YES);
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
}
-(void)addInputAccessoryView
{
    keyBoardView *inputView = [[[NSBundle mainBundle]loadNibNamed:@"keyBoardView" owner:self options:nil]lastObject];
    self.createView.tipsField.cTextField.inputAccessoryView = inputView;
    self.createView.nameField.cTextField.inputAccessoryView = inputView;
    self.createView.phoneField.cTextField.inputAccessoryView = inputView;
    self.createView.detailAddressTextView.inputAccessoryView = inputView;
    [inputView addTarget:self finishAction:@selector(finishAction) cancelAction:@selector(cancelAction)];
}
-(void)setmodelData:(AddressListModel *)listModel
{
    self.model.addressName = listModel.addressName;
    self.model.userName = listModel.userName;
    self.model.tips = listModel.tips;
    self.model.phoneNum = listModel.phoneNum;
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

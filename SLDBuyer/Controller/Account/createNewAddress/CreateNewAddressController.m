//
//  CreateNewAddressController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-30.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "CreateNewAddressController.h"
#import "CreateAddressView.h"
#import "AccountLoginCell.h"
#import "PickerView.h"
#import "keyBoardView.h"
#import "AddressListModel.h"
#import "AccountServer.h"

@interface CreateNewAddressController ()<UITextFieldDelegate,UITextViewDelegate,PickerViewSelectAreaDelegate>
{
    BOOL enable;
    BOOL textStatus;
}
@property (nonatomic,retain)CreateAddressView *createView;
@property (nonatomic,retain)AddressListModel *model;
@end

@implementation CreateNewAddressController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"新建地址";
        enable = NO;
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
//保存
-(void)doSaveAction
{
    [[TServerFactory getServerInstance:@"AccountServer"] doCreateAddressBy:self.model AndCallBack:^(int status){
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
    return indexPath.section == 0?400:90;
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
    AccountLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AccountLoginCell" owner:self options:nil]lastObject];
    }
    cell.tipLabel.text = @"保存";
    [cell.logOffButton addTarget:self action:@selector(doSaveAction) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setLogOffButtonStatusWith:enable AndColor:[UIColor colorWithRed:65.0/255.0 green:133.0/255.0 blue:57.0/255.0 alpha:1]];
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

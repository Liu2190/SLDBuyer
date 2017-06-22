//
//  IndividualAccountController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-29.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "IndividualAccountController.h"
#import "AccountLoginCell.h"
#import "IndividualAccountCell.h"
#import "GenderView.h"
#import "BirthdayView.h"
#import "IndividualModel.h"
#import "AccountServer.h"

@interface IndividualAccountController ()<genderDelegate,birthdayViewDelegate,UITextFieldDelegate>
{
    BOOL isSaveHigh;
}

@property (nonatomic,retain)IndividualAccountCell *inCell;
@property (nonatomic,retain)IndividualModel *individual;
@end

@implementation IndividualAccountController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"个人账户";
        isSaveHigh = YES;
        self.headerViewHeight = 35;
        self.individual = [[IndividualModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.inCell = [[[NSBundle mainBundle]loadNibNamed:@"IndividualAccountCell" owner:self options:nil]lastObject];
    [[TServerFactory getServerInstance:@"AccountServer"]doGetIndividualInformationByCallBack:^(IndividualModel *ret) {
        self.individual = ret;
        [self.tableView reloadData];
    } failureCallback:^(NSString *resp) {
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
        }];
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?270:100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    if(indexPath.section == 0)
    {
        self.inCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(self.inCell == nil)
        {
            self.inCell = [[[NSBundle mainBundle]loadNibNamed:@"IndividualAccountCell" owner:self options:nil]lastObject];
        }
        self.inCell.nameTextField.delegate = self;
        self.inCell.emailTextField.delegate = self;
        self.inCell.selected = NO;
        self.inCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.inCell.genderButton addTarget:self action:@selector(showGenderView) forControlEvents:UIControlEventTouchUpInside];
        [self.inCell.birthButton addTarget:self action:@selector(showBirthView) forControlEvents:UIControlEventTouchUpInside];
        return self.inCell;
    }
    AccountLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AccountLoginCell" owner:self options:nil]lastObject];
    }
    cell.tipLabel.text = @"保存";
    [cell setLogOffButtonStatusWith:isSaveHigh AndColor:[UIColor colorWithRed:65.0/255.0 green:133.0/255.0 blue:57.0/255.0 alpha:1]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.logOffButton addTarget:self action:@selector(saveInforAction) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
//保存到服务器
-(void)saveInforAction
{
    [[TServerFactory getServerInstance:@"AccountServer"]doUpdateIndividualInforBy:self.individual AndCallBack:^(int status) {
        [[DUtilities sharedInstance]popMessage:@"修改成功" target:self completion:^(BOOL isFinish) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
    } failureCallback:^(NSString *resp) {
        [[DUtilities sharedInstance]popMessageError:resp target:self completion:^(BOOL isFinish) {
        }];
    }];
}
-(void)showGenderView
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.2 delay:0 options:0 animations: ^{
        self.inCell.genderImage.transform = CGAffineTransformRotate(self.inCell.genderImage.transform, M_PI_2);
    } completion: ^(BOOL completed) {
        GenderView *gender = [[GenderView alloc]init];
        gender.delegate = self;
        [gender showInView:self.view];
    }];
    
}
-(void)showBirthView
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.2 delay:0 options:0 animations: ^{
        self.inCell.birthImage.transform = CGAffineTransformRotate(self.inCell.birthImage.transform, M_PI_2);
    } completion: ^(BOOL completed) {
        BirthdayView *birth = [[BirthdayView alloc]init];
        birth.delegate = self;
        [birth showInView:self.view];
    }];
    
}
-(void)selectGenderWithButtonIndex:(NSInteger)index
{
    //0代表男，1代表女
    [UIView animateWithDuration:0.2 delay:0 options:0 animations: ^{
        self.inCell.genderImage.transform = CGAffineTransformRotate(self.inCell.genderImage.transform, - M_PI_2);
    } completion: ^(BOOL completed) {
        if(index == 0)
        {
            self.inCell.genderLabel.text = @"男";
        }
        if(index == 1)
        {
            self.inCell.genderLabel.text = @"女";
        }
        
    }];
}
-(void)birthdayViewSelectTime:(NSString *)time
{
    [UIView animateWithDuration:0.2 delay:0 options:0 animations: ^{
        self.inCell.birthImage.transform = CGAffineTransformRotate(self.inCell.birthImage.transform, - M_PI_2);
        
    } completion: ^(BOOL completed) {
        if([time length]>0)
        {
            self.inCell.birthlabel.text = time;
        }
    }];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == self.inCell.emailTextField)
    {
        [self judgeTextViewStatus:textField];
    }
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if(textField == self.inCell.emailTextField)
    {
        [self judgeTextViewStatus:textField];
    }
}
-(void)judgeTextViewStatus:(UITextField *)field
{
    if (field.text.length == 0)
    {
        isSaveHigh = YES;
    }
    else if([field.text isMatchedByRegex:EmailRegex]==NO) {
        isSaveHigh = NO;
    }
    else
    {
        isSaveHigh = YES;
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
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

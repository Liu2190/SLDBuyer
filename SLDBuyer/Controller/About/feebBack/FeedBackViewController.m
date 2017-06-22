//
//  FeedBackViewController.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-27.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "FeedBackViewController.h"
#import "FeedBackSelectView.h"
#import "FeedBackGroundView.h"
#import "keyBoardView.h"
#import "AboutUsServer.h"

@interface FeedBackViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic,retain)FeedBackGroundView *backView;
@property (nonatomic,retain)FeedBackSelectView *selectView;
@property (nonatomic,retain)UIView *selectBackView;
@end

@implementation FeedBackViewController

-(id)init
{
    self = [super init];
    if(self)
    {
        self.title = @"意见反馈";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:249.0/255.0 blue:246.0/255.0 alpha:1];
    self.selectBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.selectBackView.hidden = YES;
    self.selectBackView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    self.selectBackView.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:self.selectBackView];
    self.backView = [[[NSBundle mainBundle]loadNibNamed:@"FeedBackGroundView" owner:self options:nil] lastObject];
    self.backView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400);
    [self.backView.OKButton addTarget:self action:@selector(commitSuggestionAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backView];
    self.backView.suggestionTextView.delegate = self;
    self.backView.contactTextField.delegate = self;
    self.backView.userInteractionEnabled = YES;
    [self.backView checkButtonStatus:@""];
    keyBoardView *inputAccessoryView = [[[NSBundle mainBundle]loadNibNamed:@"keyBoardView" owner:self options:nil] lastObject];
    self.backView.suggestionTextView.inputAccessoryView = inputAccessoryView;
    self.backView.contactTextField.inputAccessoryView = inputAccessoryView;
    [inputAccessoryView addTarget:self finishAction:@selector(finishAction) cancelAction:@selector(cancelAction)];
    [self.backView.showSelectButton addTarget:self action:@selector(showSelectView) forControlEvents:UIControlEventTouchUpInside];
    self.selectView = [[[NSBundle mainBundle]loadNibNamed:@"FeedBackSelectView" owner:self options:nil]lastObject];
    self.selectView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 200);
    [self.selectView.cancelButton addTarget:self action:@selector(hideSelectView) forControlEvents:UIControlEventTouchUpInside];
    self.selectView.userInteractionEnabled = YES;
    [self.selectBackView addSubview:self.selectView];
    [self checkIfHasWords];
}
-(void)commitSuggestionAction
{
    [[DUtilities sharedInstance]popTarget:self.view];
    [[TServerFactory getServerInstance:@"AboutUsServer"]doCommitSuggestionWithContent:self.backView.suggestionTextView.text AndContact:self.backView.contactTextField.text callback:^(int status)
    {
        [[DUtilities sharedInstance]popMessageError:@"感谢您的宝贵建议" target:self completion:^(BOOL isFinish) {
            
        }];
        [self.navigationController popViewControllerAnimated:YES];
        
    } failureCallback:^(NSString *resp) {
        [[DUtilities sharedInstance]popMessageError:@"网络连接错误，提交失败，请稍候重试" target:self completion:^(BOOL isFinish) {
            
        }];
    }];

}
-(void)checkIfHasWords{
    NSString *words = [[NSUserDefaults standardUserDefaults]objectForKey:@"Suggestion"];
    if(words !=nil && [words length]!=0)
    {
        self.backView.suggestionTextView.text = words;
        self.backView.textViewPlaceholder.hidden = YES;
    }
    
}
-(void)finishAction
{
    [self.view endEditing:YES];
    [self setAnimationWithStartPoint:([[[UIDevice currentDevice]systemVersion]compare:@"7.0"]==NSOrderedAscending ?44.0f:64.0f)];
}
-(void)cancelAction
{
    [self.view endEditing:YES];
    [self setAnimationWithStartPoint:([[[UIDevice currentDevice]systemVersion]compare:@"7.0"]==NSOrderedAscending ?44.0f:64.0f)];
}
-(void)hideSelectView
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.2 animations:^{
        [self.selectView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 200)];
    } completion:^(BOOL finished) {
        self.selectBackView.hidden = YES;

    }];
}
-(void)showSelectView
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.25 animations:^{
        self.selectBackView.hidden = NO;
        [self.selectView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-200, [UIScreen mainScreen].bounds.size.width, 200)];
    } completion:^(BOOL finished) {
    }];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self setAnimationWithStartPoint:-100];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self setAnimationWithStartPoint:([[[UIDevice currentDevice]systemVersion]compare:@"7.0"]==NSOrderedAscending ?44.0f:64.0f)];
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self setAnimationWithStartPoint:0];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [[NSUserDefaults standardUserDefaults] setObject:textView.text forKey:@"Suggestion"];
    [self.backView checkButtonStatus:textView.text];
}
-(void)textViewDidChange:(UITextView *)textView
{
    [self.backView checkButtonStatus:textView.text];
    self.backView.tipLabel.text = [NSString stringWithFormat:@"%d/500",[self convertToInt:textView.text]];
    self.backView.textViewPlaceholder.hidden = (textView.text.length == 0?NO:YES);
}
-(void)setAnimationWithStartPoint:(float)point
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = point;
        self.view.frame = frame;
    } completion:^(BOOL finished) {
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-  (int)convertToInt:(NSString*)strtemp
{
    int i,n=[strtemp length],l=0,a=0,b=0;
    unichar c;
    for(i=0;i<n;i++)
    {
        c=[strtemp characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    return l+(int)ceilf((float)(a+b)/2.0);
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

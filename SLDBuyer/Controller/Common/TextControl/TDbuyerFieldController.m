//
//  TDbuyerFieldController.m
//  DBuyer
//
//  Created by dilei liu on 14-3-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "TDbuyerFieldController.h"

#define left_margin                 5
#define top_margin                  5

#define faceimage_width             20
#define faceimage_height            20

#define text_height                 20

#define validation_image_size       10

#define textlabel_fontsize          16
#define validaabel_fontsize         8

@implementation TDbuyerFieldController

- (id)initWithImageName:(NSString*)imageName andPlaceholder:(NSString*)placeholder andFrame:(CGRect)frame {
    self = [super init];
    [self setCommonProperty];
    
    self.imageName = imageName;
    self.placeholder = placeholder;
    self.frame = frame;
    
    return self;
}

- (id)initWithTextName:(NSString*)textName andPlaceholder:(NSString*)placeholder andFrame:(CGRect)frame {
    self = [super init];
    [self setCommonProperty];
    
    self.textName = textName;
    self.placeholder = placeholder;
    self.frame = frame;
    
    return self;
}


- (id)initWithPlaceholder:(NSString*)placeholder andFrame:(CGRect)frame {
    self = [super init];
    [self setCommonProperty];
    
    self.placeholder = placeholder;
    self.frame = frame;
    
    
    return self;
}

- (void)setCommonProperty {
    self.backgroundColor = [UIColor whiteColor];
    self.secureTextEntry = NO;
    self.isValidation = NO;
    _inputStatus = Input_Default;
    _isEdit = YES;
    
    self.validationAttached_yes =  [NSString stringWithFormat:@"%@.png",@"Login_validation_yes"];
    self.validationAttached_no =  [NSString stringWithFormat:@"%@.png",@"Login_validation_no"];
    
    _dbuyerTextField = [[TDbuyerTextField alloc]init];
    _textLabel = [[UILabel alloc]init];
    _textLabel.font = [UIFont systemFontOfSize:textlabel_fontsize];
    [_textLabel setBackgroundColor:[UIColor whiteColor]];
    [_textLabel setTextColor:[UIColor grayColor]];
    
    _validaLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _validaLabel.font = [UIFont systemFontOfSize:validaabel_fontsize];
    [_validaLabel setBackgroundColor:[UIColor clearColor]];
    [_validaLabel setTextColor:[UIColor orangeColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:_frame];
    [self.view setBackgroundColor:_backgroundColor];
    [self.view addSubview:_textLabel];
    [self.view addSubview:_validaLabel];
    
    float x = left_margin,y = (_frame.size.height-faceimage_width)/2;
    if (self.isValidation) y = _frame.size.height-5-faceimage_height;
    
    // 图片标识处理
    if (_imageName.length != 0) {
        x = left_margin;
        if (self.isValidation) y = _frame.size.height-5-faceimage_height;
        
        [self addFaceImageView:CGPointMake(x, y)];
        x += 20+faceimage_width;
    }
    
    if (_textName.length != 0) {
        x = left_margin;
        
        [self addTextLabel:CGPointMake(x, y)];
        x += 10+_textLabel.frame.size.width;
    }
    
    // 添加输入控件
    [self addDbuyerTextField:CGPointMake(x, y)];
    
    // 是否开启验证功能
    if (_isValidation) {
        x = _frame.size.width - 20 - validation_image_size/2;
        y = (_frame.size.height-validation_image_size)/2;
        [self addValidation:CGPointMake(x, y)];
    }
}

- (void)addTextLabel:(CGPoint)point {
    _textLabel.text = _textName;
    
    CGSize titleSize = CGSizeMake(200, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_textLabel.font, NSFontAttributeName,nil];
    titleSize =[_textLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    float y = (self.frame.size.height-titleSize.height)/2+1;
    if (self.isValidation) y  = point.y;
    
    [_textLabel setFrame:CGRectMake(point.x, y, titleSize.width, titleSize.height)];
}


- (void)addFaceImageView:(CGPoint)point {
    UIImageView *faceImageView = [[UIImageView alloc]initWithFrame:CGRectMake(point.x, point.y, faceimage_width, faceimage_height)];
    faceImageView.image = [UIImage imageNamed:_imageName];
    [self.view addSubview:faceImageView];
}

- (void)addDbuyerTextField:(CGPoint)point {
    float y = left_margin;
    if (_isValidation)  y = 30;
    if(_dbuyerTextField != nil)
    {
        [_dbuyerTextField setFrame:CGRectMake(point.x, point.y, _frame.size.width-point.x-y, text_height)];
        [_dbuyerTextField setPlaceholder:_placeholder];
        _dbuyerTextField.secureTextEntry = _secureTextEntry;
        if(self.existText.length >0)
        {
            _dbuyerTextField.text = self.existText;
        }
        [_dbuyerTextField setEnabled:_isEdit];
        if (!_dbuyerTextField.enabled) {
            [_dbuyerTextField setTextColor:[UIColor grayColor]];
        }
        [self.view addSubview:_dbuyerTextField];
        [_validaLabel setFrame:CGRectMake(point.x, point.y, 0, 0)];
    }
    if(_dbuyerTextView !=nil)
    {
        [_dbuyerTextView setFrame:CGRectMake(0, 10, _frame.size.width-point.x-y, _frame.size.height-10)];
        if(self.existText.length >0)
        {
            _dbuyerTextView.text = self.existText;
        }
        textViewPlaceHolder = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _dbuyerTextView.frame.size.width, 30)];
        textViewPlaceHolder.textColor = [UIColor lightGrayColor];
        textViewPlaceHolder.backgroundColor = [UIColor clearColor];
        textViewPlaceHolder.text = self.placeholder;
        [_dbuyerTextView addSubview:textViewPlaceHolder];
        //[_dbuyerTextView setPlaceholderWithString:self.placeholder];
        _dbuyerTextView.secureTextEntry = _secureTextEntry;
        [self.view addSubview:_dbuyerTextView];
        [_validaLabel setFrame:CGRectMake(0, point.y, 0, 0)];
    }
    
    
}

- (void)addValidation:(CGPoint)point {
    _validationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(point.x, point.y, validation_image_size, validation_image_size)];
    [self.view addSubview:_validationImageView];
}


- (void)addValidationAttached:(NSString*)attached_yes andAttach_no:(NSString*)attached_no {
    _validationAttached_yes =  attached_yes;
    _validationAttached_no =  attached_no;
}


- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    if(_dbuyerTextField != nil)
    {
        _dbuyerTextField.keyboardType = keyboardType;
    }
    if(_dbuyerTextView != nil)
    {
        _dbuyerTextView.keyboardType = keyboardType;
    }
}

- (void)setFont:(UIFont*)font {
    if(_dbuyerTextField !=nil)
    {
        [_dbuyerTextField setFont:font];
    }
    if(_dbuyerTextView !=nil)
    {
        [textViewPlaceHolder setFont:font];
        [_dbuyerTextView setFont:font];
    }
}

- (void)setTextFieldDelegate:(id)delegate {
    if(_dbuyerTextField != nil)
    {
       _dbuyerTextField.delegate = delegate;
    }
    if(_dbuyerTextView !=nil)
    {
        _dbuyerTextView.delegate = delegate;
    }
}

- (void)changeValidationValue:(InputTextFieldStatus)inputStatus andText:(NSString*)text {
    inputStatus = inputStatus;
    [self updateTextFieldStatus:inputStatus andText:text];
}

- (NSString*)getDbuyerTextFieldValue {
    if(_dbuyerTextField!=nil)
    {
        return _dbuyerTextField.text;
    }
    return _dbuyerTextView.text;
}

- (void)setDbuyerTextValue:(NSString*)textFieldValue {
    if(_dbuyerTextField!=nil)
    {
       _dbuyerTextField.text = textFieldValue;
    }
    if(_dbuyerTextView !=nil)
    {
        _dbuyerTextView.text = textFieldValue;
    }
}
/*
 * 更新控件状态
 */
- (void)updateTextFieldStatus:(InputTextFieldStatus)inputStatus andText:(NSString*)text {
    [_validaLabel setText:text];
    
    if(_dbuyerTextField != nil )
    {
        if (inputStatus == Input_Default) {
            [_validationImageView setImage:[UIImage imageNamed:@""]];
            [UIView animateWithDuration:.5 animations:^{
                [_validaLabel setFrame:CGRectMake(-200, 0, _validaLabel.frame.size.width, _validaLabel.frame.size.height)];
            } completion:^(BOOL finished) {
                [_validaLabel setFrame:CGRectMake(_dbuyerTextField.frame.origin.x, _dbuyerTextField.frame.origin.y, 0, 0)];
            }];
        }
        
        
        if (inputStatus == Input_NO) {
            [_validationImageView setImage:[UIImage imageNamed:_validationAttached_no]];
            
            CGSize titleSize = CGSizeMake(200, 20000.0f);
            NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_validaLabel.font, NSFontAttributeName,nil];
            titleSize =[_validaLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
            
            
            CGRect textRect = CGRectMake(_dbuyerTextField.frame.origin.x, 5, titleSize.width, titleSize.height);
            [UIView animateWithDuration:.5 animations:^{
                [_validaLabel setFrame:textRect];
            } completion:^(BOOL finished) {
            }];
        }
        
        
        if (inputStatus == Input_YES) {
            [_validationImageView setImage:[UIImage imageNamed:_validationAttached_yes]];
            
            [UIView animateWithDuration:.5 animations:^{
                [_validaLabel setFrame:CGRectMake(-200, 0, _validaLabel.frame.size.width, _validaLabel.frame.size.height)];
            } completion:^(BOOL finished) {
                [_validaLabel setFrame:CGRectMake(_dbuyerTextField.frame.origin.x, _dbuyerTextField.frame.origin.y, 0, 0)];
            }];
        }

    }
    if(_dbuyerTextView != nil)
    {
        if (inputStatus == Input_Default) {
            [_validationImageView setImage:[UIImage imageNamed:@""]];
            [UIView animateWithDuration:.5 animations:^{
                [_validaLabel setFrame:CGRectMake(-200, 0, _validaLabel.frame.size.width, _validaLabel.frame.size.height)];
            } completion:^(BOOL finished) {
                [_validaLabel setFrame:CGRectMake(_dbuyerTextView.frame.origin.x, _dbuyerTextView.frame.origin.y, 0, 0)];
            }];
        }
        
        
        if (inputStatus == Input_NO) {
            [_validationImageView setImage:[UIImage imageNamed:_validationAttached_no]];
            
            CGSize titleSize = CGSizeMake(200, 20000.0f);
            NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_validaLabel.font, NSFontAttributeName,nil];
            titleSize =[_validaLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
            
            
            
            CGRect textRect = CGRectMake(_dbuyerTextView.frame.origin.x, 0, titleSize.width, titleSize.height);
            
            
            [UIView animateWithDuration:.5 animations:^{
                [_validaLabel setFrame:textRect];
            } completion:^(BOOL finished) {
            }];
        }
        
        
        if (inputStatus == Input_YES) {
            [_validationImageView setImage:[UIImage imageNamed:_validationAttached_yes]];
            
            [UIView animateWithDuration:.5 animations:^{
                [_validaLabel setFrame:CGRectMake(-200, 0, _validaLabel.frame.size.width, _validaLabel.frame.size.height)];
            } completion:^(BOOL finished) {
                [_validaLabel setFrame:CGRectMake(_dbuyerTextView.frame.origin.x, _dbuyerTextView.frame.origin.y, 0, 0)];
            }];
        }

    }
}

- (void)cancelKeyboard {
    if(_dbuyerTextField !=nil )
    {
        [_dbuyerTextField resignFirstResponder];
    }
    if(_dbuyerTextView !=nil)
    {
        [_dbuyerTextView resignFirstResponder];
    }
}

- (void)setPlaceholderFontSize:(int)placeholderSize {
    if(_dbuyerTextField != nil)
    {
      [_dbuyerTextField setPlaceholder_size:placeholderSize];
    }
    if(_dbuyerTextView != nil)
    {
    }
}

- (TDbuyerTextField*)getDbuyerTextField {
    return _dbuyerTextField;
}

- (void)setEditForTextField:(BOOL)isEdit {
    _isEdit = isEdit;
}

- (id)initTextViewWithPlaceholder:(NSString*)placeholder andFrame:(CGRect)frame
{
    self = [super init];
    [self setTextViewCommonProperty];
    
    self.placeholder = placeholder;
    self.frame = frame;
    
    return self;
}
-(void)setTextViewCommonProperty
{
    self.backgroundColor = [UIColor whiteColor];
    self.secureTextEntry = NO;
    self.isValidation = NO;
    _inputStatus = Input_Default;
    _isEdit = YES;
    
    self.validationAttached_yes =  [NSString stringWithFormat:@"%@.png",@"Login_validation_yes"];
    self.validationAttached_no =  [NSString stringWithFormat:@"%@.png",@"Login_validation_no"];
    
    _dbuyerTextView = [[UITextView alloc]init];
    _dbuyerTextView.userInteractionEnabled = YES;
    _textLabel = [[UILabel alloc]init];
    _textLabel.font = [UIFont systemFontOfSize:textlabel_fontsize];
    [_textLabel setBackgroundColor:[UIColor whiteColor]];
    [_textLabel setTextColor:[UIColor grayColor]];
    
    _validaLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _validaLabel.font = [UIFont systemFontOfSize:validaabel_fontsize];
    [_validaLabel setBackgroundColor:[UIColor clearColor]];
    [_validaLabel setTextColor:[UIColor orangeColor]];
}
-(void)setTextViewPlaceHolderHiddenWithStatus:(BOOL)status
{
    if(status == YES)
    {
        textViewPlaceHolder.text = self.placeholder;
    }
    else
    {
        textViewPlaceHolder.text = @"";
    }
}
@end
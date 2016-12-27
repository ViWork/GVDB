//
//  GVFindPasswordView.m
//  GVLogin
//
//  Created by BanWanXin on 2016/12/20.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "GVFindPasswordView.h"
#import "GVColor.h"
@implementation GVFindPasswordView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createSearchRouteView];
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}
-(void)createSearchRouteView
{
    //
    UIImageView* telImage = [[UIImageView alloc]init];
    telImage.image = [UIImage imageNamed:@"phone"];
    [self addSubview:telImage];
    
    [telImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(94);
        make.left.equalTo(self.mas_left).offset(12);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(19);
    }];
    
    
    _bwxtelText = [[UITextField alloc]init];
    _bwxtelText.backgroundColor = [UIColor whiteColor];
    _bwxtelText.placeholder = @"请输入手机号";
    _bwxtelText.font = [UIFont systemFontOfSize:15];
    _bwxtelText.delegate = self;
    
    //当编辑改变的时候，进行字符校验
    [_bwxtelText addTarget:self action:@selector(reformatAsPhoneNumber:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_bwxtelText];
    
    [_bwxtelText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(94);
        make.left.equalTo(self.mas_left).offset(42);
        make.right.equalTo(self.mas_right).offset(-12);
        make.height.mas_equalTo(19);
        make.baseline.mas_equalTo(352);
    }];
    
    UILabel* telLable = [[UILabel alloc]init];
    telLable.backgroundColor = [GVColor hexStringToColor:@"#dddddd"];
    [telImage addSubview:telLable];
    
    [telLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_bwxtelText.mas_bottom).offset(12);
        make.left.equalTo(telImage.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(-12);
        make.width.mas_equalTo(352);
        make.height.mas_equalTo(1);
    }];
    //
    UIImageView* varImage = [[UIImageView alloc]init];
    varImage.image = [UIImage imageNamed:@"cancel"];
    [self addSubview:varImage];
    
    [varImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(telImage.mas_bottom).offset(60);
        make.left.equalTo(self.mas_left).offset(12);
        make.width.mas_equalTo(19);
        make.height.mas_equalTo(19);
    }];
    _bwxVerText = [[UITextField alloc]init];
    _bwxVerText.backgroundColor = [UIColor whiteColor];
    _bwxVerText.placeholder = @"请输入验证码";
    _bwxVerText.font = [UIFont systemFontOfSize:15];
    [self addSubview:_bwxVerText];
    
    [_bwxVerText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(varImage.mas_top).offset(0);
        make.left.equalTo(varImage.mas_left).offset(30);
        make.right.equalTo(self.mas_right).offset(-150);
        make.height.mas_equalTo(19);
        make.baseline.mas_equalTo(352);
    }];
    UILabel* varLable = [[UILabel alloc]init];
    varLable.backgroundColor = [GVColor hexStringToColor:@"#dddddd"];
    [telImage addSubview:varLable];
    
    [varLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_bwxVerText.mas_bottom).offset(12);
        make.left.equalTo(varImage.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(-12);
        make.width.mas_equalTo(352);
        make.height.mas_equalTo(1);
    }];
    _bwxLoginBurron = [[UIButton alloc]init];
    [_bwxLoginBurron setTitle:@"确定" forState:UIControlStateNormal];
    _bwxLoginBurron.layer.masksToBounds = YES;
    _bwxLoginBurron.layer.cornerRadius = 16.5;
    _bwxLoginBurron.titleLabel.font = [UIFont systemFontOfSize:17];
    [_bwxLoginBurron setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    _bwxLoginBurron.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
    [self addSubview:_bwxLoginBurron];
    [_bwxLoginBurron mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(varLable.mas_top).offset(55);
        make.width.mas_equalTo(195);
        make.height.mas_equalTo(33);
        make.centerX.mas_equalTo([UIScreen mainScreen].bounds.size.width/2).offset(0);
        
    }];
    self.bwxVerButton = [[UIButton alloc]init];
    [self.bwxVerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.bwxVerButton setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    self.bwxVerButton.layer.masksToBounds = YES;
    self.bwxVerButton.layer.cornerRadius = 10.5;
    self.bwxVerButton.titleLabel.font = [UIFont systemFontOfSize: 12];
    self.bwxVerButton.layer.borderWidth = 1;
    self.bwxVerButton.layer.borderColor = [GVColor hexStringToColor:@"#ffba14"].CGColor;
    self.bwxVerButton.tintColor = [UIColor orangeColor];
    self.bwxVerButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bwxVerButton];
    [self.bwxVerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_bwxVerText.mas_bottom).offset(0);
        make.width.mas_equalTo(84);
        make.height.mas_equalTo(21);
        make.right.equalTo(self.mas_right).offset(-12);

        
    }];
}
-(void)reformatAsPhoneNumber:(UITextField *)textField {
    /**
     *  判断正确的光标位置
     */
    NSUInteger targetCursorPostion = [textField offsetFromPosition:textField.beginningOfDocument toPosition:textField.selectedTextRange.start];
    NSString *phoneNumberWithoutSpaces = [self removeNonDigits:textField.text andPreserveCursorPosition:&targetCursorPostion];
    
    
    if([phoneNumberWithoutSpaces length]>11) {
        /**
         *  避免超过11位的输入
         */
        
        [textField setText:__previousTextFieldContent];
        textField.selectedTextRange = __previousSelection;
        
        return;
    }
    
    
    NSString *phoneNumberWithSpaces = [self insertSpacesEveryFourDigitsIntoString:phoneNumberWithoutSpaces andPreserveCursorPosition:&targetCursorPostion];
    
    textField.text = phoneNumberWithSpaces;
    UITextPosition *targetPostion = [textField positionFromPosition:textField.beginningOfDocument offset:targetCursorPostion];
    [textField setSelectedTextRange:[textField textRangeFromPosition:targetPostion toPosition:targetPostion]];
    
}

/**
 *  除去非数字字符，确定光标正确位置
 *
 *  @param string         当前的string
 *  @param cursorPosition 光标位置
 *
 *  @return 处理过后的string
 */
- (NSString *)removeNonDigits:(NSString *)string andPreserveCursorPosition:(NSUInteger *)cursorPosition {
    NSUInteger originalCursorPosition =*cursorPosition;
    NSMutableString *digitsOnlyString = [NSMutableString new];
    
    for (NSUInteger i=0; i<string.length; i++) {
        unichar characterToAdd = [string characterAtIndex:i];
        
        if(isdigit(characterToAdd)) {
            NSString *stringToAdd = [NSString stringWithCharacters:&characterToAdd length:1];
            [digitsOnlyString appendString:stringToAdd];
        }
        else {
            if(i<originalCursorPosition) {
                (*cursorPosition)--;
            }
        }
    }
    return digitsOnlyString;
}

/**
 *  将空格插入我们现在的string 中，并确定我们光标的正确位置，防止在空格中
 *
 *  @param string         当前的string
 *  @param cursorPosition 光标位置
 *
 *  @return 处理后有空格的string
 */
- (NSString *)insertSpacesEveryFourDigitsIntoString:(NSString *)string andPreserveCursorPosition:(NSUInteger *)cursorPosition{
    NSMutableString *stringWithAddedSpaces = [NSMutableString new];
    NSUInteger cursorPositionInSpacelessString = *cursorPosition;
    
    for (NSUInteger i=0; i<string.length; i++) {
        if(i>0)
        {
            if(i==3 || i==7) {
                [stringWithAddedSpaces appendString:@"-"];
                
                if(i<cursorPositionInSpacelessString) {
                    (*cursorPosition)++;
                }
            }
        }
        
        unichar characterToAdd = [string characterAtIndex:i];
        NSString *stringToAdd = [NSString stringWithCharacters:&characterToAdd length:1];
        [stringWithAddedSpaces appendString:stringToAdd];
    }
    return stringWithAddedSpaces;
}

#pragma mark - UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    __previousSelection = textField.selectedTextRange;
    __previousTextFieldContent = textField.text;
    
    if(range.location==0) {
        if(string.integerValue >1)
        {
            return NO;
        }
    }
    
    return YES;
}



@end

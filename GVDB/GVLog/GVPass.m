//
//  GVPass.m
//  GVLogin
//
//  Created by Viosky on 2016/12/21.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "GVPass.h"
#import "GVPrefixHeader.pch"
@implementation GVPass
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
#pragma mark - 添加到父视图
        [self addSubview:self.userName];
        [self addSubview:self.telImage];
        [self addSubview:self.passWord];
        [self addSubview:self.passImage];
        [self addSubview:self.line_1];
        [self addSubview:self.line_2];
        [self addSubview:self.yanz];
        [self addSubview:self.retrieve];
        [self addSubview:self.lable];
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
#pragma mark - Masonry
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(40);
    }];
    [self.telImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(13.5);
        make.centerY.equalTo(self.userName.mas_centerY);
    }];
    [self.line_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.userName.mas_bottom).offset(20);
    }];

    [self.passWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line_1.mas_bottom).offset(20);
        make.left.equalTo(self.mas_left).offset(40);
    }];
    [self.passImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(13.5);
        make.centerY.equalTo(self.passWord.mas_centerY);
    }];

    [self.retrieve mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-24);
        make.centerY.equalTo(self.passWord.mas_centerY);
        make.height.mas_equalTo(24);
        make.width.mas_equalTo(80);
    }];
}

#pragma mark - 控件初始化
- (UITextField *)userName{
    if (!_userName) {
        UITextField *telText = [UITextField new];
        telText.placeholder = @"请输入您的账号";
        telText.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
        telText.font = [UIFont systemFontOfSize:14];
        self.userName = telText;
    }
    return _userName;
}

- (UITextField *)passWord{
    if (!_passWord) {
        UITextField *passText = [UITextField new];
        passText.placeholder = @"请输入您的密码";
        passText.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
        passText.font = [UIFont systemFontOfSize:14];
        self.passWord = passText;
    }
    return _passWord;
}

- (UIImageView *)telImage{
    if (!_telImage) {
        UIImageView *telImage = [UIImageView new];
        telImage.image = [UIImage imageNamed:@"account"];
        self.telImage = telImage;
    }
    return _telImage;
}

- (UIImageView *)passImage{
    if (!_passImage) {
        UIImageView *passImage = [UIImageView new];
        passImage.image = [UIImage imageNamed:@"password.png"];

        self.passImage = passImage;
    }
    return _passImage;
}

- (UIButton *)retrieve{
    if (!_retrieve) {
        UIButton *xiey = [UIButton new];
        [xiey setTitle:@"找回密码" forState:UIControlStateNormal];
        [xiey setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
        xiey.titleLabel.font = [UIFont systemFontOfSize:12];
        self.retrieve = xiey;
    }
    return _retrieve;
}


- (UIView *)line_1{
    if (!_line_1) {
        UIView *line_1 = [UIView new];
        line_1.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
        self.line_1 = line_1;
    }
    return _line_1;
}



@end

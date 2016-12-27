
//
//  GVTel.m
//  GVLogin
//
//  Created by Viosky on 2016/12/21.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "GVTel.h"
#import "GVPrefixHeader.pch"
#import "GVColor.h"

@interface GVTel ()

@end

@implementation GVTel

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
#pragma mark - 添加到父视图
        [self addSubview:self.telText];
        [self addSubview:self.telImage];
        [self addSubview:self.passText];
        [self addSubview:self.passImage];
        [self addSubview:self.line_1];
        [self addSubview:self.line_2];
        [self addSubview:self.yanz];
        [self addSubview:self.xiey];
        [self addSubview:self.lable];
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
#pragma mark - Masonry
    [self.telText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(40);
    }];
    [self.telImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(13.5);
        make.centerY.equalTo(self.telText.mas_centerY);
    }];
    [self.line_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.telText.mas_bottom).offset(20);
    }];

    [self.passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line_1.mas_bottom).offset(20);
        make.left.equalTo(self.mas_left).offset(40);
    }];
    [self.passImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(13.5);
        make.centerY.equalTo(self.passText.mas_centerY);
    }];
    [self.line_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.passText.mas_bottom).offset(20);
    }];
    [self.lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(13.5);
        make.top.equalTo(self.line_2.mas_bottom).offset(14);
    }];
    [self.xiey mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lable.mas_bottom).offset(5);
        make.left.equalTo(self.mas_left).offset(13.5);
    }];
    [self.yanz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-24);
        make.centerY.equalTo(self.telText.mas_centerY);
        make.height.mas_equalTo(24);
        make.width.mas_equalTo(80);
    }];
}

#pragma mark - 控件初始化
- (UITextField *)telText{
    if (!_telText) {
        UITextField *telText = [UITextField new];
        telText.placeholder = @"请输入您的手机号";
        telText.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
        telText.font = [UIFont systemFontOfSize:14];
        self.telText = telText;
    }
    return _telText;
}

- (UITextField *)passText{
    if (!_passText) {
        UITextField *passText = [UITextField new];
        passText.placeholder = @"请输入您收到的验证码";
        passText.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
        passText.font = [UIFont systemFontOfSize:14];
        self.passText = passText;
    }
    return _passText;
}

- (UIImageView *)telImage{
    if (!_telImage) {
        UIImageView *telImage = [UIImageView new];
        telImage.image = [UIImage imageNamed:@"phone"];
        self.telImage = telImage;
    }
    return _telImage;
}

- (UIImageView *)passImage{
    if (!_passImage) {
        UIImageView *passImage = [UIImageView new];
        passImage.image = [UIImage imageNamed:@"cancel"];
        self.passImage = passImage;
    }
    return _passImage;
}

- (UIButton *)xiey{
    if (!_xiey) {
        UIButton *xiey = [UIButton new];
        [xiey setTitle:@"《点啊注册服务协议》" forState:UIControlStateNormal];
        [xiey setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
        xiey.titleLabel.font = [UIFont systemFontOfSize:12];
        self.xiey = xiey;
    }
    return _xiey;
}

- (UIButton *)yanz{
    if (!_yanz) {
        UIButton *yanz = [UIButton new];
        yanz.layer.borderWidth = 0.5;
        yanz.layer.borderColor = [[GVColor hexStringToColor:@"ffba14"] CGColor];
        [yanz setTitle:@"获取验证码" forState:UIControlStateNormal];
        [yanz setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
        yanz.titleLabel.font = [UIFont systemFontOfSize:13];
        yanz.layer.masksToBounds= YES;
        yanz.layer.cornerRadius = 10;
        self.yanz = yanz;
    }
    return _yanz;
}

- (UIView *)line_1{
    if (!_line_1) {
        UIView *line_1 = [UIView new];
        line_1.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
        self.line_1 = line_1;
    }
    return _line_1;
}

- (UIView *)line_2{
    if (!_line_2) {
        UIView *line_2 = [UIView new];
        line_2.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
        self.line_2 = line_2;
    }
    return _line_2;
}

- (UILabel *)lable{
    if (!_lable) {
        UILabel *label = [UILabel new];
        label.text = @"未注册账号的手机号，登录时将自动注册，且代表您已同意";
        label.textColor = [GVColor hexStringToColor:@"#cccccc"];
        label.font = [UIFont systemFontOfSize:12];
        self.lable = label;
    }
    return _lable;
}

@end

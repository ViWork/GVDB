//
//  LYMineChoiceBar.m
//  GVLogin
//
//  Created by Viosky on 2016/12/21.
//  Copyright © 2016年 Viosky. All rights reserved.
//
#import "GVColor.h"
#import "GVMineChoiceBar.h"

#import "GVPrefixHeader.pch"
#import "ViewController.h"
@interface GVMineChoiceBar()

@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIView *indicatorView;

@end

@implementation GVMineChoiceBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    [self addSubview:self.indicatorView];

    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(40);
        make.top.equalTo(self.mas_top).offset(16);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-40);
        make.centerY.equalTo(self.leftBtn.mas_centerY);
    }];
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.equalTo(self.leftBtn.mas_bottom).offset(10);
        make.width.equalTo(self.leftBtn.mas_width);
        make.centerX.equalTo(self.leftBtn.mas_centerX);
    }];
    

}

#pragma mark - <懒加载>

- (UIButton *)leftBtn {
    
    if(!_leftBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"手机号快捷登录" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.selected = YES;
        _leftBtn = btn;
    }
    
    return _leftBtn;
}

- (UIButton *)rightBtn {
    
    if(!_rightBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"账号密码登录" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn = btn;
    }
    
    return _rightBtn;
}

- (UIView *)indicatorView {
    
    if(!_indicatorView) {
        
        UIView *indicView = [[UIView alloc] init];
        indicView.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
        _indicatorView = indicView;
    }
    
    return _indicatorView;
}

// 点击选择按钮
- (void)buttonClick:(UIButton *)btn {
    btn.selected = !btn.selected;
    NSInteger type = 0;
    if(btn == self.leftBtn) {
        [UIView animateWithDuration:0.25 animations:^{
            self.indicatorView.gv_x = self.leftBtn.gv_x;
            self.indicatorView.gv_width = self.leftBtn.gv_width;
        }];

        
    }else {
        [UIView animateWithDuration:0.25 animations:^{
            self.indicatorView.gv_x = self.rightBtn.gv_x;
            self.indicatorView.gv_width = self.rightBtn.gv_width;
        }];
        type = 1;

    }
    if([self.delegate respondsToSelector:@selector(choiceBarClick:)]) {
        [self.delegate choiceBarClick:type];
    }
}
@end

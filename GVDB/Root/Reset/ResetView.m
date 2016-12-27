//
//  ResetView.m
//  二级界面
//
//  Created by BanWanXin on 2016/12/20.
//  Copyright © 2016年 BanWanXin. All rights reserved.
//

#import "ResetView.h"
#import "GVColor.h"
#import "Masonry.h"
@implementation ResetView
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
    _onePassword = [[UITextField alloc]init];
    [self addSubview:_onePassword];
    _onePassword.placeholder = @"请输入6—12位新密码";
    [_onePassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(94);
        make.left.equalTo(self.mas_left).offset(85);
        make.right.equalTo(self.mas_right).offset(12);
        make.height.mas_equalTo(19);
    }];
    UILabel*lableone = [[UILabel alloc]init];
    lableone.text = @"新密码";
    lableone.textAlignment = NSTextAlignmentLeft;
    lableone.font = [UIFont systemFontOfSize:15];
    [self addSubview:lableone];
    [lableone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(94);
        make.left.equalTo(self.mas_left).offset(12);
        make.right.equalTo(_onePassword.mas_right).offset(0);
        make.height.mas_equalTo(19);
    }];
    UILabel*downlable_1 = [[UILabel alloc]init];
    downlable_1.backgroundColor = [GVColor hexStringToColor:@"#dddddd"];
    [self addSubview:downlable_1];
    [downlable_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lableone.mas_bottom).offset(10);
        make.left.equalTo(self.mas_left).offset(12);
        make.right.equalTo(self.mas_right).offset(-12);
        make.height.mas_equalTo(1);
    }];
    
    
    
    
    _twoRassword = [[UITextField alloc]init];
    [self addSubview:_twoRassword];
    _twoRassword.placeholder = @"请输入6—12位新密码";
    [_twoRassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downlable_1.mas_top).offset(30);
        make.left.equalTo(self.mas_left).offset(85);
        make.right.equalTo(self.mas_right).offset(12);
        make.height.mas_equalTo(19);
    }];
    UILabel*labletwo = [[UILabel alloc]init];
    labletwo.text = @"再次输入";
    labletwo.textAlignment = NSTextAlignmentLeft;
    labletwo.font = [UIFont systemFontOfSize:15];
    [self addSubview:labletwo];
    [labletwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downlable_1.mas_top).offset(30);
        make.left.equalTo(self.mas_left).offset(12);
        make.right.equalTo(_twoRassword.mas_right).offset(0);
        make.height.mas_equalTo(19);
    }];
    UILabel*downlable_2 = [[UILabel alloc]init];
    downlable_2.backgroundColor = [GVColor hexStringToColor:@"#dddddd"];
    [self addSubview:downlable_2];
    [downlable_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(labletwo.mas_bottom).offset(10);
        make.left.equalTo(self.mas_left).offset(12);
        make.right.equalTo(self.mas_right).offset(-12);
        make.height.mas_equalTo(1);
    }];
    
    _confirmButtonk = [[UIButton alloc]init];
    [_confirmButtonk setTitle:@"确   定" forState:UIControlStateNormal];
    _confirmButtonk.layer.masksToBounds = YES;
    _confirmButtonk.layer.cornerRadius = 16.5;
    _confirmButtonk.titleLabel.font = [UIFont systemFontOfSize:17];
    [_confirmButtonk setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    _confirmButtonk.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
    [self addSubview:_confirmButtonk];
    [_confirmButtonk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labletwo.mas_top).offset(85);
        make.width.mas_equalTo(195);
        make.height.mas_equalTo(33);
        make.centerX.mas_equalTo(self.mas_centerX);
        
    }];
    
    
    
}


@end

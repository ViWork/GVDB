//
//  SecondaryShoppV.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/30.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "SecondaryShoppV.h"

@implementation SecondaryShoppV

-(UIButton *)moneyBtn{
    if (!_moneyBtn) {
        _moneyBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_moneyBtn setBackgroundImage:[UIImage imageNamed:@"money"] forState:UIControlStateNormal] ;
        _moneyBtn.titleLabel.font = [UIFont systemFontOfSize:14.0] ;
        _moneyBtn.titleLabel.textColor = [GVColor hexStringToColor:@"#333333"] ;
    }
    return _moneyBtn ;
}

-(UIButton *)shoppBtn{
    if (!_shoppBtn) {
        _shoppBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_shoppBtn setImage:[UIImage imageNamed:@"shopping_cart"] forState:UIControlStateNormal] ;
    }
    return _shoppBtn ;
}

-(UILabel *)showNumLab{
    if (!_showNumLab) {
        _showNumLab = [[UILabel alloc]init] ;
        _showNumLab.font = [UIFont systemFontOfSize:11] ;
        _showNumLab.layer.masksToBounds = YES ;
        _showNumLab.layer.cornerRadius = SIZE(20.0) ;
        _showNumLab.text  = @"0" ;
        _showNumLab.backgroundColor = [UIColor redColor] ;
        _showNumLab.textColor = [UIColor whiteColor] ;
        _showNumLab.textAlignment = NSTextAlignmentCenter ;
        _showNumLab.hidden = YES ;
    }
    return _showNumLab ;
}

-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_moneyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).with.offset( - SIZE(10.0)) ;
        make.right.mas_equalTo(self.mas_right).with.offset(SIZE( -50.0)) ;
        make.height.mas_equalTo(SIZE(40.0)) ;
        make.width.mas_equalTo(SIZE(240.0)) ;
    }] ;
    
    
    [_shoppBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).with.offset(SIZE(0)) ;
        make.right.mas_equalTo(self.mas_right).with.offset(SIZE( 0)) ;
        make.width.and.height.mas_equalTo(SIZE(140.0)) ;
    }] ;
    
    [_showNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).with.offset(SIZE(20)) ;
        make.right.mas_equalTo(self.mas_right).with.offset(SIZE(- 30.0)) ;
        make.width.and.height.mas_equalTo(SIZE(40.0)) ;
    }] ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self  addSubview:self.moneyBtn] ;
        [self   addSubview:self.shoppBtn] ;
        [self    addSubview:self.showNumLab] ;
    }
    return self;
}



@end

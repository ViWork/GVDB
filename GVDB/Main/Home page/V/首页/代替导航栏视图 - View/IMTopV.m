//
//  IMTopV.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/27.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "IMTopV.h"

@implementation IMTopV

/* 控件懒加载 */
-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_leftBtn setTitle:@"北京" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal] ;
        _leftBtn.titleLabel.font  = [UIFont systemFontOfSize:SIZE(32.0)] ;
    }
    return _leftBtn ;
}

-(UIButton *)middleBtn{
    if (!_middleBtn) {
        _middleBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_middleBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_middleBtn setTitleColor:[GVColor hexStringToColor:@"#cccccc"] forState:UIControlStateNormal] ;
        [_middleBtn setTitle:@"输入商家丶商圈" forState:UIControlStateNormal] ;
        _middleBtn.titleLabel.font = [UIFont systemFontOfSize:SIZE(28.0)] ;
        
        _middleBtn.layer.masksToBounds = YES ;
        _middleBtn.layer.borderColor = [[GVColor hexStringToColor:@"#dddddd"] CGColor] ;
        _middleBtn.layer.borderWidth = SIZE(1.0) ;
        _middleBtn.layer.cornerRadius = SIZE(26.0) ;
        
        _middleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 50) ;
        _middleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 70) ;
    }
    return _middleBtn ;
}

-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_rightBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal] ;
    }
    return _rightBtn ;
}

-(UIImageView *)topImg{
    if (!_topImg) {
        _topImg = [[UIImageView alloc]init] ;
        _topImg.image = [UIImage imageNamed:@"arrows"] ;
    }
    return _topImg ;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftBtn] ;
        [self addSubview:self.topImg] ;
        [self addSubview:self.middleBtn] ;
        [self addSubview:self.rightBtn] ;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.mas_left).offset(SIZE(24.0)) ;
        make.centerY.mas_equalTo (self.mas_centerY) ;
    }] ;
    
    [_topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.leftBtn.mas_right).offset(SIZE(16.0)) ;
        make.height.mas_equalTo (SIZE(14.0)) ;
        make.width.mas_equalTo (SIZE(22.0)) ;
        make.centerY.mas_equalTo (self.mas_centerY) ;
    }] ;
    
    [_middleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.topImg.mas_right).offset (SIZE(56.0)) ;
        make.top.mas_equalTo (self.mas_top).offset (SIZE(18.0)) ;
        make.height.mas_equalTo (SIZE(52.0)) ;
        make.width.mas_equalTo (SIZE(500.0)) ;
    }] ;
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo (self.mas_centerY) ;
        make.left.mas_equalTo (self.middleBtn.mas_right).offset (26) ;
        make.width.and.height.mas_equalTo (SIZE(30.0)) ;
    }] ;
}

@end

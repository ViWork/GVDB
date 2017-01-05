//
//  SecondaryNavgationV.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/30.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "SecondaryNavgationV.h"

@implementation SecondaryNavgationV

-(UIButton *)btnBack{
    if (!_btnBack) {
        _btnBack = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnBack setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal] ;
    }
    return _btnBack ;
}

-(UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc]init] ;
        _labTitle.textColor = [GVColor hexStringToColor:@"#333333"] ;
        _labTitle.font = [UIFont systemFontOfSize:SIZE(38.0)] ;
    }
    return _labTitle ;
}



-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(SIZE(20.0)) ;
        make.left.mas_equalTo(self.mas_left).with.offset(SIZE(24.0)) ;
        make.width.mas_equalTo(SIZE(26.0)) ;
        make.height.mas_equalTo(SIZE(42.0)) ;
    }] ;
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(SIZE(20.0)) ;
        make.centerX.mas_equalTo(self.mas_centerX) ;
    }] ;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self     addSubview:         self.btnBack] ;
        [self      addSubview:        self.labTitle] ;
    }
    return self;
}
@end

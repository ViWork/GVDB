//
//  MenuHeaderView.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "MenuNavView.h"

@implementation MenuNavView
-(UIButton *)btnLeftBack
{
    if (!_btnLeftBack) {
        
        _btnLeftBack = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnLeftBack setImage:[UIImage imageNamed:@"the-arrow-"] forState:UIControlStateNormal] ;
        [_btnLeftBack setBackgroundColor:[UIColor colorWithRed:70/255.0 green:47/255.0 blue:30/255.0 alpha:0.5]] ;
        _btnLeftBack.layer.masksToBounds = YES ;
        _btnLeftBack.layer.cornerRadius = SIZE(28.0) ;
    }
    return _btnLeftBack ;
}

-(UIButton *)btnRightCar{
    if (!_btnRightCar) {
        _btnRightCar = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnRightCar setImage:[UIImage imageNamed:@"shopping"] forState:UIControlStateNormal] ;
        [_btnRightCar setBackgroundColor:[UIColor colorWithRed:70/255.0 green:47/255.0 blue:30/255.0 alpha:0.5]] ;
        _btnRightCar.layer.masksToBounds = YES ;
        _btnRightCar.layer.cornerRadius = SIZE(28.0) ;
    }
    return _btnRightCar ;
}

-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_btnLeftBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(SIZE(16.0)) ;
        make.left.mas_equalTo(self.mas_left).offset(SIZE(24.0)) ;
        make.width.and.height.mas_equalTo(SIZE(56.0)) ;
    }] ;
    
    [_btnRightCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(SIZE(16.0)) ;
        make.right.mas_equalTo(self.mas_right).offset(SIZE(-24.0)) ;
        make.width.and.height.mas_equalTo(SIZE(56.0)) ;
    }] ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self   addSubview:  self.btnLeftBack];
        [self   addSubview:  self.btnRightCar];
    }
    return self;
}
@end

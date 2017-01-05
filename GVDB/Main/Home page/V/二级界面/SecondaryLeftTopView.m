//
//  SecondaryLeftTopView.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "SecondaryLeftTopView.h"

@implementation SecondaryLeftTopView


/* 控件懒加载 */
-(UIButton * )btnSearch{
    if (!_btnSearch) {
        _btnSearch = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnSearch setTitle:@"请输入类型" forState:UIControlStateNormal] ;
        [_btnSearch setImage:[UIImage imageNamed:@"search-2"] forState:UIControlStateNormal];
        [_btnSearch setTitleColor:[GVColor hexStringToColor:@"#cccccc"] forState:UIControlStateNormal] ;
        _btnSearch.titleLabel.font = [UIFont systemFontOfSize:SIZE(30.0)] ;
        
        _btnSearch.layer.masksToBounds = YES ;
        _btnSearch.layer.borderColor = [[GVColor hexStringToColor:@"#aaaaaa"] CGColor] ;
        _btnSearch.layer.borderWidth = SIZE(1.0) ;
        _btnSearch.layer.cornerRadius = SIZE(20.0) ;
    
//        _btnSearch.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 50) ;
//        _btnSearch.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 70) ;
    }
    return _btnSearch ;
}

-(UIButton *)btnAllData{
    if (!_btnAllData) {
        _btnAllData  = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnAllData setTitle:@"全部" forState:UIControlStateNormal] ;
        [_btnAllData setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal] ;
        _btnAllData.titleLabel.font = [UIFont systemFontOfSize:SIZE(36.0)] ;
    }
    return _btnAllData ;
}

-(UITableView *)leftTableV{
    if (!_leftTableV) { //self.frame.size.height - self.btnSearch.frame.size.height -self.btnAllData.frame.size.height - 47.2, self.frame.size.width , ScreenHEIGHT
        _leftTableV = [[UITableView alloc]initWithFrame:CGRectMake(self.frame.size.width,self.frame.size.height - self.btnSearch.frame.size.height -self.btnAllData.frame.size.height - 47.2, self.frame.size.width , ScreenHEIGHT) style:UITableViewStylePlain] ;
        _leftTableV.tag = 500 ;
        
        _leftTableV.rowHeight = SIZE(90.0) ;
        _leftTableV.separatorInset = UIEdgeInsetsMake(0, SIZE(26.0), 0, SIZE(26.0)) ;
        _leftTableV.separatorColor = [GVColor hexStringToColor:@"#eeeeee"] ;
        
    }
    return _leftTableV ;
}


-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_backGIMG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top) ;
        make.left.mas_equalTo(self.mas_left) ;
        make.width.mas_equalTo(self.mas_width) ;
        make.height.mas_equalTo(self.mas_height) ;
    }] ;
    
    [self.btnSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(64) ;
        make.centerX.mas_equalTo(self.mas_centerX) ;
        make.width.mas_equalTo(SIZE(SIZE(470.0) - SIZE(45.0)*2)) ;
        make.height.mas_equalTo(SIZE(50.0)) ;
    }] ;
    
    [_btnAllData mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btnSearch.mas_bottom).offset(SIZE(52.0)) ;
        make.centerX.mas_equalTo(self.mas_centerX) ;
//        make.top.mas_equalTo(self.mas_top) ;
//        make.centerX.mas_equalTo(self.mas_centerX) ;
    }] ;
    
    [_leftTableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btnAllData.mas_bottom).offset(SIZE(28.0)) ;
        make.left.mas_equalTo(self.mas_left) ;
        make.width.mas_equalTo(self.mas_width) ;
        make.height.mas_equalTo(self.mas_height) ;
    }];
}

-(UIImageView *)backGIMG{
    if (!_backGIMG) {
        _backGIMG  = [[UIImageView alloc]init] ;
        _backGIMG.image = [UIImage imageNamed:@"peking"] ;
    }
    return _backGIMG ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self   addSubview:   self.backGIMG] ;
        [self   addSubview:   self.btnSearch] ;
        [self   addSubview:   self.btnAllData] ;
        [self   addSubview:   self.leftTableV] ;
    }
    return self;
}



@end

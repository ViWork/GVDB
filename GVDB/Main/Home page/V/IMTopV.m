//
//  IMTopV.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/27.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "IMTopV.h"
#define myPoint   self.mas_centerY/2
@implementation IMTopV

/* 控件懒加载 */
-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_leftBtn setTitle:@"定位" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal] ;
        _leftBtn.titleLabel.font  = [UIFont systemFontOfSize:16] ;
    }
    return _leftBtn ;
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

-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar  = [[UISearchBar alloc]init] ;
        
        // searchBar  属性设置
        _searchBar.searchBarStyle = UISearchBarStyleDefault ;
        _searchBar.placeholder = @"输入商家丶商圈" ;
//        _searchBar.showsCancelButton = YES ;
//        _searchBar.showsSearchResultsButton = YES ;
//        _searchBar.tintColor = [UIColor orangeColor] ;
        //_searchBar.barTintColor = [UIColor purpleColor] ;
        _searchBar.translucent = YES ;
        
        // 输入框和输入文字的调整
        //_searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(20, 0) ;
        // _searchBar.searchTextPositionAdjustment = UIOffsetMake(50, 0) ;
        
        [_searchBar setImage:[UIImage imageNamed:@"search"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal] ;
        
        _searchBar.layer.masksToBounds = YES ;
        _searchBar.layer.cornerRadius = [GVAL setGVAL:26] ;
        _searchBar.layer.borderColor = [[GVColor hexStringToColor:@"#dddddd"]CGColor] ;
        _searchBar.layer.borderWidth = 1 ;
        _searchBar.delegate = self ;
    }
    return _searchBar ;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftBtn] ;
        [self addSubview:self.topImg] ;
        [self addSubview:self.searchBar] ;
        [self addSubview:self.rightBtn] ;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.mas_left).offset([GVAL setGVAL:24]) ;
        make.centerY.mas_equalTo (self.mas_centerY) ;
    }] ;
    
    [_topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.leftBtn.mas_right).offset([GVAL setGVAL:16]) ;
        make.height.mas_equalTo ([GVAL setGVAL:14]) ;
        make.width.mas_equalTo ([GVAL setGVAL:22]) ;
        make.centerY.mas_equalTo (self.mas_centerY) ;
    }] ;
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.topImg.mas_right).offset ([GVAL setGVAL:56]) ;
        make.top.mas_equalTo (self.mas_top).offset ([GVAL setGVAL:18]) ;
        make.height.mas_equalTo ([GVAL setGVAL:52]) ;
        make.width.mas_equalTo ([GVAL setGVAL:460]) ;
    }] ;
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo (self.mas_centerY) ;
        make.left.mas_equalTo (self.searchBar.mas_right).offset ([GVAL setGVAL:52]) ;
        make.width.and.height.mas_equalTo ([GVAL setGVAL:30]) ;
    }] ;
}
// 取消搜索
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [_searchBar endEditing:YES] ;
}
@end

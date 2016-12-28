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
        [_leftBtn setTitle:@"定位" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal] ;
        _leftBtn.titleLabel.font  = [UIFont systemFontOfSize:SIZE(32.0, SIZE_Type)] ;
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
        _searchBar.layer.cornerRadius = SIZE(26.0, SIZE_Type) ;
        _searchBar.layer.borderColor = [[GVColor hexStringToColor:@"#dddddd"]CGColor] ;
        _searchBar.layer.borderWidth = SIZE(1.0, SIZE_Type) ;
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
        make.left.mas_equalTo (self.mas_left).offset(SIZE(24.0, SIZE_Type)) ;
        make.centerY.mas_equalTo (self.mas_centerY) ;
    }] ;
    
    [_topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.leftBtn.mas_right).offset(SIZE(16.0, SIZE_Type)) ;
        make.height.mas_equalTo (SIZE(14.0, SIZE_Type)) ;
        make.width.mas_equalTo (SIZE(22.0, SIZE_Type)) ;
        make.centerY.mas_equalTo (self.mas_centerY) ;
    }] ;
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.topImg.mas_right).offset (SIZE(56.0, SIZE_Type)) ;
        make.top.mas_equalTo (self.mas_top).offset (SIZE(18.0, SIZE_Type)) ;
        make.height.mas_equalTo (SIZE(52.0, SIZE_Type)) ;
        make.width.mas_equalTo (SIZE(460.0, SIZE_Type)) ;
    }] ;
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo (self.mas_centerY) ;
        make.left.mas_equalTo (self.searchBar.mas_right).offset (26) ;
        make.width.and.height.mas_equalTo (SIZE(30.0, SIZE_Type)) ;
    }] ;
}
// 取消搜索
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [_searchBar endEditing:YES] ;
}
@end

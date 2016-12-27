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
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 80, 40)] ;
        _leftBtn.frame = CGRectMake(10, 10, 80, 30);
        [_leftBtn setTitle:@"定位" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[CPColor hexStringToColor:@"#333333"] forState:UIControlStateNormal] ;
    }
    return _leftBtn ;
}

-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 80, 40)] ;
        _rightBtn.frame = CGRectMake(10, 10, 80, 30);
        [_rightBtn setImage:[UIImage imageNamed:@"more@2x"] forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[CPColor hexStringToColor:@"#333333"] forState:UIControlStateNormal] ;
    }
    return _rightBtn ;
}

-(UIImageView *)topImg{
    if (!_topImg) {
        _topImg = [[UIImageView alloc]initWithFrame:CGRectMake(90, 15, 30, 30)] ;
        _topImg.image = [UIImage imageNamed:@"arrows@2x"] ;
    }
    return _topImg ;
}

-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar  = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 10, 375, 30)] ;
        
        // searchBar  属性设置
        _searchBar.searchBarStyle = UISearchBarStyleDefault ;
        //_searchBar.text  =@"搜索" ;
        _searchBar.placeholder = @"输入搜索" ;
        //_searchBar.prompt = @"prompt" ;
        _searchBar.showsCancelButton = YES ;
        //_searchBar.showsBookmarkButton = YES ;
        _searchBar.showsSearchResultsButton = YES ;
        _searchBar.tintColor = [UIColor orangeColor] ;
        //_searchBar.barTintColor = [UIColor purpleColor] ;
        _searchBar.translucent = YES ;
        
        // 输入框和输入文字的调整
        //_searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(20, 0) ;
        // _searchBar.searchTextPositionAdjustment = UIOffsetMake(50, 0) ;
        
        //    searchBar setImage:<#(nullable UIImage *)#> forSearchBarIcon:<#(UISearchBarIcon)#> state:<#(UIControlState)#>
        
//        _searchBar.delegate = self ;
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
@end

//
//  IMHeaderView.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "IMHeaderView.h"
// 按钮 图片和文字的偏移
#define    titleEdgeInsetsMake   UIEdgeInsetsMake(0, -60, 0, -40)
#define    imageEdgeInsetsMake   UIEdgeInsetsMake(0, 20, 0, -40)

#define lineHeight SIZE(285.0)

@implementation IMHeaderView

-(UIScrollView *)scrollV{
    if (!_scrollV) {
        _scrollV = [[UIScrollView alloc]init] ;
        _scrollV.showsHorizontalScrollIndicator = YES ;
        _scrollV.pagingEnabled = YES ;
        _scrollV.bounces = NO ;
    }
    return _scrollV ;
}

-(UICollectionView *)collectionV{
    if (!_collectionV) {
        // 布局
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(SIZE(290.0), SIZE(424.0) );
        layout.minimumInteritemSpacing = SIZE(10.0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        //初始化
        _collectionV  = [[UICollectionView alloc]initWithFrame:CGRectMake(SIZE(24.0), SIZE(460.0)  , ScreenWIDTH - SIZE(24.0) ,  SIZE(424.0)) collectionViewLayout:layout] ;
        _collectionV.bounces = NO ;
        _collectionV.pagingEnabled = YES ;
        _collectionV.backgroundColor = [UIColor whiteColor] ;
         [_collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"] ;
    }
    return _collectionV ;
}

// 热门推荐
-(UILabel *)leftLabLine1{
    if (!_leftLabLine1) {
        _leftLabLine1 = [[UILabel alloc]init] ;
        _leftLabLine1.backgroundColor = [GVColor hexStringToColor:@"#cccccc"] ;
    }
    return _leftLabLine1 ;
}
-(UILabel *)middleLab1{
    if (!_middleLab1) {
        _middleLab1 = [[UILabel alloc]init] ;
        _middleLab1.text = @"热门推荐";
        _middleLab1.textColor = [GVColor hexStringToColor:@"#333333"] ;
        _middleLab1.font = [UIFont systemFontOfSize:18] ;
    }
    return _middleLab1 ;
}
-(UILabel *)rightLabLine1{
    if (!_rightLabLine1) {
        _rightLabLine1 = [[UILabel alloc]init] ;
        _rightLabLine1.backgroundColor = [GVColor hexStringToColor:@"#cccccc"] ;
    }
    return _rightLabLine1 ;
}

// 餐馆
-(UILabel *)leftLabLine2
{
    if (!_leftLabLine2) {
        _leftLabLine2 = [[UILabel alloc]init] ;
        _leftLabLine2.backgroundColor = [GVColor hexStringToColor:@"#cccccc"] ;
    }
    return _leftLabLine2 ;
}
-(UILabel *)middleLab2
{
    if (!_middleLab2) {
        _middleLab2 = [[UILabel alloc]init] ;
        _middleLab2.text = @"附近餐馆" ;
        _middleLab2.textColor = [GVColor hexStringToColor:@"#333333"] ;
        _middleLab2.font = [UIFont systemFontOfSize:18] ;
    }
    return _middleLab2 ;
}

-(UILabel *)rightLabLine2{
    if (!_rightLabLine2) {
        _rightLabLine2 = [[UILabel alloc]init] ;
        _rightLabLine2.backgroundColor = [GVColor hexStringToColor:@"#cccccc"] ;
    }
    return _rightLabLine2 ;
}

// 附近
-(UIButton *)btnNearby
{
    if (!_btnNearby) {
//        _imgScopeV1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SIZE(20.0), SIZE(12.0))];
//        _imgScopeV1.image = [UIImage imageNamed:@"arrows"] ;
        _btnNearby = [UIButton buttonWithType:UIButtonTypeCustom] ;
        _btnNearby.titleLabel.font = [UIFont systemFontOfSize:14] ;
        [_btnNearby setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal] ;
        [_btnNearby setTitle:@"附近" forState:UIControlStateNormal] ;
        [_btnNearby setImage: [UIImage imageNamed:@"arrows"] forState:UIControlStateNormal] ;
        _btnNearby.titleEdgeInsets  = titleEdgeInsetsMake ;
        _btnNearby.imageEdgeInsets = imageEdgeInsetsMake ;
        _btnNearby.tag = 111 ;
    }
    return _btnNearby ;
}

// 全部
-(UIButton *)btnAll
{
    if (!_btnAll) {
//        _imgScopeV2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SIZE(20.0), SIZE(12.0))];
//        _imgScopeV2.image = [UIImage imageNamed:@"arrows"] ;
        _btnAll = [UIButton buttonWithType:UIButtonTypeCustom] ;
        _btnAll.titleLabel.font = [UIFont systemFontOfSize:14] ;
        [_btnAll setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal] ;
        [_btnAll setTitle:@"全部" forState:UIControlStateNormal] ;
        [_btnAll setImage: [UIImage imageNamed:@"arrows"] forState:UIControlStateNormal] ;
        _btnAll.titleEdgeInsets  = titleEdgeInsetsMake ;
        _btnAll.imageEdgeInsets = imageEdgeInsetsMake ;
        _btnAll.tag =  110 ;
    }
    return _btnAll ;
}
//综合排序
-(UIButton *)btnSequence
{
    if (!_btnSequence) {
//        _imgScopeV3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SIZE(20.0), SIZE(12.0))];
//        _imgScopeV3.image = [UIImage imageNamed:@"arrows"] ;
        _btnSequence = [UIButton buttonWithType:UIButtonTypeCustom] ;
        _btnSequence.titleLabel.font = [UIFont systemFontOfSize:14] ;
        [_btnSequence setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal] ;
        [_btnSequence setTitle:@"综合排序" forState:UIControlStateNormal] ;
        [_btnSequence setImage: [UIImage imageNamed:@"arrows"] forState:UIControlStateNormal] ;
        _btnSequence.titleEdgeInsets  = UIEdgeInsetsMake(0, -63, 0, -40) ;
        _btnSequence.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, -95)  ;
        _btnSequence.tag = 112 ;
    }
    return _btnSequence ;
}
-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    // scrollView
    [_scrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top ) ;
        make.left.mas_equalTo (self.mas_left) ;
        make.width.mas_equalTo (self.mas_width) ;
        make.height.mas_equalTo (SIZE(300.0)) ;
    }] ;
    
    // 热门推荐
    //1.
    [_middleLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.scrollV.mas_bottom).offset (36.0) ;
        make.left.equalTo(self.leftLabLine1.mas_right).offset(SIZE(32.0));
    }] ;
    //2.
    [_leftLabLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (SIZE(24.0));
        make.width.mas_equalTo(lineHeight);
        make.height.mas_equalTo(SIZE(1.0));
        make.centerY.equalTo(self.middleLab1.mas_centerY);
    }] ;
    // 3.
    [_rightLabLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.middleLab1.mas_right).offset (SIZE(32.0));
        make.width.mas_equalTo(lineHeight );
        make.height.mas_equalTo(SIZE(1.0));
        make.centerY.equalTo(self.middleLab1.mas_centerY);
    }] ;
    
    // 餐馆
    [_middleLab2 mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.mas_equalTo (self.collectionV.mas_bottom).offset (SIZE(60.0)) ;
        make.left.equalTo(self.leftLabLine2.mas_right).offset(SIZE(32.0));
    }] ;
    
    [_leftLabLine2 mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.mas_equalTo (SIZE(24.0));
        make.width.mas_equalTo(lineHeight);
        make.height.mas_equalTo(SIZE(1.0));
        make.centerY.equalTo(self.middleLab2.mas_centerY);
    }] ;
    
    [_rightLabLine2 mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.mas_equalTo (self.middleLab2.mas_right).offset (SIZE(32.0));
//        make.right.mas_equalTo (self.mas_right).offset (SIZE(24.0)) ;
        make.width.mas_equalTo(lineHeight);
        make.height.mas_equalTo(SIZE(1.0));
        make.centerY.equalTo(self.middleLab2.mas_centerY);
    }] ;
    
    // 附近
    [_btnNearby mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.middleLab2.mas_bottom).offset (SIZE(40.0)) ;
        make.left.mas_equalTo (self.btnAll.mas_right).with.offset (SIZE(204.0)) ;
        make.centerX.mas_equalTo (self.middleLab2.mas_centerX) ;
    }] ;
    // 全部
    [_btnAll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.btnNearby.mas_top) ;
        make.right.mas_equalTo (self.btnNearby.mas_left).with.offset(SIZE(-204.0)) ;
    }] ;
    // 综合
    [_btnSequence mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.btnNearby.mas_top) ;
        make.left.mas_equalTo (self.btnNearby.mas_right).with.offset(SIZE(146.0)) ;
    }] ;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self     addSubview:    self.scrollV] ;
        [self     addSubview:    self.middleLab1] ;
        [self     addSubview:    self.leftLabLine1] ;
        [self     addSubview:    self.rightLabLine1] ;
        [self     addSubview:    self.collectionV] ;
        [self     addSubview:    self.middleLab2] ;
        [self     addSubview:    self.leftLabLine2] ;
        [self     addSubview:    self.rightLabLine2] ;
        [self     addSubview:    self.btnNearby] ;
        [self     addSubview:    self.btnAll] ;
        [self     addSubview:    self.btnSequence] ;
    }
    return self;
}
@end

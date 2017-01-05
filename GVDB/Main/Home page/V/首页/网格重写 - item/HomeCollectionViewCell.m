//
//  HomeCollectionViewCell.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "WSStarRatingView.h"

@implementation HomeCollectionViewCell

-(void)setFm_info:(FirstModel_info *)fm_info
{
    _fm_info = fm_info ;
    [_shopImgV sd_setImageWithURL:[NSURL URLWithString:fm_info.store_photo] placeholderImage:[UIImage imageNamed:@"backGround"]] ;
    _shopName.text = fm_info.store_name ;
    _star = fm_info.star ;
    _labAgree.text = [NSString stringWithFormat:@"成交 %@", fm_info.count] ;
    _labFoodType.text = fm_info.menu_attr ;
    _labDistance.text = [NSString stringWithFormat:@"%@m", fm_info.juli]  ;
    
    WSStarRatingView *starRatingView = [[WSStarRatingView alloc] initWithFrame:CGRectMake(0, 0, SIZE(290.0)-SIZE(16.0), SIZE(24.0)) numberOfStar:[_star floatValue]];
    [self.starView addSubview:starRatingView] ;
   
}


-(UIImageView *)shopImgV{
    if (!_shopImgV) {
        _shopImgV = [[UIImageView alloc]init] ;
    }
    return _shopImgV ;
}

-(UIImageView *)foodBackGroundImgV{
    if (!_foodBackGroundImgV) {
        _foodBackGroundImgV = [[UIImageView alloc]init] ;
        _foodBackGroundImgV.image = [UIImage imageNamed:@"tag"] ;
        _foodBackGroundImgV.alpha = 0.3 ;
    }
    return _foodBackGroundImgV ;
}

-(UILabel *)labFoodType{
    if (!_labFoodType) {
        _labFoodType = [[UILabel alloc]init] ;
        _labFoodType.font = [UIFont systemFontOfSize:13] ;
        _labFoodType.textColor = [GVColor hexStringToColor:@"#ffba14"] ;
        _labFoodType.textAlignment = NSTextAlignmentCenter ;
    }
    return _labFoodType ;
}

-(UILabel *)shopName{
    if (!_shopName) {
        _shopName = [[UILabel alloc]init] ;
        _shopName.font = [UIFont systemFontOfSize:15] ;
        _shopName.textColor = [GVColor hexStringToColor:@"#333333"] ;
    }
    return _shopName ;
}

-(UIView *)starView{
    if (!_starView) {
        _starView = [[UIView alloc]init] ;
        
    }
    return _starView ;
}

-(UILabel *)labAgree{
    if (!_labAgree) {
        _labAgree = [[UILabel alloc]init] ;
        _labAgree.font = [UIFont systemFontOfSize:12] ;
        _labAgree.textColor = [GVColor hexStringToColor:@"#888888"] ;
    }
    return _labAgree ;
}

-(UILabel *)labDistance{
    if (!_labDistance) {
        _labDistance = [[UILabel alloc]init] ;
        _labDistance.font = [UIFont systemFontOfSize:12] ;
        _labDistance.textColor = [GVColor hexStringToColor:@"#888888"] ;
    }
    return _labDistance ;
}


// 布局
-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_shopImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.contentView.mas_top) ;
        make.left.mas_equalTo (self.contentView.mas_left) ;
        make.width.mas_equalTo (SIZE(290.0)) ;
        make.height.mas_equalTo (SIZE(220.0)) ;
    }] ;
    
    [_foodBackGroundImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.contentView.mas_top).with.offset(SIZE(16.0)) ;
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(SIZE(0)) ;
        make.width.mas_equalTo(SIZE(104.0)) ;
        make.height.mas_equalTo(SIZE(34.0)) ;
    }] ;
    
    [_labFoodType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.contentView.mas_top).with.offset(SIZE(16.0)) ;
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(SIZE(0)) ;
        make.width.mas_equalTo(SIZE(104.0)) ;
        make.height.mas_equalTo(SIZE(34.0)) ;
    }] ;
    
    [_shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.shopImgV.mas_bottom) .with.offset (SIZE(30.0));
        make.left.mas_equalTo (self.contentView.mas_left).with.offset (SIZE(8.0)) ;
        make.right.mas_equalTo (self.contentView.mas_right).with.offset (SIZE(-8.0)) ;
    }] ;
    
    [_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.shopName.mas_bottom) .with.offset (SIZE(14.0));
        make.left.mas_equalTo (self.contentView.mas_left).with.offset (SIZE(8.0)) ;
        make.width.mas_equalTo (SIZE(290.0)-SIZE(16.0)) ;
        make.height.mas_equalTo (SIZE(24.0)) ;
    }] ;
    
    [_labAgree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.starView.mas_bottom) .with.offset (SIZE(24.0));
        make.left.mas_equalTo (self.contentView.mas_left).with.offset (SIZE(8.0)) ;
    }] ;
    
    [_labDistance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.labAgree.mas_top) .with.offset (0);
        make.right.mas_equalTo (self.contentView.mas_right).with.offset (SIZE(-8.0)) ;
    }] ;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView    addSubview:self.shopImgV] ;
        [self.contentView    addSubview:self.foodBackGroundImgV] ;
        [self.contentView    addSubview:self.labFoodType] ;
        [self.contentView    addSubview:self.shopName] ;
        [self.contentView    addSubview:self.starView] ;
        [self.contentView    addSubview:self.labAgree] ;
        [self.contentView    addSubview:self.labDistance] ;
    }
    return self;
}

@end

//
//  HomeTableViewCell.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "HomeTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "WSStarRatingView.h"
#define   TEXTColor [GVColor hexStringToColor:@"#888888"]
@implementation HomeTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        //店图
        _shopImg = [[UIImageView alloc]init] ;
        
        // 店名
        _shopName = [[UILabel alloc]init] ;
        _shopName.font = [UIFont systemFontOfSize:15] ;
        _shopName.textColor = [GVColor hexStringToColor:@"#333333"] ;
        
        // 有无外卖
        _deliveryImgV = [[UIImageView alloc]init] ;
        
        // 好评
        //_starImg = [[UIImageView alloc]init] ;
        _starView = [[UIView alloc]init] ;
        
        
        // 成交
        _labAgree = [[UILabel alloc]init] ;
        _labAgree.font = [UIFont systemFontOfSize:13] ;
        _labAgree.textColor = TEXTColor ;
        
        // 间隔
        _labSpace = [[UILabel alloc]init] ;
        _labSpace.backgroundColor = TEXTColor ;
        
        // 样式
        _labFoodType = [[UILabel alloc]init] ;
        _labFoodType.font = [UIFont systemFontOfSize:13] ;
        _labFoodType.textColor = TEXTColor ;
        _labFoodType.textAlignment = NSTextAlignmentCenter ;
        
        // 距离
        _labDistance = [[UILabel alloc]init] ;
        _labDistance.font = [UIFont systemFontOfSize:11] ;
        _labDistance.textColor = TEXTColor ;
        
        
        
        [self.contentView    addSubview:      self.shopImg] ;
        [self.contentView    addSubview:      self.shopName] ;
        [self.contentView    addSubview:      self.deliveryImgV] ;
        [self.contentView    addSubview:      self.starView] ;
        [self.contentView    addSubview:      self.labAgree] ;
        [self.contentView    addSubview:      self.labSpace] ;
        [self.contentView    addSubview:      self.labFoodType] ;
        [self.contentView    addSubview:      self.labDistance] ;
        
    }
    return self ;
}

// 布局
-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    
    [_shopImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.contentView.mas_top).with.offset(SIZE(20.0)) ;
        make.left.mas_equalTo (self.contentView.mas_left).with.offset(SIZE(24.0)) ;
        make.width.mas_equalTo (SIZE(176.0)) ;
        make.height.mas_equalTo (SIZE(134.0)) ;
    }] ;
    
    [_shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.contentView.mas_top) .with.offset (SIZE(20.0));
        make.left.mas_equalTo (self.shopImg.mas_right).with.offset (SIZE(20.0)) ;
    }] ;
    
    [_deliveryImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.shopName.mas_top).with.offset(SIZE(8.0)) ;
        make.left.mas_equalTo(self.shopName.mas_right).with.offset(SIZE(20.0)) ;
        make.height.and.width.mas_equalTo(SIZE(32.0)) ;
    }] ;
    
//    [_starImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo (self.shopName.mas_bottom) .with.offset (SIZE(10.0));
//        make.left.mas_equalTo (self.shopImg.mas_right).with.offset (SIZE(20.0)) ;
//         make.height.and.width.mas_equalTo(SIZE(24.0)) ;
//    }] ;
    
    [_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.shopName.mas_bottom) .with.offset (SIZE(10.0));
        make.left.mas_equalTo (self.shopImg.mas_right).with.offset (SIZE(20.0)) ;
        make.width.mas_equalTo (SIZE(290.0)) ;
        make.height.mas_equalTo (SIZE(24.0)) ;
    }] ;
    
    [_labAgree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.starView.mas_bottom) .with.offset (SIZE(20.0));
        make.left.mas_equalTo (self.shopImg.mas_right).with.offset (SIZE(20.0)) ;
    }] ;
    
    [_labSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo (self.labAgree.mas_centerY)  ;
        make.left.mas_equalTo (self.labAgree.mas_right).with.offset (SIZE(16.0)) ;
        make.width.mas_equalTo(SIZE(1.0)) ;
        make.height.mas_equalTo(self.labAgree.mas_height) ;
    }] ;
    
    [_labFoodType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.labAgree.mas_top) .with.offset (0);
        make.left.mas_equalTo (self.labSpace.mas_right).with.offset (SIZE(16.0)) ;
    }] ;
    
    [_labDistance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.contentView.mas_top) .with.offset (18);
        make.right.mas_equalTo (self.contentView.mas_right).with.offset (SIZE(-24.0)) ;
    }] ;
    
}


-(void)setFm_hot:(FirstModel_hot *)fm_hot{
    _fm_hot = fm_hot ;
    
    [_shopImg sd_setImageWithURL:[NSURL URLWithString:fm_hot.store_photo] placeholderImage:[UIImage imageNamed:@"backGround"]] ;
    _shopName.text = fm_hot.store_name ;
    _outsite = fm_hot.is_outsite ;
    _star = fm_hot.star ;
    _labAgree.text = [NSString stringWithFormat:@"成交 %@", fm_hot.count] ;
    _labFoodType.text = fm_hot.menu_attr ;
    _labDistance.text = [NSString stringWithFormat:@"%@m", fm_hot.juli]  ;
    
    //评价
    WSStarRatingView *starRatingView = [[WSStarRatingView alloc] initWithFrame:CGRectMake(0, 0, SIZE(290.0)-SIZE(16.0), SIZE(24.0)) numberOfStar:[_star floatValue]];
    [self.starView addSubview:starRatingView] ;
    
    // 是否支持外卖
    if ([_outsite isEqualToString:@"1"]) {
        _deliveryImgV.image = [UIImage imageNamed:@"take_out"] ;
    }else{
        _deliveryImgV.image = [UIImage imageNamed:@""] ;
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

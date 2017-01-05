//
//  SecondaryTopView.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "SecondaryTopView.h"

@implementation SecondaryTopView

-(void)setSecondaryModel:(SecondaryModel *)secondaryModel
{
    _secondaryModel = secondaryModel ;
    
    [_backGroundImg sd_setImageWithURL:[NSURL URLWithString:secondaryModel.store_photo] placeholderImage:[UIImage imageNamed:@"backGround"]] ;
    [_shopImg sd_setImageWithURL:[NSURL URLWithString:secondaryModel.store_photo] placeholderImage:[UIImage imageNamed:@"backGround"]] ;
    _labShopInfo.text = secondaryModel.store_con ;
    _shopName.text = secondaryModel.store_name ;
}

-(UIImageView *)backGroundImg{
    if (!_backGroundImg) {
        _backGroundImg = [[UIImageView alloc]init] ;
        _backGroundImg.image = [UIImage imageNamed:@"backGround"] ;
        //设置为高斯模糊
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [_backGroundImg addSubview:effectView];

    }
    return _backGroundImg ;
}

-(UIButton *)btnBack{
    if (!_btnBack) {
        _btnBack = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnBack setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal] ;
    }
    return _btnBack ;
}
-(UIImageView *)shopImg{
    if (!_shopImg) {
        _shopImg = [[UIImageView alloc]init] ;
        _shopImg.layer.masksToBounds = YES ;
        _shopImg.layer.cornerRadius = SIZE(118.0/2) ;
        //_shopImg.image = [UIImage imageNamed:@"backGround"] ;
    }
    return _shopImg ;
}

-(UILabel *)shopName{
    if (!_shopName) {
        _shopName = [[UILabel alloc]init] ;
        _shopName.font = [UIFont systemFontOfSize:SIZE(38.0)] ;
        _shopName.textColor  = [GVColor hexStringToColor:@"#ffffff"] ;
        //_shopName.text = @"潇湘府" ;
    }
    return _shopName ;
}
-(UILabel *)labShopInfo{
    if (!_labShopInfo) {
        _labShopInfo = [[UILabel alloc]init] ;
        _labShopInfo.font = [UIFont systemFontOfSize:SIZE(26.0)] ;
        _labShopInfo.textColor  = [GVColor hexStringToColor:@"#eeeeee"] ;
        _labShopInfo.lineBreakMode = UILineBreakModeHeadTruncation ; // 自动换行  ios6.0
        _labShopInfo.numberOfLines = 2 ;
        //_labShopInfo.text = @"潇湘府是一个福居圣地, 外观容貌妩媚, 内饰碧丽堂皇, 有美味的美味珍肴, 错过是一个巨大的遗憾,潇湘府是一个福居圣地, 外观容貌妩媚, 内饰碧丽堂皇, 有美味的美味珍肴, 错过是一个巨大的遗憾,潇湘府是一个福居圣地, 外观容貌妩媚, 内饰碧丽堂皇, 有美味的美味珍肴, 错过是一个巨大的遗憾" ;
    }
    return _labShopInfo ;
}

-(UIButton *)btnCollect{
    if (!_btnCollect) {
        _btnCollect  = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnCollect setImage:[UIImage imageNamed:@"collect_down"] forState:UIControlStateNormal] ;
    }
    return _btnCollect ;
}

-(UILabel *)labFloor
{
    if (!_labFloor) {
        _labFloor = [[UILabel alloc]init] ;
        _labFloor.backgroundColor = [GVColor hexStringToColor:@"#000000"] ;
        _labFloor.alpha = 0.5 ;
    }
    return _labFloor ;
}
-(UIImageView *)preferentialImg{
    if (!_preferentialImg) {
        _preferentialImg = [[UIImageView alloc]init] ;
        _preferentialImg.image = [UIImage imageNamed:@"benefit"] ;
    }
    return _preferentialImg ;
}
-(UILabel *)labRreferentialInfo{
    if (!_labRreferentialInfo) {
        _labRreferentialInfo = [[UILabel alloc]init] ;
        _labRreferentialInfo.textColor = [GVColor hexStringToColor:@"#ffffff"] ;
        _labRreferentialInfo.font = [UIFont systemFontOfSize:SIZE(26.0)] ;
        _labRreferentialInfo.text = @"买一赠100" ;
    }
    return _labRreferentialInfo ;
}
-(UIButton *)btnDelivery{
    if (!_btnDelivery) {
        _btnDelivery = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnDelivery setTitle:@">>>定外卖" forState:UIControlStateNormal] ;
        [_btnDelivery setTitleColor:[UIColor greenColor]  forState:UIControlStateNormal] ;
        _btnDelivery.titleLabel.font = [UIFont systemFontOfSize:SIZE(26.0)] ;
    }
    return _btnDelivery ;
}



// 布局
-(void)layoutSubviews{
    [super layoutSubviews] ;
    // 背景图
    [_backGroundImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top) ;
        make.left.mas_equalTo(self.mas_left) ;
        make.width.mas_equalTo (self.mas_width) ;
        make.height.mas_equalTo (self.mas_height) ;
    }] ;
    //返回
    [_btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).with.offset(SIZE(68.0)) ;
        make.left.mas_equalTo(self.mas_left).with.offset(SIZE(24.0)) ;
        make.width.mas_equalTo(SIZE(22.0)) ;
        make.height.mas_equalTo(SIZE(32.0)) ;
    }] ;
    //店铺图
    [_shopImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btnBack.mas_bottom).with.offset(SIZE(28.0)) ;
        make.left.mas_equalTo(self.mas_left).with.offset(SIZE(24.0)) ;
        make.width.and.height.mas_equalTo(SIZE(118.0)) ;
    }] ;
    //店名
    [_shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopImg.mas_right).offset(SIZE(20.0)) ;
        make.top.mas_equalTo(self.shopImg.mas_top) ;
    }] ;
    //店铺详情
    [_labShopInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopImg.mas_right).offset(SIZE(20.0)) ;
        make.top.mas_equalTo(self.shopName.mas_bottom).offset(SIZE(18.0)) ;
        make.right.mas_equalTo(SIZE(-24.0)) ;
//        make.width.mas_equalTo(ScreenWIDTH - self.shopImg.frame.size.width - SIZE(68)) ; //SIZE(176.0)
    }] ;
    // 收藏
    [_btnCollect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btnBack.mas_top) ;
        make.right.mas_equalTo(self.mas_right).offset(SIZE( -24.0)) ;
        make.width.mas_equalTo(SIZE(36.0)) ;
        make.height.mas_equalTo(SIZE(34.0)) ;
    }] ;
    //底图
    [_labFloor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom) ;
        make.left.mas_equalTo(self.mas_left) ;
        make.right.mas_equalTo(self.mas_right) ;
        make.height.mas_equalTo(SIZE(40.0)) ;
    }] ;
    // 优惠图
    [_preferentialImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shopImg.mas_bottom).with.offset(SIZE(48.0)) ;
        make.left.mas_equalTo(self.mas_left).offset(SIZE(24.0)) ;
        make.width.and.height.mas_equalTo(SIZE(34.0)) ;
    }] ;
    //优惠政策
    [_labRreferentialInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.labFloor.mas_centerY) ;
        make.left.mas_equalTo(self.preferentialImg.mas_right).offset(SIZE(22.0)) ;
    }] ;
    // 定外卖
    [_btnDelivery mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.labFloor.mas_centerY) ;
        make.right.mas_equalTo(self.mas_right).offset(SIZE( - 24.0)) ;
    }] ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self  addSubview:   self.backGroundImg] ;
        [self  addSubview:   self.btnBack] ;
        [self  addSubview:   self.shopImg] ;
        [self  addSubview:   self.shopName] ;
        [self  addSubview:   self.labShopInfo] ;
        [self  addSubview:   self.btnCollect] ;
        [self  addSubview:   self.labFloor] ;
        [self  addSubview:   self.preferentialImg] ;
        [self  addSubview:   self.labRreferentialInfo] ;
        [self  addSubview:   self.btnDelivery] ;
        
    }
    return self;
}
@end

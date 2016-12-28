//
//  GVTableViewCell.m
//  GVDB
//
//  Created by Viosky on 2016/12/27.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "GVTableViewCell.h"

@implementation GVTableViewCell
#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        [self setMasonty];
    }
    return self;
}

/**
 @brief  控件初始化
 */
- (void)setUI{
#pragma mark - 初始化控件
    UILabel *orderID = [UILabel new];
    orderID.textColor = [GVColor hexStringToColor:@"#aaaaaa"];
    orderID.font = [UIFont systemFontOfSize:SIZE(24.0)];
    self.orderID = orderID;
    [self addSubview:self.orderID];

    UILabel *tradeName = [UILabel new];
    tradeName.textColor = [GVColor hexStringToColor:@"#333333"];
    tradeName.font = [UIFont systemFontOfSize:SIZE(32.0)];
    self.tradeName = tradeName;
    [self addSubview:self.orderID];

    UILabel *typeName = [UILabel new];
    typeName.textColor = [GVColor hexStringToColor:@"#888888"];
    typeName.font = [UIFont systemFontOfSize:SIZE(28.0)];
    self.typeName = typeName;
    [self addSubview:self.orderID];

    UILabel *purchaseWay = [UILabel new];
    purchaseWay.textColor = [GVColor hexStringToColor:@"#888888"];
    purchaseWay.font = [UIFont systemFontOfSize:SIZE(28.0)];
    self.purchaseWay = purchaseWay;
    [self addSubview:self.orderID];

    UILabel *buyDate = [UILabel new];
    buyDate.textColor = [GVColor hexStringToColor:@"#aaaaaa"];
    buyDate.font = [UIFont systemFontOfSize:SIZE(26.0)];
    self.buyDate = buyDate;
    [self addSubview:self.orderID];

    UILabel *buytime = [UILabel new];
    buytime.textColor = [GVColor hexStringToColor:@"#aaaaaa"];
    buytime.font = [UIFont systemFontOfSize:SIZE(26.0)];
    self.buytime = buytime;
    [self addSubview:self.orderID];

    UILabel *moneyLabel = [UILabel new];
    purchaseWay.textColor = [GVColor hexStringToColor:@"#888888"];
    purchaseWay.font = [UIFont systemFontOfSize:SIZE(30.0)];
    self.moneyLabel = moneyLabel;
    [self addSubview:self.orderID];

    UILabel *money = [UILabel new];
    purchaseWay.textColor = [GVColor hexStringToColor:@"#888888"];
    purchaseWay.font = [UIFont systemFontOfSize:SIZE(30.0)];
    self.money = money;
    [self addSubview:self.orderID];

    UIView *topLine = [UIView new];
    topLine.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    self.topLine = topLine;
    [self addSubview:self.orderID];

    UIView *bouttnLine = [UIView new];
    bouttnLine.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    self.bouttnLine = bouttnLine;
    [self addSubview:self.orderID];

    UIImageView *tradeIcon;
    self.tradeIcon = tradeIcon;
    [self addSubview:self.orderID];

    UIButton *isPay = [UIButton new];
    [isPay setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    isPay.titleLabel.font = [UIFont systemFontOfSize:SIZE(26.0)];
    self.isPay = isPay;
    [self addSubview:self.orderID];
}
- (void)setMasonty{
    [self.orderID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(SIZE(24.0));
        make.top.equalTo(self.mas_top).with.offset(SIZE(20.0));
    }];
    [self.isPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(SIZE(24.0));
        make.centerY.equalTo(self.orderID.mas_centerY);
    }];
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderID.mas_bottom).with.offset(SIZE(20.0));
        make.height.mas_equalTo(SIZE(1.0));
        make.left.equalTo(self.mas_left).with.offset(SIZE(24.0));
    }];
    [self.tradeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.orderID.mas_centerX);
        make.top.equalTo(self.topLine.mas_bottom).with.offset(SIZE(24.0));
        make.height.mas_equalTo(SIZE(134.0));
        make.width.mas_equalTo(SIZE(180.0));
    }];
    [self.bouttnLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tradeIcon.mas_bottom).with.offset(SIZE(30.0));
        make.left.equalTo(self.mas_left).with.offset(SIZE(24.0));
        make.right.equalTo(self.mas_right).with.offset(SIZE(-24.0));
    }];
    [self.tradeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topLine.mas_bottom).with.offset(SIZE(24.0));
        make.left.equalTo(self.tradeIcon.mas_right).with.offset(SIZE(20.0));
    }];
    [self.typeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.tradeName.mas_centerX);
        make.top.equalTo(self.tradeName.mas_bottom).with.offset(SIZE(28.0));
    }];
    [self.purchaseWay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.tradeName.mas_centerY);
        make.left.equalTo(self.typeName.mas_right).with.offset(SIZE(40.0));
    }];
    [self.buyDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.tradeName.mas_centerX);
        make.top.equalTo(self.typeName.mas_bottom).with.offset(SIZE(24.0));
    }];
    [self.buytime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.buyDate.mas_centerY);
        make.left.equalTo(self.buyDate.mas_right).with.offset(SIZE(30.0));
    }];
    [self.bouttnLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tradeIcon.mas_bottom).with.offset(SIZE(30.0));
        make.left.equalTo(self.mas_left).with.offset(SIZE(24.0));
        make.right.equalTo(self.mas_right).with.offset(SIZE(-24.0));
    }];
    [self.money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bouttnLine.mas_bottom).with.offset(SIZE(24.0));
        make.right.equalTo(self.mas_right).with.offset(SIZE(24.0));
        make.bottom.equalTo(self.mas_bottom).with.offset(SIZE(22.0));
    }];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.money.mas_left).with.offset(SIZE(36.0));
        make.centerY.equalTo(self.money.mas_centerY);
    }];


}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

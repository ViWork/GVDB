//
//  SecondLeftTabCell.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/3.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "SecondLeftTabCell.h"

@implementation SecondLeftTabCell

-(UILabel *)labType{
    if (!_labType) {
        _labType  =[[ UILabel alloc]init] ;
        _labType.textColor = [GVColor hexStringToColor:@"333333"] ;
        _labType.highlightedTextColor = [GVColor hexStringToColor:@"ffba14"] ;
    }
    return _labType ;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        [self.contentView   addSubview:self.labType] ;
    }
    return self ;
}

-(void)layoutSubviews{
    [super layoutSubviews] ;
    [_labType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(SIZE(30.0)) ;
        make.centerX.mas_equalTo(self.contentView.mas_centerX) ;
        make.bottom.mas_equalTo(self.contentView.mas_bottom) ;
    }] ;
}
-(void)setSecondaryModel_type:(SecondaryModel_type *)secondaryModel_type{
    _secondaryModel_type = secondaryModel_type ;
    
    _labType.text = secondaryModel_type.foot_type ;
    _id = secondaryModel_type.id ;
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

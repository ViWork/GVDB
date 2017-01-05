//
//  MenuOneCell.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "MenuOneCell.h"
#import "IMSuperTableV.h"

@implementation MenuOneCell
{
    IMSuperTableV      *superTabV;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        // 名字
        _labMenuName = [[UILabel alloc]init] ;
        _labMenuName.font = [UIFont systemFontOfSize:SIZE(38.0)] ;
        _labMenuName.text  = @"水煮鱼" ;
        _labMenuName.textColor = [GVColor hexStringToColor:@"#333333"] ;
        _textH1 = [SelfAdaption text:_labMenuName.text size:_labMenuName.frame.size.width fontSize:38.0] ;
        NSLog(@"我的:  %.f",_textH1 );
        [self.contentView   addSubview:  self.labMenuName] ;
        
        
        
        //价格
        _labMenuPrice = [[UILabel alloc]init];
        _labMenuPrice.font = [UIFont systemFontOfSize:SIZE(40.0)] ;
        _labMenuPrice.textColor = [GVColor hexStringToColor:@"#a4562f"] ;
        _labMenuPrice.text = @"100.00" ;
       _textH2 = [SelfAdaption text:_labMenuPrice.text size:ScreenWIDTH - SIZE(48.0) fontSize:40.0] ;
        [self.contentView   addSubview:  self.labMenuPrice] ;
        NSLog(@"我的:  %.f",_textH2 );
        
        // 价格符号
        _labMenuPriceSymbol = [[UILabel alloc]init];
        _labMenuPriceSymbol.font = [UIFont systemFontOfSize:SIZE(30.0)] ;
        _labMenuPriceSymbol.textColor = [GVColor hexStringToColor:@"#a4562f"] ;
        _labMenuPriceSymbol.text = @"¥" ;
        [self.contentView   addSubview:  self.labMenuPriceSymbol] ;
        
        //月销售量
        _labSellNum = [[UILabel alloc]init];
        _labSellNum.font = [UIFont systemFontOfSize:SIZE(28.0)] ;
        _labSellNum.text = @"月销 300 份" ;
        _labSellNum.textColor = [GVColor hexStringToColor:@"#333333"] ;
        [self.contentView   addSubview:  self.labSellNum] ;
        _textH3 = [SelfAdaption text:_labSellNum.text size:ScreenWIDTH - SIZE(48.0) fontSize:28.0] ;
        NSLog(@"我的: %.2f",_textH3 );
        
        //添加评论
        _btnAddComment = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnAddComment setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal] ;
        [self.contentView   addSubview:  self.btnAddComment] ;
     
        
        
    }
    return self ;
}
//CGSize maxSize2 = CGSizeMake(ScreenWIDTH - SIZE(48.0), MAXFLOAT);
//_textH2 = [_labExplainInfo.text boundingRectWithSize:maxSize2 options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:SIZE(32.0)]} context:nil].size.height;


-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_labMenuName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SIZE(26.0)) ;
        make.left.mas_equalTo(SIZE(24.0)) ;
    }] ;
    
    [_labSellNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labMenuName.mas_bottom).offset(SIZE(24.0)) ;
        make.left.mas_equalTo(SIZE(24.0)) ;
    }] ;
    
    [_labMenuPriceSymbol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.labMenuPrice.mas_bottom).offset(SIZE(0)) ;
        make.left.mas_equalTo(SIZE(24.0)) ;
    }] ;
    
    [_labMenuPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labSellNum.mas_bottom).offset(SIZE(30.0)) ;
        make.left.mas_equalTo(self.labMenuPriceSymbol.mas_right) ;
//        make.bottom.mas_equalTo(self.mas_bottom).offset(SIZE(44.0)) ;
    }] ;
    
    
    [_btnAddComment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SIZE(26.0)) ;
        make.right.mas_equalTo(self.mas_right).offset(SIZE(-24.0)) ;
        make.width.and.height.mas_equalTo(SIZE(40.0)) ;
    }] ;
    
    if ([self.delegate respondsToSelector:@selector(tableRowHeight:)]) {
        [self.delegate tableRowHeight:self] ;
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

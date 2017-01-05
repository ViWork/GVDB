//
//  MenuTwoCell.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "MenuTwoCell.h"
#import "IMSuperTableV.h"

@implementation MenuTwoCell
{
    IMSuperTableV *superTabV;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        // 特色说明
        _labExplain = [[UILabel alloc]init] ;
        _labExplain.font = [UIFont systemFontOfSize:SIZE(28.0)] ;
        _labExplain.textColor = [GVColor hexStringToColor:@"#aaaaaa"] ;
        _labExplain.text = @"特色说明" ;
        [self.contentView   addSubview:  self.labExplain] ;
        _textH1 = [SelfAdaption text:_labExplain.text size:ScreenWIDTH - SIZE(48.0) fontSize:28.0] ;
        NSLog(@">>%.2f",_textH1 );
        
        //内容
        _labExplainInfo = [[UILabel alloc]init];
        _labExplainInfo.font = [UIFont systemFontOfSize:SIZE(32.0)] ;
        _labExplainInfo.text = @"浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡浩浩荡荡" ;
        _labExplainInfo.textColor = [GVColor hexStringToColor:@"#333333"] ;
        _labExplainInfo.numberOfLines = 0 ;
        _labExplainInfo.lineBreakMode = UILineBreakModeCharacterWrap ;
        [self.contentView   addSubview:  self.labExplainInfo] ;
        _textH2 = [SelfAdaption text:_labExplainInfo.text size:ScreenWIDTH - SIZE(48.0) fontSize:32.0] ;
        NSLog(@">>%.2f",_textH2 );
    }
    return self ;
}

-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_labExplain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SIZE(32.0)) ;
        make.left.mas_equalTo(SIZE(24.0)) ;
    }] ;
    
    [_labExplainInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labExplain.mas_bottom).offset(SIZE(26.0)) ;
        make.left.mas_equalTo(SIZE(24.0)) ;
        make.right.mas_equalTo(self.contentView.mas_right).offset(SIZE(-24.0)) ;
//        make.bottom.mas_equalTo(self.mas_bottom).offset(SIZE(30.0)) ;
    }] ;
    
    
    if ([self.delegate respondsToSelector:@selector(tableRowHeight2:)]) {
        [self.delegate tableRowHeight2:self] ;
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

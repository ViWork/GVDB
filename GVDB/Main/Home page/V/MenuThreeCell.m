//
//  MenuThreeCell.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "MenuThreeCell.h"
#import "IMSuperTableV.h"

@implementation MenuThreeCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        // 菜品评价标题
        _labMenuJudgeTitle = [[UILabel alloc]init] ;
        
        _labMenuJudgeTitle.font = [UIFont systemFontOfSize:SIZE(28.0)] ;
        _labMenuJudgeTitle.textColor = [GVColor hexStringToColor:@"#aaaaaa"] ;
        _labMenuJudgeTitle.text = @"菜品评价" ;
        _textH1 = [SelfAdaption text:_labMenuJudgeTitle.text size:ScreenWIDTH - SIZE(48.0) fontSize:28.0] ;
        [self.contentView   addSubview:  self.labMenuJudgeTitle] ;
     
        //好评率
        _labGoodJudge = [[UILabel alloc]init];
        _labGoodJudge.text  = @"(好评率98%)" ;
        _labGoodJudge.font = [UIFont systemFontOfSize:SIZE(24.0)] ;
        _labGoodJudge.textColor = [GVColor hexStringToColor:@"#333333"] ;
        [self.contentView   addSubview:  self.labGoodJudge] ;
        
        //头像
        _imgCustomer = [[UIImageView alloc]init];
        _imgCustomer.image  =[UIImage imageNamed:@"2.jpg"] ;
        _imgCustomer.layer.masksToBounds = YES ;
        _imgCustomer.layer.cornerRadius = SIZE(30) ;
        [self.contentView   addSubview:  self.imgCustomer] ;
        
        //食客名字
        _labCustomerName = [[UILabel alloc]init] ;
        _labCustomerName.text = @"和我一样打死你" ;
        _labCustomerName.font = [UIFont systemFontOfSize:SIZE(26.0)] ;
        _labCustomerName.textColor= [GVColor hexStringToColor:@"#888888"] ;
        _textH2 = [SelfAdaption text:_labCustomerName.text size:ScreenWIDTH - SIZE(48.0) fontSize:26.0] ;
        [self.contentView  addSubview:self.labCustomerName] ;
        
        //评价时间
        _labJudgeDate = [[UILabel alloc]init];
        _labJudgeDate.text = @"2017.01.04" ;
        _labJudgeDate.font = [UIFont systemFontOfSize:SIZE(22.0)] ;
        _labJudgeDate.textColor = [GVColor hexStringToColor:@"#aaaaaa"] ;
        [self.contentView   addSubview:  self.labJudgeDate] ;
        
        //评价内容
        _labMenuJudgeInfo = [[UILabel alloc]init];
        _labMenuJudgeInfo.text = @"哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼哼 " ;
        _labMenuJudgeInfo.font = [UIFont systemFontOfSize:SIZE(30.0)] ;
        _labMenuJudgeInfo.textColor = [GVColor hexStringToColor:@"#333333"] ;
        _labMenuJudgeInfo.numberOfLines = 0 ;
        _labMenuJudgeInfo.lineBreakMode = UILineBreakModeCharacterWrap ;
        _textH3 = [SelfAdaption text:_labMenuJudgeInfo.text size:ScreenWIDTH - SIZE(48.0) fontSize:30.0] ;
        [self.contentView   addSubview:  self.labMenuJudgeInfo] ;
    
        
        
        
        
        
        
//        CGRect txtFrame = _labMenuJudgeInfo.frame;
//        
//        _labMenuJudgeInfo.frame = CGRectMake(10, 100, 300,
//                                 txtFrame.size.height =[_labMenuJudgeInfo.text boundingRectWithSize:
//                                                        CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
//                                                                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
//                                                                             attributes:[NSDictionary dictionaryWithObjectsAndKeys:_labMenuJudgeInfo.font,NSFontAttributeName, nil] context:nil].size.height);
//        _labMenuJudgeInfo.frame = CGRectMake(10, 100, 300, txtFrame.size.height);
    }
    return self ;
}

-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_labMenuJudgeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SIZE(30.0)) ;
        make.left.mas_equalTo(SIZE(24.0)) ;
    }] ;
    
    [_labGoodJudge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.labMenuJudgeTitle.mas_bottom).offset(SIZE(0)) ;
        make.left.mas_equalTo(self.labMenuJudgeTitle.mas_right).offset(SIZE(24.0)) ;
    }] ;
    
    [_imgCustomer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labMenuJudgeTitle.mas_bottom).offset(SIZE(26.0)) ;
        make.left.mas_equalTo(self.labMenuJudgeTitle.mas_left) ;
        make.width.and.height.mas_equalTo(SIZE(60.0)) ;
    }] ;
    
    [_labCustomerName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labMenuJudgeTitle.mas_bottom).offset(SIZE(26.0)) ;
        make.left.mas_equalTo(self.imgCustomer.mas_right).offset(SIZE(16.0)) ;
    }] ;
    
    [_labJudgeDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.labCustomerName.mas_centerY) ;
        make.left.mas_equalTo(self.labCustomerName.mas_right).offset(SIZE(20.0)) ;
    }] ;
    
    [_labMenuJudgeInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labCustomerName.mas_bottom).offset(SIZE(18.0)) ;
        make.left.mas_equalTo(self.imgCustomer.mas_right).offset(SIZE(16.0)) ;
        make.right.mas_equalTo(self.mas_right).offset(SIZE(-24.0)) ;
//        make.bottom.mas_equalTo(self.mas_bottom).offset(SIZE(18.0)) ;
    }] ;
    
    
    if ([self.delegate respondsToSelector:@selector(tableRowHeight3:)]) {
        [self.delegate tableRowHeight3:self] ;
    }
    
//    superTabV.tableView.rowHeight  = SIZE(92.0) + _labMenuJudgeInfo.frame.size.height + _labCustomerName.frame.size.width + _labMenuJudgeTitle.frame.size.height ;
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

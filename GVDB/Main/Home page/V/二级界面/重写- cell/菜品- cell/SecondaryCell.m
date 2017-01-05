//
//  SecondaryCell.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/30.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "SecondaryCell.h"

@implementation SecondaryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

// 增加
-(void)addBtnCell:(UIButton *)btn
{
    if([self.delegate respondsToSelector:@selector(addSencondary:)])
    {
        [self.delegate  addSencondary:self];
    }
}
//减少
-(void)reduceBtnCell:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(reduceSencondary:)]) {
        [self.delegate reduceSencondary:self] ;
    }
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        //菜图
        _foodImg = [[UIImageView alloc]init] ;
        
        // 菜名
        _foodName = [[UILabel alloc]init] ;
        _foodName.font = [UIFont systemFontOfSize:16] ;
        _foodName.textColor = [GVColor hexStringToColor:@"#333333"] ;
        _foodName.font = [UIFont boldSystemFontOfSize:11.0] ;
        
       // 月销售量
        _labSucceedNum = [[UILabel alloc]init] ;
        _labSucceedNum.font = [UIFont systemFontOfSize:12] ;
        _labSucceedNum.textColor = [GVColor hexStringToColor:@"#888888"] ;

        // 好评率
        _labFoodJudge = [[UILabel alloc]init] ;
        _labFoodJudge.font = [UIFont systemFontOfSize:12] ;
        _labFoodJudge.textColor = [GVColor hexStringToColor:@"#888888"] ;
        
        // 价格
        _labPrice = [[UILabel alloc]init] ;
        _labPrice.font = [UIFont systemFontOfSize:17] ;
        _labPrice.textColor = [GVColor hexStringToColor:@"#e4562f"] ;
        
        // 价格符号
        _labPriceSymbol = [[UILabel alloc]init] ;
        _labPriceSymbol.font = [UIFont systemFontOfSize:12] ;
        _labPriceSymbol.textColor = [GVColor hexStringToColor:@"#e4562f"] ;
        _labPriceSymbol.text = @"¥" ;
        
        //添加
        _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnAdd setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal] ;
        [self.btnAdd addTarget:self action:@selector(addBtnCell:) forControlEvents:UIControlEventTouchUpInside];
        
        // 份数
        _labFoodNum = [[UILabel alloc]init] ;
        _labFoodNum.font = [UIFont systemFontOfSize:15] ;
        _labFoodNum.textColor = [GVColor hexStringToColor:@"#333333"] ;
        [_labFoodNum setHidden:YES] ;
        
        // 减少
        _btnReduce = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [_btnReduce setImage:[UIImage imageNamed:@"subtract"] forState:UIControlStateNormal] ;
        [_btnReduce setHidden:YES] ;
        [self.btnReduce addTarget:self action:@selector(reduceBtnCell:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.contentView    addSubview:      self.foodImg] ;
        [self.contentView    addSubview:      self.foodName] ;
        [self.contentView    addSubview:      self.labSucceedNum] ;
        [self.contentView    addSubview:      self.labFoodJudge] ;
        [self.contentView    addSubview:      self.labPriceSymbol] ;
        [self.contentView    addSubview:      self.labPrice] ;
        [self.contentView    addSubview:      self.btnAdd] ;
        [self.contentView    addSubview:      self.labFoodNum] ;
        [self.contentView    addSubview:      self.btnReduce] ;
        
    }
    return self ;
}

// 布局
-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    
    [_foodImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.contentView.mas_top).with.offset(SIZE(20.0)) ;
        make.left.mas_equalTo (self.contentView.mas_left).with.offset(SIZE(24.0)) ;
        make.width.mas_equalTo (SIZE(180.0)) ;
        make.height.mas_equalTo (SIZE(130.0)) ;
    }] ;
    
    [_foodName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.foodImg.mas_top) .with.offset (SIZE(0));
        make.left.mas_equalTo (self.foodImg.mas_right).with.offset (SIZE(30.0)) ;
    }] ;
    
    [_labSucceedNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.foodName.mas_bottom).with.offset(SIZE(12.0)) ;
        make.left.mas_equalTo(self.foodName.mas_left) ;
    }] ;

    [_labFoodJudge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.labSucceedNum.mas_top);
        make.left.mas_equalTo (self.labSucceedNum.mas_right).with.offset (SIZE(36.0)) ;
    }] ;
    
    [_labPriceSymbol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.labSucceedNum.mas_bottom) .with.offset (SIZE(37.0));
        make.left.mas_equalTo (self.foodImg.mas_right).with.offset (SIZE(30.0)) ;
    }] ;
    
    [_labPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.labSucceedNum.mas_bottom).with.offset (SIZE(30.0)) ;
        make.left.mas_equalTo (self.labPriceSymbol.mas_right).with.offset (0) ;
    }] ;
    
    [_btnAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.foodImg.mas_top) .with.offset (0);
        make.right.mas_equalTo (self.mas_right).with.offset (SIZE(-24.0)) ;
        make.width.and.height.mas_equalTo(SIZE(44.0)) ;
    }] ;
    
    [_labFoodNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo (self.btnAdd.mas_centerY) ;
        make.right.mas_equalTo (self.btnAdd.mas_left).with.offset (SIZE(-14.0)) ;
    }] ;
    
    [_btnReduce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.btnAdd.mas_top) ;
        make.right.mas_equalTo (self.labFoodNum.mas_left).with.offset (SIZE(-14.0)) ;
    }] ;
    
}


-(void)setSecondaryModel_menu_info:(SecondaryModel_menu_info *)secondaryModel_menu_info{
    _secondaryModel_menu_info = secondaryModel_menu_info ;
    
    _id = secondaryModel_menu_info.id ;
    _rated = secondaryModel_menu_info.rated ;
    _stock = secondaryModel_menu_info.stock ;
    
    [_foodImg sd_setImageWithURL:[NSURL URLWithString:secondaryModel_menu_info.photo]placeholderImage:[UIImage imageNamed:@"backGround"]] ;
    _foodName.text = secondaryModel_menu_info.menu_name ;
    _labPrice.text=[NSString stringWithFormat:@"%.2f", secondaryModel_menu_info.menu_price]   ;
    _labSucceedNum.text = [NSString stringWithFormat:@"月售%@",secondaryModel_menu_info.count_num ];
    _labFoodJudge.text =  secondaryModel_menu_info.rated ;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

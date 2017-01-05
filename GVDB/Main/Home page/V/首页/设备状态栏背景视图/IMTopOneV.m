//
//  IMTopOneV.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "IMTopOneV.h"

@implementation IMTopOneV

-(UIView *)topSubView{
    if (!_topSubView) {
        _topSubView = [[UIView alloc]init] ;
    }
    return _topSubView ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.topSubView] ;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews] ;
    
    [_topSubView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (self.mas_left) ;
        make.right.mas_equalTo (self.mas_right) ;
        make.width.mas_equalTo (self.mas_width) ;
        make.height.mas_equalTo ( SIZE(40.0)) ;
    }] ;
}
@end

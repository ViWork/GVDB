//
//  IMSuperTableV.m
//  IMDB
//
//  Created by 赵鹏云 on 16/12/27.
//  Copyright © 2016年 Zpy. All rights reserved.
//

#import "IMSuperTableV.h"

@implementation IMSuperTableV

/* 懒加载 */
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView  =[[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain] ;
        _tableView.separatorInset = UIEdgeInsetsMake(0, SIZE(24.0), 0, SIZE(24.0)) ;
        _tableView.separatorColor = [GVColor hexStringToColor:@"#eeeeee"] ;
    }
    return _tableView ;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView] ;
    }
    return self;
}
@end

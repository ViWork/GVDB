//
//  IMTwoView.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "SecondarySuperView.h"
#define TOPVIEWHEIGHT SIZE(332.0) //表格内容上面的view高度

@implementation SecondarySuperView

/* 懒加载 */
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView  =[[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain] ;
        _tableView.tag = 501 ;
        _tableView.rowHeight = SIZE(170.0) ;
        _tableView.separatorInset = UIEdgeInsetsMake(0, SIZE(24.0), 0, SIZE(24.0)) ; //分割线内边距
        _tableView.separatorColor = [GVColor hexStringToColor:@"#eeeeee"] ;
        _tableView.contentInset = UIEdgeInsetsMake(TOPVIEWHEIGHT , 0, 10, 0) ; // 内边距
    }
    return _tableView ;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self     addSubview:    self.tableView] ;
    }
    return self;
}


@end

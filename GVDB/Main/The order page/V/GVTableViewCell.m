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
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

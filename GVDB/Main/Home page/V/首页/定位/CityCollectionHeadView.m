//
//  CityCollectionHeadView.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "CityCollectionHeadView.h"

@implementation CityCollectionHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.sectionTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, frame.size.width-5, frame.size.height)];
        self.sectionTitleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self addSubview:self.sectionTitleLabel];
    }
    return self;
}
@end

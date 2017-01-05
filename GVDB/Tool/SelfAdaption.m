//
//  SelfAdaption.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/5.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "SelfAdaption.h"

@implementation SelfAdaption

+(CGFloat)text:(NSString *)str size:(CGFloat)sizeWidth fontSize:(CGFloat)fontSize{
    CGSize maxSize = CGSizeMake(sizeWidth, MAXFLOAT);
    CGFloat example = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:SIZE(fontSize)]} context:nil].size.height ;
    return example ;
}


@end

//
//  ThreeModel.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/5.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "EveryMenuModel.h"

@implementation EveryMenuModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"菜品详情页面属性出错 : %@",key) ;
}
@end

@implementation EveryMenuModel_comment
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"菜品详情页面属性出错 : %@",key) ;
}
@end

@implementation EveryMenuModel_photo
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"菜品详情页面属性出错 : %@",key) ;
}
@end

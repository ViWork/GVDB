//
//  SecondaryModel.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/30.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "SecondaryModel.h"

@implementation SecondaryModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"二级页面属性出错 : %@",key) ;
}
@end


@implementation SecondaryModel_menu_info

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"二级页面属性出错 : %@",key) ;
}

@end


@implementation SecondaryModel_type

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"二级页面属性出错 : %@",key) ;
}

@end

//
//  FirstModel.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/2.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import "FirstModel.h"

@implementation FirstModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"首页属性出错 : %@",key) ;
}
@end


@implementation FirstModel_info

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"首页属性出错 : %@",key) ;
}
@end

@implementation FirstModel_hot

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"首页属性出错 : %@",key) ;
}

@end

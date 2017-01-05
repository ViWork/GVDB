//
//  AlertData.m
//  城市列表
//
//  Created by 赵鹏云 on 16/12/19.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import "AlertData.h"
#import "MBProgressHUD.h"

static AlertData *alertData ;
@implementation AlertData

+(instancetype)showMessage{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertData = [[AlertData alloc]init] ;
    });
    return alertData ;
}

//+(instancetype)allocWithZone:(struct _NSZone *)zone{
//    if (!alertData) {
//        alertData = [super allocWithZone:zone] ;
//    }
//    return alertData ;
//}


#pragma mark 显示一些信息
- (void)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.labelFont = [UIFont systemFontOfSize:50] ;
    
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.5];
    
    /*  提示框大小 */
    hud.minSize = CGSizeMake(100, 100) ;
}

@end

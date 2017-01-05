//
//  AlertData.h
//  城市列表
//
//  Created by 赵鹏云 on 16/12/19.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertData : NSObject

+(instancetype)showMessage ;

- (void)showMessage:(NSString *)message toView:(UIView *)view  ;

@end

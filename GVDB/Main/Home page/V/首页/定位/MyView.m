//
//  MyView.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *result = [super hitTest:point withEvent:event];
    if (result == self) {
        return nil;
    } else {
        return result;
    }
}

@end

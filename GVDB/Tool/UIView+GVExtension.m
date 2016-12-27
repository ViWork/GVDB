//
//  UIView+GVExtension.m
//  GVLogin
//
//  Created by Viosky on 2016/12/4.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "UIView+GVExtension.h"

@implementation UIView (GVExtension)
- (void)setGv_x:(CGFloat)gv_x {

    CGRect frame = self.frame;

    frame.origin.x = gv_x;

    self.frame = frame;
}

- (CGFloat)gv_x {

    return self.frame.origin.x;
}


- (void)setGv_y:(CGFloat)gv_y{

    CGRect frame = self.frame;

    frame.origin.y = gv_y;

    self.frame = frame;
}

- (CGFloat)gv_y {

    return self.frame.origin.y;
}


- (void)setGv_centerX:(CGFloat)gv_centerX {

    CGPoint center = self.center;

    center.x = gv_centerX;

    self.center = center;
}

- (CGFloat)gv_centerX {

    return self.center.x;
}


- (void)setGv_centerY:(CGFloat)gv_centerY {

    CGPoint center = self.center;

    center.y = gv_centerY;

    self.center = center;
}

- (CGFloat)gv_centerY {

    return self.center.y;
}


- (void)setGv_origin:(CGPoint)gv_origin {

    CGRect frame = self.frame;

    frame.origin = gv_origin;

    self.frame = frame;
}

- (CGPoint)gv_origin {

    return self.frame.origin;
}


- (void)setGv_size:(CGSize)gv_size {

    CGRect frame = self.frame;

    frame.size = gv_size;

    self.frame = frame;
}

- (CGSize)gv_size {

    return self.frame.size;
}


- (void)setGv_width:(CGFloat)gv_width {

    CGRect frame = self.frame;

    frame.size.width = gv_width;

    self.frame = frame;
}

- (CGFloat)gv_width {

    return self.frame.size.width;
}


- (void)setGv_height:(CGFloat)gv_height{

    CGRect frame = self.frame;

    frame.size.height = gv_height;

    self.frame = frame;
}

- (CGFloat)gv_height {

    return self.frame.size.height;
}

@end

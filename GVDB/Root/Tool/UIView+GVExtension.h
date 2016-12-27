//
//  UIView+GVExtension.h
//  GVLogin
//
//  Created by Viosky on 2016/12/24.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GVExtension)

/**
 @brief  X坐标点
 */
@property(nonatomic, assign)CGFloat gv_x;


/**
 @brief Y坐标点
 */
@property(nonatomic, assign)CGFloat gv_y;


/**
 @brief X中心点
 */
@property(nonatomic, assign)CGFloat gv_centerX;


/**
 @brief Y中心点
 */
@property(nonatomic, assign)CGFloat gv_centerY;


/**
 @brief 坐标
 */
@property(nonatomic, assign)CGPoint gv_origin;


/**
 @brief 宽度
 */
@property(nonatomic, assign)CGFloat gv_width;


/**
 @brief 高度
 */
@property(nonatomic, assign)CGFloat gv_height;


/**
 @brief 尺寸
 */
@property(nonatomic, assign)CGSize gv_size;
@end

//
//  SecondaryModel.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/30.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SecondaryModel_type ;
@class SecondaryModel_menu_info ;


@interface SecondaryModel : NSObject
@property(nonatomic,strong)NSString * id ;
/**
 是否支持外卖
 */
@property(nonatomic,strong)NSString * is_outsite ;

/**
 菜品详情
 */
@property(nonatomic,strong)NSArray * menu_info ;

/**
 商店介绍
 */
@property(nonatomic,strong)NSString * store_con ;

/**
 商店名字
 */
@property(nonatomic,strong)NSString * store_name ;

/**
 商店图片
 */
@property(nonatomic,strong)NSString * store_photo ;

/**
 商店类型
 */
@property(nonatomic,strong)NSArray * type ;

@end

// 2.
@interface SecondaryModel_menu_info :NSObject

/**
 
 */
@property(nonatomic,strong)NSString * count_num ;

/**
 菜品套餐
 */
@property(nonatomic,strong)NSString * foot_type ;
@property(nonatomic,strong)NSString * id ;

/**
 菜品名字
 */
@property(nonatomic,strong)NSString * menu_name ;

/**
 菜品价格
 */
//@property(nonatomic,strong)NSString * menu_price ;
@property(nonatomic,assign)CGFloat  menu_price ;
/**
 
 */
@property(nonatomic,strong)NSString * menu_type ;

/**
 菜图片
 */
@property(nonatomic,strong)NSString * photo ;
@property(nonatomic,strong)NSString * rated ;
@property(nonatomic,strong)NSString * stock ;
@end


@interface SecondaryModel_type : NSObject
@property(nonatomic,strong)NSString * foot_type ;
@property(nonatomic,strong)NSString * id ;
@end

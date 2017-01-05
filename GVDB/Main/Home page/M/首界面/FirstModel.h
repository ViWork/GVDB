//
//  FirstModel.h
//  GVDB
//
//  Created by 赵鹏云 on 17/1/2.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FirstModel_info ;
@class FirstModel_hot ;


@interface FirstModel : NSObject
@property(nonatomic,strong)NSArray * info, *img, *hot ;
@property(nonatomic,assign)NSInteger pag, page_all ;
@property(nonatomic,strong)NSString * city ;
@end

@interface FirstModel_info : NSObject

/**
 id, store_attr,   商店名字,  商店地址,   评价,   商店图片,   is_outsite,    商店所属类型,    距离,   订单数
 */
@property(nonatomic,strong)NSString * id ,    *store_attr,     *store_name,     *store_address,          *star,    *store_photo,    *is_outsite,     *menu_attr,     *juli,     *count ;

@end


@interface FirstModel_hot : NSObject

/**
 id,     订单数,    商店图片,     评价,    商店所属类型,    商店id,     商店名字,     is_outsite,       距离,
 */
@property(nonatomic,strong)NSString * id ,    *count ,     *store_photo,     *star,      *menu_attr,          *store_id,        *store_name,       *is_outsite,        *juli ;
@end



//
//  ThreeModel.h
//  GVDB
//
//  Created by 赵鹏云 on 17/1/5.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EveryMenuModel_comment ;
@class EveryMenuModel_photo ;

@interface EveryMenuModel : NSObject
@property(nonatomic,strong)NSArray * comment ;
@property(nonatomic,strong)NSArray * photo ;

@property(nonatomic,strong)NSString * content ;
@property(nonatomic,strong)NSString * count_num ;
@property(nonatomic,strong)NSString * id ;
@property(nonatomic,strong)NSString * menu_group ;
@property(nonatomic,strong)NSString * menu_name ;
@property(nonatomic,strong)NSString * menu_price ;
@property(nonatomic,strong)NSString * menu_type ;
@property(nonatomic,strong)NSString * rated ;
@property(nonatomic,strong)NSString * stock ;
@property(nonatomic,strong)NSString * store_id ;

@end

@interface EveryMenuModel_comment : NSObject
@property(nonatomic,strong)NSString * username ;
@property(nonatomic,strong)NSString * create_time ;
@property(nonatomic,strong)NSString * content ;
@property(nonatomic,strong)NSString * photo ;
@end

@interface EveryMenuModel_photo : NSObject

@end

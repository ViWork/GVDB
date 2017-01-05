//
//  HomeTableViewCell.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"

@interface HomeTableViewCell : UITableViewCell

@property(nonatomic,strong)FirstModel                 * fm ;

@property(nonatomic,strong)FirstModel_hot           * fm_hot ;

@property(nonatomic,strong)NSString * store_id ;
/**
 商家门店图
 */
@property(nonatomic,strong)UIImageView * shopImg ;

/**
 店名
 */
@property(nonatomic,strong)UILabel * shopName ;

/**
  是否支持外卖
 */
@property(nonatomic,strong)UIImageView * deliveryImgV ;
@property(nonatomic,strong)NSString * outsite ;

/**
 好评展示
 */
@property(nonatomic,strong)UIImageView * starImg ;
@property(nonatomic,strong)UIView * starView ;
@property(nonatomic,strong)NSString * star ;

/**
 成交量
 */
@property(nonatomic,strong)UILabel * labAgree ;

/**
 店主菜的所属类别
 */
@property(nonatomic,strong)UILabel * labFoodType ;

/**
 距离
 */
@property(nonatomic,strong)UILabel * labDistance ;


/**
 成交量与样式 间隔
 */
@property(nonatomic,strong)UILabel * labSpace ;
@end

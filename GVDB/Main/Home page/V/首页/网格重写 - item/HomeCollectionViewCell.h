//
//  HomeCollectionViewCell.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"

@interface HomeCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)FirstModel_info          * fm_info ;


/**
  门店的图片
 */
@property(nonatomic,strong)UIImageView * shopImgV ;


/**
 菜名的背景 图
 */
@property(nonatomic,strong)UIImageView * foodBackGroundImgV ;

/**
 店主菜的所属类别
 */
@property(nonatomic,strong)UILabel * labFoodType ;

/**
 店名
 */
@property(nonatomic,strong)UILabel * shopName ;

/**
 好评展示
 */
@property(nonatomic,strong)UIView * starView ;
@property(nonatomic,strong)NSString  * star ;

/**
 成交率
 */
@property(nonatomic,strong)UILabel * labAgree ;

/**
 距离
 */
@property(nonatomic,strong)UILabel * labDistance ;

@end

//
//  SecondaryTopView.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryModel.h"

@interface SecondaryTopView : UIView

@property(nonatomic,strong)SecondaryModel * secondaryModel ;

/**
 背景图
 */
@property(nonatomic,strong)UIImageView * backGroundImg ;

/**
 返回按钮
 */
@property(nonatomic,strong)UIButton * btnBack ;

/**
 商家门店图
 */
@property(nonatomic,strong)UIImageView * shopImg ;

/**
 店名
 */
@property(nonatomic,strong)UILabel * shopName ;

/**
 饭店详情
 */
@property(nonatomic,strong)UILabel * labShopInfo ;


/**
 收藏店铺
 */
@property(nonatomic,strong)UIButton * btnCollect ;

/**
 视图下面底层背景
 */
@property(nonatomic,strong)UILabel * labFloor ;

/**
 优惠图
 */
@property(nonatomic,strong)UIImageView * preferentialImg;

/**
 优惠政策
 */
@property(nonatomic,strong)UILabel * labRreferentialInfo ;

/**
 是否定外卖
 */
@property(nonatomic,strong)UIButton * btnDelivery ;
@end

//
//  IMHeaderView.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMHeaderView : UIView

/**
 滚动视图
 */
@property(nonatomic,strong)UIScrollView * scrollV ;

/**
     热门推荐, 附近餐馆, 左横杠, 右横杠
 */
@property(nonatomic,strong)UILabel  *middleLab1, *middleLab2, * leftLabLine1 , *rightLabLine1 ,* leftLabLine2 , *rightLabLine2  ;
/**
 网格
 */
@property(nonatomic,strong)UICollectionView * collectionV ;


/**
    全部
 */
@property(nonatomic,strong)UIButton * btnAll ;

/**
    附近
 */
@property(nonatomic,strong)UIButton * btnNearby ;


/**
 综合排序
 */
@property(nonatomic,strong)UIButton * btnSequence ;

/**
 下拉箭头
 */
@property(nonatomic,strong)UIImageView * imgScopeV1, * imgScopeV2, * imgScopeV3 ;

@end

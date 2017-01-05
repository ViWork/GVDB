//
//  SecondaryCell.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/30.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryModel.h"



@class SecondaryCell;


// 声明协议
@protocol sencondaryDelegate <NSObject>

-(void)addSencondary:(SecondaryCell *)sencon ; // 添加按钮
-(void)reduceSencondary:(SecondaryCell *)sencon ; //减少按钮
@end

@interface SecondaryCell : UITableViewCell

@property(nonatomic,weak) id<sencondaryDelegate>delegate;
@property(nonatomic,strong)SecondaryModel_menu_info * secondaryModel_menu_info ;
@property(nonatomic,strong)NSString * id ;
@property(nonatomic,strong)NSString * rated ;
@property(nonatomic,strong)NSString * stock ;

/**
 商家c菜图
 */
@property(nonatomic,strong)UIImageView * foodImg ;

/**
 菜名
 */
@property(nonatomic,strong)UILabel * foodName ;

/**
 月销售量
 */
@property(nonatomic,strong)UILabel * labSucceedNum ;

/**
 评价
 */
@property(nonatomic,strong)UILabel * labFoodJudge ;


/**
 价格
 */
@property(nonatomic,strong)UILabel * labPrice ;

/**
 价格符号
 */
@property(nonatomic,strong)UILabel * labPriceSymbol ;

/**
 份数
 */
@property(nonatomic,strong)UILabel * labFoodNum ;


/**
 增加 所定的 菜份数
 */
@property(nonatomic,strong)UIButton * btnAdd ;

/**
 减少 所定的 菜份数
 */
@property(nonatomic,strong)UIButton * btnReduce ;
@end

//
//  MenuOneCell.h
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuOneCell ;

@protocol MenuOneCellDelegate <NSObject>

-(CGFloat)tableRowHeight:(MenuOneCell *)oneCell ;

@end

@interface MenuOneCell : UITableViewCell
@property(nonatomic,strong)id<MenuOneCellDelegate> delegate ;
@property(nonatomic,assign)CGFloat  textH1,textH2, textH3 ;

/**
 菜品名字
 */
@property(nonatomic,strong)UILabel * labMenuName ;

/**
 月销售量
 */
@property(nonatomic,strong)UILabel * labSellNum;

/**
 价格
 */
@property(nonatomic,strong)UILabel * labMenuPrice ;

/**
 价格符号
 */
@property(nonatomic,strong)UILabel * labMenuPriceSymbol ;

/**
 添加评论
 */
@property(nonatomic,strong)UIButton * btnAddComment ;
@end

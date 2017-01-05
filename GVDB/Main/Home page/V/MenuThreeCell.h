//
//  MenuThreeCell.h
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuThreeCell ;

@protocol MenuThreeCellDelegate <NSObject>

-(CGFloat)tableRowHeight3:(MenuThreeCell *)threeCell ;

@end


@interface MenuThreeCell : UITableViewCell
@property(nonatomic,strong)id<MenuThreeCellDelegate> delegate ;
@property(nonatomic,assign)CGFloat  textH1,textH2, textH3 ;

/**
 菜品评价
 */
@property(nonatomic,strong)UILabel * labMenuJudgeTitle ;

/**
 好评率
 */
@property(nonatomic,strong)UILabel * labGoodJudge ;

/**
 食客头像
 */
@property(nonatomic,strong)UIImageView * imgCustomer ;

/**
 食客名字
 */
@property(nonatomic,strong)UILabel * labCustomerName ;

/**
 评价内容
 */
@property(nonatomic,strong)UILabel * labMenuJudgeInfo ;

/**
 评价时间
 */
@property(nonatomic,strong)UILabel * labJudgeDate ;
@end

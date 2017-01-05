//
//  MenuFourCell.h
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuFourCell ;

@protocol MenuFourCellDelegate <NSObject>

-(CGFloat)tableRowHeight4:(MenuFourCell *)fourCell ;

@end

@interface MenuFourCell : UITableViewCell

@property(nonatomic,strong)id<MenuFourCellDelegate> delegate ;
@property(nonatomic,assign)CGFloat  textH1,textH2 ;

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

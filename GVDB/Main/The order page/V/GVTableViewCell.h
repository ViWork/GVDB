//
//  GVTableViewCell.h
//  GVDB
//
//  Created by Viosky on 2016/12/27.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GVTableViewCell : UITableViewCell

/**
 @brief 账单编号
 */
@property (nonatomic , strong) UILabel *orderID;
/**
 @brief 店铺名字
 */
@property (nonatomic , strong) UILabel *tradeName;

/**
 @brief 类型名字
 */
@property (nonatomic , strong) UILabel *typeName;
/**
 @brief 购买渠道
 */
@property (nonatomic , strong) UILabel *purchaseWay;
/**
 @brief 购买日期
 */
@property (nonatomic , strong) UILabel *buyDate;
/**
 @brief 购买时间
 */
@property (nonatomic , strong) UILabel *buytime;
/**
 @brief 金额
 */
@property (nonatomic , strong) UILabel *moneyLabel;
/**
 @brief 钱数
 */
@property (nonatomic , strong) UILabel *money;
/**
 @brief 上边的分割线
 */
@property (nonatomic , strong) UIView *topLine;
/**
 @brief 下边的分割线
 */
@property (nonatomic , strong) UIView *bouttnLine;
/**
 @brief 店铺图片
 */
@property (nonatomic , strong) UIImageView *tradeIcon;
/**
 @brief 是否付款按钮
 */
@property (nonatomic , strong) UIButton *isPay;
@end

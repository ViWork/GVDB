//
//  GVTableViewCell.h
//  GVDB
//
//  Created by Viosky on 2016/12/27.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GVTableViewCell : UITableViewCell
@property (nonatomic , strong) UILabel *orderLabel;
@property (nonatomic , strong) UILabel *tradeName;
@property (nonatomic , strong) UILabel *typeName;
@property (nonatomic , strong) UILabel *purchaseWay;
@property (nonatomic , strong) UILabel *buyDate;
@property (nonatomic , strong) UILabel *buytime;
@property (nonatomic , strong) UILabel *moneyLabel;
@property (nonatomic , strong) UILabel *money;

@property (nonatomic , strong) UIView *topLine;
@property (nonatomic , strong) UIView *bouttnLine;
@end

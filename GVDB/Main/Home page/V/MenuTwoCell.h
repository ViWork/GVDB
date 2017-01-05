//
//  MenuTwoCell.h
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuTwoCell ;

@protocol MenuTwoCellDelegate <NSObject>

-(CGFloat)tableRowHeight2:(MenuTwoCell *)twoCell ;

@end

@interface MenuTwoCell : UITableViewCell
@property(nonatomic,strong)id<MenuTwoCellDelegate> delegate ;
@property(nonatomic,assign)CGFloat  textH1,textH2 ;
/**
 特色说明
 */
@property(nonatomic,strong)UILabel * labExplain ;

/**
 特色说明具体内容
 */
@property(nonatomic,strong)UILabel * labExplainInfo ;
@end

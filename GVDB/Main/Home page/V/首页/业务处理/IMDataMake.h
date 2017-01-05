//
//  IMDataMake.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PopoverView.h"

@interface IMDataMake : NSObject

+(instancetype)sharedClick  ;


-(void)collectShopp ;

/**
 滚动视图

 @param integer 按钮tag值
 */
-(void)getScrollButtonTag:(NSInteger)integer ;


/**
 扫码, 登录, 付款
@return 帮助列表
 */
- (NSArray<PopoverAction *> *)oneActions ;

/**
 全部食品

 @return 食品类型列表
 */
- (NSArray<PopoverAction *> *)TwoActions ;


/**
 附近

 @return 附近距离列表
 */
-(NSArray<PopoverAction *> *)threeActions ;


/**
 综合排序

 @return 销量, 好评 由高至低
 */
-(NSArray<PopoverAction *> *)fourActions ;

@end

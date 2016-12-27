//
//  LYMineChoiceBar.h
//  ShoppingGuide
//
//  Created by coderLL on 16/9/18.
//  Copyright © 2016年 Andrew554. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GVMineChoiceBarDelegate <NSObject>

@optional

- (void)choiceBarClick:(NSInteger) index;

@end

@interface GVMineChoiceBar : UIView
@property (nonatomic , assign) NSInteger typr;
@property (nonatomic, weak) id<GVMineChoiceBarDelegate> delegate;

@end

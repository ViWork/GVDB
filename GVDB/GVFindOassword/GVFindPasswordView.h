//
//  GVFindPasswordView.h
//  GVLogin
//
//  Created by BanWanXin on 2016/12/20.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface GVFindPasswordView : UIView<UITextFieldDelegate>
@property(nonnull,strong)UITextField* bwxtelText;
@property(nonnull,strong)UITextField* bwxVerText;
@property(nonnull,strong)UIButton* bwxVerButton;

@property(nonnull,strong)UIButton* bwxLoginBurron;
@property(nonnull,strong)NSString    *_previousTextFieldContent;

@property(nonnull,strong)UITextRange *_previousSelection;


@end

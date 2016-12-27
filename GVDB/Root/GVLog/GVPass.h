//
//  GVPass.h
//  GVLogin
//
//  Created by Viosky on 2016/12/21.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GVPass : UIView
@property (nonatomic , strong) UIImageView *telImage;
@property (nonatomic , strong) UIImageView *passImage;
@property (nonatomic , strong) UITextField *userName;
@property (nonatomic , strong) UITextField *passWord;

@property (nonatomic , strong) UIButton *yanz;
@property (nonatomic , strong) UIButton *retrieve;

@property (nonatomic , strong) UIView *line_1;
@property (nonatomic , strong) UIView *line_2;
@property (nonatomic , strong) UILabel *lable;
@end

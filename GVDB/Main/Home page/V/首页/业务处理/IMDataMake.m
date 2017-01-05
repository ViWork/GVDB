//
//  IMDataMake.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "IMDataMake.h"
#import "IMHeaderView.h"
#import "SecondaryTopView.h"

static IMDataMake *dataMake ;

@implementation IMDataMake
{
    IMHeaderView *_headerView ;
    SecondaryTopView *_secondaryTopV ;
    BOOL _newBOOL ;
}


+(instancetype)sharedClick{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataMake = [[IMDataMake alloc]init] ;
    });
    return dataMake ;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    if (!dataMake) {
        dataMake = [super allocWithZone:zone] ;
        
    }
    return dataMake ;
}

-(void)collectShopp{
    _newBOOL = YES ;
    [_secondaryTopV.btnCollect addTarget:self action:@selector(isCollect:) forControlEvents:UIControlEventValueChanged] ;
}

-(void)isCollect:(BOOL)bol
{
    bol = _newBOOL ;
    if (bol) {
        bol = !bol ;
        [_secondaryTopV.btnCollect setImage:[UIImage imageNamed:@"collect_down"] forState:UIControlStateNormal] ;
        NSLog(@"11111") ;
    }else{
        bol = !bol ;
        [_secondaryTopV.btnCollect setImage:[UIImage imageNamed:@"collect_up"] forState:UIControlStateNormal] ;
        NSLog(@"11111") ;
    }
}
// 滚动视图
-(void)getScrollButtonTag:(NSInteger)integer{
    switch (integer) {
        case 100:
            NSLog(@"第一个") ;
            break;
        case 101:
            NSLog(@"第二个") ;
            break;
        case 102:
            NSLog(@"第三个") ;
            break;
        default:
            break;
    }
}

- (NSArray<PopoverAction *> *)oneActions {
    // 扫一扫 action
    PopoverAction *QRAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_QR"] title:@"扫一扫" handler:^(PopoverAction *action) {
        NSLog(@"扫一扫") ;
    }];
    // 付款 action
    PopoverAction *payMoneyAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"付  款" handler:^(PopoverAction *action) {
        NSLog(@"付款") ;
    }];
    // 登录 action
    PopoverAction *loginMoneyAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"mine_down"] title:@"登  录" handler:^(PopoverAction *action) {
        NSLog(@"登录") ;
    }];
    return @[ QRAction, payMoneyAction, loginMoneyAction];
}

- (NSArray<PopoverAction *> *)TwoActions{
    PopoverAction *action1 = [PopoverAction actionWithTitle:@"全部" handler:^(PopoverAction *action) {
        [_headerView.btnAll setTitle:action.title forState:UIControlStateNormal] ;
        _headerView.middleLab1.text = action.title ;
        NSLog(@"%@",action.title) ;
    }];
    PopoverAction *action2 = [PopoverAction actionWithTitle:@"火锅" handler:^(PopoverAction *action) {
        [_headerView.btnAll setTitle:action.title forState:UIControlStateNormal] ;
        NSLog(@"%@",action.title) ;
    }];
    PopoverAction *action3 = [PopoverAction actionWithTitle:@"小吃快餐" handler:^(PopoverAction *action) {
        [_headerView.btnAll setTitle:action.title forState:UIControlStateNormal] ;
    }];
    PopoverAction *action4 = [PopoverAction actionWithTitle:@"自助餐" handler:^(PopoverAction *action) {
        [_headerView.btnAll setTitle:action.title forState:UIControlStateNormal] ;
    }];
    PopoverAction *action5 = [PopoverAction actionWithTitle:@"烧烤烤肉" handler:^(PopoverAction *action) {
        [_headerView.btnAll setTitle:action.title forState:UIControlStateNormal] ;
    }];
    PopoverAction *action6 = [PopoverAction actionWithTitle:@"甜点饮品" handler:^(PopoverAction *action) {
        [_headerView.btnAll setTitle:action.title forState:UIControlStateNormal] ;
    }];
    
    return @[action1, action2, action3, action4, action5,action6];
}


-(NSArray<PopoverAction *> *)threeActions{
    PopoverAction *action1 = [PopoverAction actionWithTitle:@"附近" handler:^(PopoverAction *action) {
        [_headerView.btnNearby setTitle:action.title forState:UIControlStateNormal] ;
    }];
    PopoverAction *action2 = [PopoverAction actionWithTitle:@"100以内" handler:^(PopoverAction *action) {
        [_headerView.btnNearby setTitle:action.title forState:UIControlStateNormal] ;
    }];
    PopoverAction *action3 = [PopoverAction actionWithTitle:@"300米以内" handler:^(PopoverAction *action) {
        [_headerView.btnNearby setTitle:action.title forState:UIControlStateNormal] ;
    }];
    PopoverAction *action4 = [PopoverAction actionWithTitle:@"500米以内" handler:^(PopoverAction *action) {
        [_headerView.btnNearby setTitle:action.title forState:UIControlStateNormal] ;
    }];
    PopoverAction *action5 = [PopoverAction actionWithTitle:@"1千米以内" handler:^(PopoverAction *action) {
        [_headerView.btnNearby setTitle:action.title forState:UIControlStateNormal] ;
    }];
    PopoverAction *action6 = [PopoverAction actionWithTitle:@"3千米以内" handler:^(PopoverAction *action) {
        [_headerView.btnNearby setTitle:action.title forState:UIControlStateNormal] ;
    }];
    
    return @[action1, action2, action3, action4, action5,action6];
}

-(NSArray<PopoverAction *> *)fourActions{
        PopoverAction *action1 = [PopoverAction actionWithTitle:@"综合排序" handler:^(PopoverAction *action) {
            [_headerView.btnSequence setTitle:action.title forState:UIControlStateNormal] ;
        }];
        PopoverAction *action2 = [PopoverAction actionWithTitle:@"销量由高到低" handler:^(PopoverAction *action) {
            [_headerView.btnSequence setTitle:action.title forState:UIControlStateNormal] ;
        }];
        PopoverAction *action3 = [PopoverAction actionWithTitle:@"好评由高到低" handler:^(PopoverAction *action) {
            _headerView.btnSequence.titleLabel.text = action.title ;
        }];
        PopoverAction *action4 = [PopoverAction actionWithTitle:@"人气排序" handler:^(PopoverAction *action) {
            [_headerView.btnSequence setTitle:action.title forState:UIControlStateNormal] ;
        }];
        return @[action1, action2, action3, action4];
}


@end

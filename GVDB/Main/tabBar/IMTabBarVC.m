//
//  TabBarVC.m
//  新养道
//
//  Created by 赵鹏云 on 16/10/31.
//  Copyright © 2016年 Zpy. All rights reserved.
//

#import "IMTabBarVC.h"
#import "IMNavigationVC.h"
#import "IMHomeSuperViewController.h"
#import "IMDeliveryViewController.h"
#import "IMOrderViewController.h"
#import "IMMyViewController.h"



@interface IMTabBarVC ()

@end

@implementation IMTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setControllers] ;
}
- (void)setControllers{
    
    //配置的各个tabbar对应的controller

    
    IMNavigationVC *nvc1 = [[IMNavigationVC alloc]initWithRootViewController:[[IMHomeSuperViewController alloc]init]] ;
    IMNavigationVC *nvc2 = [[IMNavigationVC alloc]initWithRootViewController:[[IMDeliveryViewController alloc]init]] ;
    IMNavigationVC *nvc3 = [[IMNavigationVC alloc]initWithRootViewController:[[IMOrderViewController alloc]init]] ;
    IMNavigationVC *nvc4 = [[IMNavigationVC alloc]initWithRootViewController:[[IMMyViewController alloc]init]] ;
    
    nvc1.tabBarItem = [self itemWithSelectedImage:@"home_up" image:@"home_press" title:@"首页"] ;
    nvc2.tabBarItem = [self itemWithSelectedImage:@"indent_up" image:@"indent_down" title:@"外卖"] ;
    nvc3.tabBarItem = [self itemWithSelectedImage:@"mine_up" image:@"mine_down" title:@"订单"] ;
    nvc4.tabBarItem = [self itemWithSelectedImage:@"take_up" image:@"take_down" title:@"我的"] ;
    //统一用tabbar来管理navigationController
    self.viewControllers = @[nvc1, nvc2, nvc3, nvc4];
    self.tabBar.tintColor = [GVColor hexStringToColor:@"#ffba14"];
    self.tabBar.barTintColor = [UIColor whiteColor];
    
}

- (UITabBarItem *)itemWithSelectedImage:(NSString *)selectImage image:(NSString *)image title:(NSString *)title
{
    UIImage *im = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:im selectedImage:[UIImage imageNamed:selectImage]];
    
    return item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

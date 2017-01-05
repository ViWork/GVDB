//
//  NavigationVC.m
//  新养道
//
//  Created by 赵鹏云 on 16/10/31.
//  Copyright © 2016年 Zpy. All rights reserved.
//

#import "IMNavigationVC.h"

@interface IMNavigationVC ()

@end

@implementation IMNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor] ;
}


-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController] ;
    if (self) {
        // 导航条颜色
        self.navigationBar.barTintColor = [UIColor whiteColor] ;
        //导航栏<按钮>字体颜色
        self.navigationBar.tintColor = [UIColor blueColor];
        //导航栏的字体颜色,大小
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldItalicMT" size:17]}];

    }
    return self ;
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

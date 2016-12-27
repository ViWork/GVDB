//
//  ViewController.m
//  GVDB
//
//  Created by Viosky on 2016/12/26.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *  btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal] ;
    [btn addTarget:self action:@selector(clickOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

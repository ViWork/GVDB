//
//  ResetViewController.m
//  二级界面
//
//  Created by BanWanXin on 2016/12/20.
//  Copyright © 2016年 BanWanXin. All rights reserved.
//

#import "ResetViewController.h"
#import "ResetView.h"
#import "GVColor.h"
#import "GVFindPasswordViewController.h"
#import "ViewController.h"
@interface ResetViewController (){
    ResetView* myReset;
}

@end

@implementation ResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel* lableTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 54)];
    lableTitle.text = @"重 制 密 码";
    lableTitle.font = [UIFont systemFontOfSize:20];
    lableTitle.textColor = [GVColor hexStringToColor:@"#333333"];
    lableTitle.backgroundColor =[UIColor clearColor];
    self.navigationItem.titleView = lableTitle;
    self.navigationController.navigationBar.barTintColor = [GVColor hexStringToColor:@"#ffba14"];
    //
    UIButton* buttonlable = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [buttonlable setTitle:@"登录" forState:UIControlStateNormal];
    [buttonlable setTitleColor: [GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    buttonlable.titleLabel.font = [UIFont systemFontOfSize:15];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonlable];
    [buttonlable addTarget:self action:@selector(pushclick) forControlEvents:UIControlEventTouchUpInside];
    //返回按钮
    self.navigationItem.hidesBackButton = YES;
    UIButton* buttonLeft = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [buttonLeft setImage:[UIImage imageNamed:@"返回-3"] forState:UIControlStateNormal];
    [buttonLeft setTitleColor: [GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    buttonLeft.titleLabel.font = [UIFont systemFontOfSize:15];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonLeft];
    [buttonLeft addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    myReset = [[ResetView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = myReset;
    
    [myReset.confirmButtonk addTarget:self action:@selector(resetText) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}
-(void)pushclick
{
    [self.navigationController pushViewController:[[ViewController alloc] init] animated:YES];
}
-(void)backClick
{
        [self.navigationController popViewControllerAnimated:YES];
}
-(void)resetText
{
    if (myReset.onePassword.text.length<6||myReset.onePassword.text.length>12 ) {
        NSLog(@"2");
    }
    else{
        if (myReset.twoRassword.text == myReset.onePassword.text ) {
            NSLog(@"1");
        }
        else{
            NSLog(@"3");
        
        }
    }    
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

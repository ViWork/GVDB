//
//  GVFindPasswordViewController.m
//  GVLogin
//
//  Created by BanWanXin on 2016/12/20.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "GVFindPasswordViewController.h"
#import "GVFindPasswordView.h"
#import "GVColor.h"
#import "ResetViewController.h"
#import "ViewController.h"
@interface GVFindPasswordViewController ()<UITextFieldDelegate>{
    GVFindPasswordView* myFindPasswordV;
    NSString    *_previousTextFieldContent;
    UITextRange *_previousSelection;
    NSTimer     *timer;
    NSInteger  timeTick;
    
}


@end

@implementation GVFindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.hidesBackButton = YES;
    UIButton* buttonLeft = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [buttonLeft setImage:[UIImage imageNamed:@"返回-3"] forState:UIControlStateNormal];
    [buttonLeft setTitleColor: [GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    buttonLeft.titleLabel.font = [UIFont systemFontOfSize:15];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonLeft];
    [buttonLeft addTarget:self action:@selector(pushclick) forControlEvents:UIControlEventTouchUpInside];    [self setNavigationUI];
    UIButton* buttonlable = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [buttonlable setTitle:@"登录" forState:UIControlStateNormal];
    [buttonlable setTitleColor: [GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    buttonlable.titleLabel.font = [UIFont systemFontOfSize:15];
    [buttonlable addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonlable];
    //
    myFindPasswordV = [[GVFindPasswordView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view = myFindPasswordV;

    [myFindPasswordV.bwxLoginBurron addTarget:self action:@selector(loginclick) forControlEvents:UIControlEventTouchUpInside];
    
    [myFindPasswordV.bwxVerButton addTarget:self action:@selector(timeAccoutAction: ) forControlEvents:UIControlEventTouchUpInside];

}
- (void)Click{
    [self.navigationController pushViewController:[[ViewController alloc] init] animated:YES];
}
-(void)pushclick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setNavigationUI{
    self.navigationController.navigationBar.barTintColor = [GVColor hexStringToColor:@"#ffba14"];

    self.view.backgroundColor = [GVColor hexStringToColor:@"#F2F2F2"];
    self.navigationItem.title = @"找回密码";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
}
-(void)loginclick
{
    ResetViewController* reset = [[ResetViewController alloc]init];
    [self.navigationController pushViewController:reset animated:YES];
}


- (void)timeAccoutAction:(UIButton *)sender {
    //60秒倒计时,timeTick需设置为61
    timeTick = 60;
    //给计时器添加1秒钟到后要执行的方法（timeFireMethod）
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    myFindPasswordV.bwxVerButton.enabled = NO;
}
-(void)timeFireMethod
{
    timeTick--;
    if(timeTick==0){
        [timer invalidate];
        myFindPasswordV.bwxVerButton.enabled = YES;
        [myFindPasswordV.bwxVerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }else
    {
        [myFindPasswordV.bwxVerButton setTitle:[NSString stringWithFormat:@"%ld秒后重新发送",(long)timeTick] forState:UIControlStateNormal];\
        NSLog(@"%@",myFindPasswordV.bwxtelText.text);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

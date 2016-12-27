//
//  ViewController.m
//  GVLogin
//
//  Created by Viosky on 2016/12/20.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "ViewController.h"

#import "GVPrefixHeader.pch"
#import "GVMineChoiceBar.h"
#import "GVTel.h"
#import "GVPass.h"
#import "GVFindPasswordViewController.h"
typedef NS_ENUM(<#...#>) <#name#>

@interface ViewController () <GVMineChoiceBarDelegate>
{
    GVPass *pass;
    GVTel *tel;
    GVMineChoiceBar *lyw;

    UIButton *button;
    UIButton *button_1;
    UIButton *remember;
    UIImageView *imageView;

    NSDictionary *dic;
    NSInteger  timeTick;
    NSTimer     *timer;

}
@property (nonatomic, strong) UIView *loginView;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [pass removeFromSuperview];
        [button_1 removeFromSuperview];
    });
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationUI];
    [self setViewUI];
    NSLog(@"%f",SIZE(20, 163.0));
    
}

#pragma mark - 设置导航
- (void)setNavigationUI{
    self.navigationController.navigationBar.barTintColor = [GVColor hexStringToColor:@"#ffba14"];
    self.navigationItem.hidesBackButton = YES;
    self.view.backgroundColor = [GVColor hexStringToColor:@"#F2F2F2"];
    self.navigationItem.title = @"登录";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    }
#pragma mark - 初始化UI
- (void)setViewUI{
    // 初始化 切换界面按钮
    lyw = [[GVMineChoiceBar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 80)];
    lyw.delegate = self;
    [self.view addSubview:lyw];

    // 初始化 手机登录View
    tel = [[GVTel alloc] initWithFrame:CGRectMake(0, 144, self.view.frame.size.width, 160)];
    [self.view addSubview:tel];
    [tel.yanz addTarget:self action:@selector(timeAccoutAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setTelButton];

    // 初始化 密码登录View
    pass = [[GVPass alloc] initWithFrame:CGRectMake(0, 144, self.view.frame.size.width,90)];
    [pass.retrieve addTarget:self action:@selector(retrieveClick) forControlEvents:UIControlEventTouchUpInside];


}
#pragma mark - 倒计时方法
- (void)timeAccoutAction:(UIButton *)sender {
    //60秒倒计时,timeTick需设置为61
    timeTick = 50;
    //给计时器添加1秒钟到后要执行的方法（timeFireMethod）
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    tel.yanz.enabled = NO;
    [NetworkRequest requestForPhoneCodeURL:GV_TEl_TEST parameters:@{@"tel":tel.telText.text} Success:^(id success) {
        NSLog(@"%@",success);
    } Failure:^(id failure) {
        NSLog(@"%@",failure);
    }];
}
-(void)timeFireMethod
{
    timeTick--;
    if(timeTick==0){
        [timer invalidate];
        tel.yanz.enabled = YES;
        [tel.yanz setTitle:@"获取验证码" forState:UIControlStateNormal];
    }else
    {
        [tel.yanz setTitle:[NSString stringWithFormat:@"%ld秒后重新发送",(long)timeTick] forState:UIControlStateNormal];\
    }
}

#pragma mark - 找回密码
- (void)retrieveClick{
    [self.navigationController pushViewController:[[GVFindPasswordViewController alloc] init] animated:YES];
}


- (void)setTelButton{
    button = [[UIButton alloc] init];
    button.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 33.0/2.0;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tel.mas_bottom).offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(225);
        make.height.mas_equalTo(33);
    }];
    [button addTarget:self action:@selector(Click_1) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setPassButton{
    button_1 = [[UIButton alloc] init];
    button_1.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
    [button_1 setTitle:@"登录" forState:UIControlStateNormal];
    button_1.titleLabel.font = [UIFont systemFontOfSize:17];
    button_1.layer.masksToBounds = YES;
    button_1.layer.cornerRadius = 33.0/2.0;
    [self.view addSubview:button_1];
    [button_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pass.mas_bottom).offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(225);
        make.height.mas_equalTo(33);
    }];
    [button_1 addTarget:self action:@selector(Click_2) forControlEvents:UIControlEventTouchUpInside];

    remember = [[UIButton alloc] init];
    remember.titleLabel.font = [UIFont systemFontOfSize:12];
    [remember setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [remember setTitle:@"记住密码" forState:UIControlStateNormal];
    [self.view addSubview:remember];
    [remember mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pass.mas_bottom).offset(10);
        make.centerX.equalTo(pass.retrieve.mas_centerX);
    }];
    [remember addTarget:self action:@selector(rememberClick:) forControlEvents:UIControlEventTouchUpInside];
    imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"up"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(remember.mas_left).offset(-5);
        make.centerY.equalTo(remember.mas_centerY);
        make.width.height.mas_equalTo(12);
    }];

}
- (void)rememberClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        imageView.image = [UIImage imageNamed:@"down"];
    }
    else{
        imageView.image = [UIImage imageNamed:@"up"];
    }

}
#pragma mark - 手机号登录点击事件
- (void)Click_1{
    [NetworkRequest LogininfoRequestWithUrl:GV_TEL_YZ parameters:@{@"contact_tel":tel.telText.text,@"sendCode":tel.passText.text} Success:^(id success) {
        if ([success[@"code"] isEqualToString:@"200"]) {
            [NetworkRequest LogininfoRequestWithUrl:GV_TEL parameters:@{@"tel":tel.telText.text} Success:^(id success) {
                NSLog(@"登录成功");
                NSLog(@"%@",success);
            } Failure:^(id failure) {

            }];
        }
    } Failure:^(id failure) {
        NSLog(@"%@",failure);
    }];
}
#pragma mark - 密码登录点击事件
- (void)Click_2{

    [NetworkRequest LogininfoRequestWithUrl:GV_PASS parameters:@{ @"username":pass.userName.text, @"password":pass.passWord.text} Success:^(id success) {
        NSLog(@"登录成功");
        NSLog(@"%@",success);
    } Failure:^(id failure) {
         NSLog(@"%@",failure);
    }];
}
#pragma mark - 切换界面事件
- (void)choiceBarClick:(NSInteger) index{
    if (index == 0)
    {
        [self.view addSubview:tel];
        [pass  removeFromSuperview];
        [self setTelButton];

    }
    else{
        [self.view addSubview:pass];
        [tel  removeFromSuperview];
        [self setPassButton];
    }
}

@end

//
//  discountViewController.m
//  GVDB
//
//  Created by apple on 2016/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "discountViewController.h"

@interface discountViewController ()
@property(nonnull,strong)UITextView *freekTextView;
@property(nonnull,strong)UITextField *numberOfWord;
@end
static NSString *WORD=@"s";
@implementation discountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showView];
    self.view.backgroundColor=[UIColor whiteColor];
        // Do any additional setup after loading the view.
}






-(void)showView{
    UIView *nav=[[UIView alloc]init];
    nav.backgroundColor=[GVColor hexStringToColor:@"#ffba14"];
    [self.view addSubview:nav];
    
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.height.mas_offset(64);
    }];
    UILabel *labTitle=[[UILabel alloc]init];
    labTitle .font=[UIFont systemFontOfSize:20];
    labTitle.textAlignment=NSTextAlignmentCenter;
    labTitle.text=@"优惠券";
    [self.view addSubview:labTitle];
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(28);
        make.width.equalTo(nav.mas_width);
    }];
    UIButton *rtn=[[UIButton alloc]init];
    [rtn setTitle:@"<" forState:UIControlStateNormal];
    rtn.font=[UIFont systemFontOfSize:23];
    [rtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:rtn];
    [rtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [rtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(20);
        make.left.equalTo(nav.mas_left).offset(5);
    }];
    
}
-(void)click
{
    [self.navigationController popViewControllerAnimated:NO];
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

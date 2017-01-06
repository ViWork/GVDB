//
//  pushViewController.m
//  GVDB
//
//  Created by apple on 2016/12/31.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "pushViewController.h"
#import "addressData.h"
#import "LWModel.h"
#import "pushView.h"
@interface pushViewController ()
{
    addressData *dealData;
    pushView *subView;
}
@end

@implementation pushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showView];
    

    
    dealData=[addressData shareWSDealData];
    subView =[[pushView alloc]initWithFrame:self.view.frame];
    self.view=subView;
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(300, 200, 70, 30)];
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self showView];
        if (self.indexRow == 10000) {
        self.navigationItem.title = @"添加";
    }
    else
    {
        self.navigationItem.title = @"修改";
        //打开数据库
        [dealData openDB];
        LWModel *book = [dealData selectData][self.indexRow];
        // 文本框显示要修改的数据内容
        subView.fieldName.text = book.name;
        subView.fieldAuthor.text = book.author;
        
        // 关闭数据库
        [dealData closeDB];
    }


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
    labTitle.text=@"修改地址";
    [self.view addSubview:labTitle];
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(28);
        make.width.equalTo(nav.mas_width);
    }];
    UIButton *rtn=[[UIButton alloc]init];
    [rtn setTitle:@"<" forState:UIControlStateNormal];
    rtn.titleLabel.font=[UIFont systemFontOfSize:23];
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


- (void)saveClick
{
    if (self.indexRow == 10000) {
        // 添加
        LWModel *book = [[LWModel alloc]init];
        book.name = subView.fieldName.text;
        book.author = subView.fieldAuthor.text;
        
        // 打开
        [dealData openDB];
        // 创建表
        //        [dealData createTable];
        // 添加
        [dealData addData:book];
        // 关闭
        [dealData closeDB];
    }
    else
    {
        // 打开
        [dealData openDB];
        // 获取要修改的数据
        LWModel *book = [[LWModel alloc]init];
        book.name = subView.fieldName.text;
        book.author = subView.fieldAuthor.text;
        // 修改数据
        [dealData updateData:[dealData selectData][self.indexRow] withAnotherData:book];
        
        // 关闭数据库
        [dealData closeDB];
        
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

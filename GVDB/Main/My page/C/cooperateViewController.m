//
//  cooperateViewController.m
//  GVDB
//
//  Created by apple on 2016/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "cooperateViewController.h"

@interface cooperateViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_table;
}

@end

@implementation cooperateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showView];
    [self table];
    // Do any additional setup after loading the view.
}
-(void)table{
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStyleGrouped];
    _table.delegate=self;
    _table.dataSource=self;
    [self.view addSubview:_table];
    
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
    labTitle.text=@"加盟合作";
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
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.1;
    }else{
    return 10;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }
    else
    {
        return 1;
        
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"s";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        
    }
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.textLabel.text=@"商家加盟";
            
        }else if (indexPath.row==1)
        {
            cell.textLabel.text=@"骑士加盟";
        }
    }else
    {
        cell.textLabel.text=@"代理加盟";
    }
    return cell;
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

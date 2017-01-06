//
//  addressViewController.m
//  GVDB
//
//  Created by apple on 2016/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "addressViewController.h"
#import "pushViewController.h"
#import "addressData.h"
@interface addressViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *Marr;
    addressData *dealData;
    UITableView *table;
}

@end

@implementation addressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showView];
    self.view.backgroundColor=[UIColor whiteColor];
    table=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStyleGrouped];
    
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    
//    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0,70, [UIScreen mainScreen].bounds.size.width, 40)];
//    [btn setTitle:@"添加" forState:UIControlStateNormal];
//    [self.view addSubview:btn];
//    
//    [btn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    // 初始化对象
    dealData = [addressData shareWSDealData];
    // 创建数据库
    [dealData openDB];
    // 创建表
    [dealData createTable];
    // 关闭数据库
    [dealData closeDB];

        // Do any additional setup after loading the view.
}
#pragma mark - 视图出现的方法
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 打开数据库
    [dealData openDB];
    // 查找数据
    Marr = [dealData selectData];
    
    // 关闭数据
    [dealData closeDB];
    // 刷新表格
    [table reloadData];
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
    labTitle.text=@"管理地址";
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
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 6;
    }else
    {
        return 10;
    }
}
#pragma mark - 导航条按钮绑定方法
//- (void)addClick
//{
//    pushViewController *vc = [[pushViewController alloc]init];
//    vc.indexRow = 10000;
//    [self.navigationController pushViewController:vc animated:YES];
//    vc.view.backgroundColor=[UIColor whiteColor];
//}

#pragma mark - TableView data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else{
    return Marr.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    if (indexPath.section==0) {
        cell.textLabel.text=@"+ 添加新地址";
        cell.textLabel.textColor=[GVColor hexStringToColor:@"#ffba14"];
    }else{
    cell.textLabel.text = [Marr[indexPath.row]name];
    cell.detailTextLabel.text = [Marr[indexPath.row]author];
    }
    return cell;
}

#pragma mark -  点击单元格的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            pushViewController *vc = [[pushViewController alloc]init];
            vc.indexRow = 10000;
            [self.navigationController pushViewController:vc animated:YES];
            vc.view.backgroundColor=[UIColor whiteColor];
        }
        

    }else{
    
    pushViewController *vc = [[pushViewController alloc]init];
    vc.indexRow = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
    vc.view.backgroundColor=[UIColor whiteColor];
    }
}

#pragma mark - 删除单元格的方法


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 打开数据库
    [dealData openDB];
    //删除数据
    LWModel *book = Marr[indexPath.row];
    [dealData deleteData:book.bookID];
    //关闭数据库
    [dealData closeDB];
    
    // 打开数据库
    [dealData openDB];
    // 查找数据
    Marr = [dealData selectData];
    // 关闭数据库
    [dealData closeDB];
    // 刷新表格
    [table reloadData];
    
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

//
//  IMMyViewController.m
//  IMDB
//
//  Created by 赵鹏云 on 16/12/27.
//  Copyright © 2016年 Zpy. All rights reserved.
//

#import "IMMyViewController.h"
#import "addressViewController.h"
#import "cooperateViewController.h"
#import "discountViewController.h"
#import "ideaViewController.h"
#import "userViewController.h"
#import "aboutViewController.h"
@interface IMMyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arr2,*arr3;
}
@property(nonatomic,strong)UITableView *table;
@end

@implementation IMMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    arr2=[NSMutableArray arrayWithObjects:@"我的积分",@"我的收获地址", nil];
    arr3=[NSMutableArray arrayWithObjects:@"加盟合作",@"关于我们",@"意见反馈", nil];
    
    [self setView1];
   
    // Do any additional setup after loading the view.
}
-(void)setView1
{
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _table.delegate=self;
    _table.dataSource=self;
    [self.view addSubview:_table];
    [self showView];
    
}
- (void)showView{

    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 293)];
     _table.tableHeaderView = headerView;
    
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *img=[[UIImageView alloc]init];
    [headerView addSubview:img];
    
    img.image=[UIImage imageNamed:@"background_"];
    
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(headerView.mas_left);
        make.right.equalTo(headerView.mas_right);
        make.top.equalTo(headerView.mas_top);
        make.height.mas_equalTo(144);
        
    }];
    
    UIButton *img2=[[UIButton alloc]init];
    [img2 setImage:[UIImage imageNamed:@"1314.jpg"] forState:UIControlStateNormal];
    img2.layer.masksToBounds=YES;
    [headerView addSubview:img2];
    [img2 addTarget:self action:@selector(labmaClick) forControlEvents:UIControlEventTouchUpInside];
    img2.layer.cornerRadius=41.5;
    [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.mas_centerX);
        make.top.equalTo(headerView.mas_top).offset(54);
        make.width.height.mas_equalTo(83);
        
    }];
    
    
    UIButton *labma=[[UIButton alloc]init];
    
    labma.font=[UIFont systemFontOfSize:17];
    [headerView addSubview:labma];
    [labma setTitle:@"马薇薇" forState:UIControlStateNormal];
    [labma setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [labma addTarget:self action:@selector(labmaClick) forControlEvents:UIControlEventTouchUpInside];
    
    [labma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(img2.mas_bottom).offset(16);
        make.centerX.equalTo(headerView.mas_centerX);
        
                                                                                                                                            
    }];
    
    UILabel *labLong=[[UILabel alloc]init];
    labLong.backgroundColor=[UIColor lightGrayColor];
    [headerView addSubview:labLong];
    labLong.backgroundColor=[GVColor hexStringToColor:@"#dddddd"];
    
    [labLong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labma.mas_bottom).offset(20);
        make.height.mas_equalTo(0.5);
        make.left.equalTo(headerView.mas_left);
        make.right.equalTo(headerView.mas_right);
        
    }];

    UILabel *labV=[[UILabel alloc]init];
    labV.backgroundColor=[UIColor lightGrayColor];
    labV.backgroundColor=[GVColor hexStringToColor:@"#dddddd"];
    [headerView addSubview:labV];
    [labV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.mas_centerX);
        make.top.equalTo(labLong.mas_bottom).offset(20);
        make.height.mas_equalTo(56);
        make.width.mas_equalTo(0.5);
        
    }];
    UIButton *money=[[UIButton alloc]init];
    [money setImage:[UIImage imageNamed:@"wallet"] forState:UIControlStateNormal];
    [headerView addSubview:money];
   [ money mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(headerView.mas_left).offset(78);
       make.width.mas_equalTo(33);
       make.height.mas_equalTo(28);
       make.top.equalTo(labLong.mas_bottom).offset(20);
       
   }];
    UILabel *labMoney=[[UILabel alloc]init];
    labMoney.text=@"我的钱包";
    labMoney.font=[UIFont systemFontOfSize:12];
    labMoney.textColor=[GVColor hexStringToColor:@"#888888"];
    labMoney.textAlignment=NSTextAlignmentCenter;
    [headerView addSubview:labMoney];
    [labMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(money.mas_bottom).offset(13);
        
        make.centerX.equalTo(money.mas_centerX);
        
        
            }];
    
    UIButton *discount=[[UIButton alloc]init];
    [discount setImage:[UIImage imageNamed:@"discount"] forState:UIControlStateNormal];
    [headerView addSubview:discount];
    [discount addTarget:self action:@selector(discountClick) forControlEvents:UIControlEventTouchUpInside];
    [ discount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labV.mas_left).offset(75);
        make.width.mas_equalTo(33);
        make.height.mas_equalTo(28);
        make.top.equalTo(labLong.mas_bottom).offset(20);
        
    }];
    
    UILabel *labDiscount=[[UILabel alloc]init];
    labDiscount.text=@"我的优惠券";
    labDiscount.font=[UIFont systemFontOfSize:12];
    labDiscount.textColor=[GVColor hexStringToColor:@"#888888"];
    labDiscount.textAlignment=NSTextAlignmentCenter;
    [headerView addSubview:labDiscount];
    [labDiscount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(discount.mas_centerX);
        make.centerY.equalTo(labMoney.mas_centerY);
       
    }];
   

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else
    {
        return 3;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"s";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    cell.textLabel.textColor=[GVColor hexStringToColor:@"#333333"];
    
    if (indexPath.section==0) {
        cell.textLabel.text=arr2[indexPath.row];
        
    }else{
        cell.textLabel.text=arr3[indexPath.row];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    
        return 10;
        
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            
        }else if (indexPath.row==1)
        {
            addressViewController *address=[[addressViewController alloc]init];
            [self.navigationController pushViewController:address animated:NO];
            
        }
    }else if (indexPath.section==1)
    {
        if (indexPath.row==0) {
            cooperateViewController *cooperate=[[cooperateViewController alloc]init];
            [self.navigationController pushViewController:cooperate animated:NO];
            
        }else if (indexPath.row==1)
        {
            aboutViewController *about=[[aboutViewController alloc]init];
            [self.navigationController pushViewController:about animated:NO];
            
        }else if (indexPath.row==2)
        {
            ideaViewController *idea=[[ideaViewController alloc]init];
            [self.navigationController pushViewController:idea animated:NO];
        }
    }
}
-(void)discountClick
{
    discountViewController *disV=[[discountViewController alloc]init];
    [self.navigationController pushViewController:disV animated:NO];
    
}
-(void)labmaClick
{
    userViewController *user=[[userViewController alloc]init];
    [self.navigationController pushViewController:user animated:NO];
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

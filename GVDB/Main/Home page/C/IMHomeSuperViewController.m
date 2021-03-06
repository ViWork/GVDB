//
//  IMHomeSuperViewController.m
//  IMDB
//
//  Created by 赵鹏云 on 16/12/27.
//  Copyright © 2016年 Zpy. All rights reserved.
//

#define headerViewHeight    994.0f

#import "IMHomeSuperViewController.h"
#import "IMSuperTableV.h"
#import "IMTopV.h"
#import "HomeTableViewCell.h"
#import "IMTopOneV.h"

@interface IMHomeSuperViewController ()<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>
{
    IMSuperTableV *_superTabV ;
    IMTopV *_topV ;
    UIView *_headerView ;
}
@end

@implementation IMHomeSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSuperView] ;
    [self addTopView] ;
    self.navigationController.delegate =self ;
}


// 主界面的tableVIew
-(void)addSuperView
{
    _superTabV = [[IMSuperTableV alloc]initWithFrame:CGRectMake(0, SIZE(88.0), ScreenWIDTH, ScreenHEIGHT - SIZE(128.0)- 44 )] ;
    _superTabV.tableView.delegate = self ;
    _superTabV.tableView.dataSource = self ;
    _superTabV.tableView.sectionHeaderHeight = [GVAL setGVAL:headerViewHeight] ;
    _superTabV.tableView.tableHeaderView=  [self setHeaderView] ;
    _superTabV.tableView.rowHeight = 200 ;
    // 注册单元格
    [_superTabV.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeTableViewCell"] ;
    self.view = _superTabV ;
}

// 顶部 VIew
-(void)addTopView{
    _topV = [[IMTopV alloc]initWithFrame:CGRectMake(0,SIZE(40.0), ScreenWIDTH, SIZE(88.0)) ] ;
    _topV.backgroundColor = [UIColor whiteColor] ;
    [self.view addSubview: _topV] ;
    
    IMTopOneV *topOneV = [[IMTopOneV alloc]initWithFrame:CGRectMake(0, 0, ScreenWIDTH, SIZE(40.0))] ;
    topOneV.backgroundColor = [GVColor hexStringToColor:@"ffba14"] ;
    [self.view addSubview:topOneV] ;
}

// tableView的  表头
-(UIView *)setHeaderView{
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWIDTH,SIZE(headerViewHeight) ) ];
    _headerView.backgroundColor = [UIColor purpleColor] ;
    return _headerView ;
}

#pragma mark ---UINavigationController  协议

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[IMHomeSuperViewController class]]) {
        [navigationController setNavigationBarHidden:YES animated:YES] ;
    }
    else{
        [navigationController setNavigationBarHidden:NO animated:YES] ;
    }
}


#pragma mark --- tableVIew  协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"] ;
    return cell ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

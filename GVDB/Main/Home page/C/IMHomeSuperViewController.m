//
//  IMHomeSuperViewController.m
//  IMDB
//
//  Created by 赵鹏云 on 16/12/27.
//  Copyright © 2016年 Zpy. All rights reserved.
//

#import "IMHomeSuperViewController.h"
#import "IMSuperTableV.h"

@interface IMHomeSuperViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    IMSuperTableV *_superTabV ;
}
@end

@implementation IMHomeSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSuperView] ;
}

-(void)addSuperView
{
    _superTabV = [[IMSuperTableV alloc]initWithFrame:ScreenRect] ;
    _superTabV.tableView.delegate = self ;
    _superTabV.tableView.dataSource = self ;
    self.view = _superTabV ;
}

#pragma mark --- tableVIew  协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifer = @"qwerty" ;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer] ;
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer] ;
    }
    return cell ;
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

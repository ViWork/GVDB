//
//  MenuInfoVC.m
//  GVDB
//
//  Created by 赵鹏云 on 17/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#define   TABLEVIEW     _sTabV.tableView
#define   EdgeInsetsMake   UIEdgeInsetsMake(SIZE(616.0), 0, 0, 0)               //表格内边距
#define   ContentHeight   SIZE(616.0)                                                    //头图高度
#import "MenuInfoVC.h"
#import "IMSuperTableV.h"                                                            //主界面表格
#import "MenuNavView.h"                                                            //代替导航栏
#import "MenuOneCell.h"                                                           //重写cell
#import "MenuTwoCell.h"                                                         //重写cell
#import "MenuThreeCell.h"                                                     //重写cell
#import "MenuFourCell.h"                                                     //重写cell

@interface MenuInfoVC ()<UITableViewDelegate, UITableViewDataSource, MenuOneCellDelegate,MenuTwoCellDelegate, MenuThreeCellDelegate, MenuFourCellDelegate>
{
    IMSuperTableV       *_sTabV ;
    MenuNavView         *_menuNavV ;
    MenuOneCell          * cell1 ;
    MenuTwoCell          * cell2 ;
    MenuThreeCell        * cell3 ;
    MenuFourCell          * cell4 ;
    
    UIImageView           *_menuImg ;
}
@end

@implementation MenuInfoVC
static NSString * identifer1 = @"MenuOneCell" ;
static NSString * identifer2 = @"MenuTwoCell" ;
static NSString * identifer3 = @"MenuThreeCell" ;
static NSString * identifer4 = @"MenuFourCell" ;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addSuperView] ;
    // 代替导航栏
    [self setNavgationView] ;
    [self getRequestData] ;
}
#pragma mark 请求数据
-(void)getRequestData
{
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"42",@"menu_id", nil] ;
    [NetworkRequest LogininfoRequestWithUrl:SELECTED_COOKE_DETAIL parameters:dic1 Success:^(id success) {
        NSLog(@"菜品详情: %@",success) ;
    } Failure:^(id failure) {
        
    }] ;
}
#pragma mark  1. 主界面的tableVIew
-(void)addSuperView
{
    _sTabV = [[IMSuperTableV alloc]initWithFrame:CGRectMake(0, 0, ScreenWIDTH, ScreenHEIGHT-10)] ; //128.0
    TABLEVIEW.delegate = self ;
    TABLEVIEW.dataSource = self ;
//    TABLEVIEW.rowHeight = 100 ;
//    TABLEVIEW.estimatedRowHeight = 88.0 ;
    [self.view addSubview: _sTabV] ;
    TABLEVIEW.contentInset = EdgeInsetsMake ;
    [TABLEVIEW addSubview:[self headerView] ];
}

#pragma mark --- 2. tableVIew  协议
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50 ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20 ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        cell1 = [tableView dequeueReusableCellWithIdentifier:identifer1] ;
        if (!cell1) {
            cell1 = [[MenuOneCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer1] ;
        }
        cell1.delegate = self ;
        [cell1.btnAddComment addTarget:self action:@selector(addComment) forControlEvents:UIControlEventTouchUpInside] ;
        return cell1 ;
    }else if (indexPath.row == 1)
    {
        cell2 = [tableView dequeueReusableCellWithIdentifier:identifer2] ;
        if (!cell2) {
            cell2 = [[MenuTwoCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer2] ;
        }
        cell2.delegate = self ;
        
        return cell2 ;
    }else if (indexPath.row == 2)
    {
        cell3 = [tableView dequeueReusableCellWithIdentifier:identifer3] ;
        if (!cell3) {
            cell3 = [[MenuThreeCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer3] ;
        }
        cell3.delegate = self ;
        return cell3 ;
    }else  {
        cell4 = [tableView dequeueReusableCellWithIdentifier:identifer4] ;
        if (!cell4) {
            cell4 = [[MenuFourCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer4] ;
        }
        //签署代理
        cell4.delegate = self ;
        
        return cell4 ;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSelector:@selector(deSelectHigh) withObject:nil afterDelay:0.1] ;
}

-(void)deSelectHigh
{
    [TABLEVIEW deselectRowAtIndexPath:[TABLEVIEW indexPathForSelectedRow] animated:YES] ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return [cell1.delegate tableRowHeight:cell1] ;
    }
    else if (indexPath.row == 1) {
        return  [cell2.delegate tableRowHeight2:cell2] ;
    }
    else if (indexPath.row == 2) {
        return  [cell3.delegate tableRowHeight3:cell3] ;
    }
    return [cell4.delegate tableRowHeight4:cell4] ;
    
}

-(CGFloat)tableRowHeight:(MenuOneCell *)oneCell  ;
{
        CGFloat h1  = SIZE(124.0) + oneCell.textH1 + oneCell.textH2  + oneCell.textH3 ;
        return h1 ;
}

-(CGFloat)tableRowHeight2:(MenuTwoCell *)twoCell ;
{
    CGFloat h2  = SIZE(88.0) + twoCell.textH1 + twoCell.textH2 ;
    return h2 ;
}

-(CGFloat)tableRowHeight3:(MenuThreeCell *)threeCell
{
    CGFloat h3  = SIZE(92.0) + threeCell.textH1 + threeCell.textH2 +threeCell.textH3 ;
    return h3 ;
}

-(CGFloat)tableRowHeight4:(MenuFourCell *)fourCell
{
    CGFloat h4  = SIZE(56.0) + fourCell.textH1 + fourCell.textH2  ;
    return h4 ;
}

-(void)addComment{
    NSLog(@"请添加") ;
}
#pragma mark -- 3. 即将出现,出现后
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated] ;
    [self.navigationController setNavigationBarHidden:YES animated:YES] ;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated] ;
    [self.navigationController setNavigationBarHidden:YES animated:YES] ;
}

// 头部菜品图片
-(UIImageView *)headerView{
    _menuImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, -ContentHeight, ScreenWIDTH, ContentHeight)] ;
    _menuImg.image = [UIImage imageNamed:@"3.jpg"] ;
    _menuImg.contentMode = UIViewContentModeScaleAspectFill ; // 内容的 高度 和 宽度 同时变化

    return _menuImg ;
}
//图片大小随着滚动大小进行变化
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y ;
    //NSLog(@"%.2f",y) ;
    if (y < -ContentHeight) {
        CGRect frame  = _menuImg.frame ;
        frame.origin.y = y ;
        frame.size.height = -y ;
        _menuImg.frame = frame ;
    }
//    if (y<-292.0) {
//        TABLEVIEW.scrollEnabled = NO ;
//    }else{
//        TABLEVIEW.scrollEnabled = YES ;        
//    }
}

#pragma mark - 代替导航栏
-(void)setNavgationView{
    // 主view透明不会改变子视图的透明度
    //    UIColor *color = [UIColor clearColor];
    //    color = [color colorWithAlphaComponent:0.1];
    //    _menuNavV.backgroundColor = color;

    _menuNavV = [[MenuNavView alloc]initWithFrame:CGRectMake(0, SIZE(40.0), ScreenWIDTH, SIZE(88.0))] ;
    [_menuNavV.btnLeftBack addTarget:self action:@selector(clickBackBeforePage) forControlEvents:UIControlEventTouchUpInside] ;
    [_menuNavV.btnRightCar addTarget:self action:@selector(clickRightCar) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:_menuNavV] ;
}

-(void)clickBackBeforePage
{
    [self.navigationController popViewControllerAnimated:YES] ;
}
//购物车
-(void)clickRightCar{
    NSLog(@"购物车") ;
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

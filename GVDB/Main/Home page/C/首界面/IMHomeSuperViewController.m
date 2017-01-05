//
//  IMHomeSuperViewController.m
//  IMDB
//
//  Created by 赵鹏云 on 16/12/27.
//  Copyright © 2016年 Zpy. All rights reserved.
//

#define DATA_URL   @"http://www.kdiana.com/index.php/Before/HomePage/index?page=%ld"


#define headerViewHeight    1100.0f                                 //表头的高
#define scrollV_Size _headerV.scrollV.frame.size.height       //滚动视图的高
#define tabV  _superTabV.tableView                               //表格

#import "IMHomeSuperViewController.h"
#import "IMSuperTableV.h"                              //主界面的 tableView
#import "IMTopV.h"                                      // 存放<定位>等按钮
#import "HomeTableViewCell.h"                     //重写的 cell
#import "IMTopOneV.h"                             // 状态栏的背景
#import "IMHeaderView.h"                       // 头视图
#import "CityList.h"                             //城市列表
#import "IMDataMake.h"                     //处理  事件
#import "HomeCollectionViewCell.h"    //网格的  item 重写
#import "WSStarRatingView.h"        // 评价星星✨
#import "PopoverView.h"              // pop 出的视图
#import "IMRestaurantVC.h"       //二级界面    饭店的菜谱列表
#import "IMSearchVC.h"           //搜索界面
#import "FirstModel.h"           // 模型

@interface IMHomeSuperViewController ()<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
{
    IMSuperTableV       *_superTabV ;
    IMTopV                 *_topV ;
    IMHeaderView        *_headerV;
    
    NSMutableArray     *_scrollArr ,*_collectionArr ;
    UIImageView           *_imgV ;
    UIButton                *_scrollBtn ;
    NSInteger               timeNum ;
    
    NSMutableArray      *_mArrScrollVShow ;
    NSMutableArray      *_mArrCollectionVShow ;
    NSMutableArray      *_mArrTableVVShow ;
    
    NSDictionary *dicScollV ;
    
    NSInteger _num ;
//    BOOL _newBOOL, _popBOOL;
}
@end

@implementation IMHomeSuperViewController
// 静态常量标识
static NSString * const  cellIdentifer = @"MyCollectionViewCell" ;


- (void)viewDidLoad {
    [super viewDidLoad];
    _mArrScrollVShow = [NSMutableArray array] ;
    _mArrCollectionVShow  = [NSMutableArray array] ;
    _mArrTableVVShow  = [NSMutableArray array] ;
    _num = 1 ;
    //表格
    [self addSuperView] ;
    [self requestData:_num] ;
   // 刷新
    [self Rrefreshing] ;
    
//    self.navigationController.delegate =self ;
//    self.navigationController.navigationBar.translucent = NO ;
}

#pragma mark 1. 刷新
-(void)Rrefreshing{
    //1. 上拉/下拉 刷新---请求数据
    tabV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        _num = 1 ;
        [self requestData:_num] ;
        [self addTopView] ;
        tabV.tableHeaderView =  [self setHeaderView] ;
    }] ;
    tabV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        _num ++ ;
        [self requestData:_num] ;
        [self addTopView] ;
        tabV.tableHeaderView =  [self setHeaderView] ;
    }] ;
    
    // 2. 运行开始刷新
    [tabV.mj_header beginRefreshing] ;

}
-(void)requestData:(NSInteger )number{
    NSString * str = [NSString stringWithFormat:DATA_URL,number] ;
//    NSDictionary *dic1= [ NSDictionary dictionaryWithObjectsAndKeys:number,@"page", nil] ;
    [NetworkRequest LogininfoRequestWithUrl:str parameters:nil Success:^(id success) {
        dicScollV = success ;
//        NSLog(@"new : %@",success) ;
        
        //1.
        FirstModel *fm = [[FirstModel alloc]init] ;
        [fm setValuesForKeysWithDictionary:success] ;
        [_mArrScrollVShow addObject:fm] ;
        
        //2.
        for (NSDictionary *dicInfo in fm.info) {
            FirstModel_info *fm_info = [[FirstModel_info alloc]init] ;
            [fm_info setValuesForKeysWithDictionary:dicInfo] ;
            [_mArrCollectionVShow addObject:fm_info] ;
        }
        //3.
        for (NSDictionary *dicHot in fm.hot) {
            FirstModel_info *fm_hot = [[FirstModel_info alloc]init] ;
            [fm_hot setValuesForKeysWithDictionary:dicHot] ;
            [_mArrTableVVShow addObject:fm_hot] ;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            //刷新完表格停止刷新
            [tabV reloadData] ;
            [tabV.mj_header endRefreshing] ;
            [tabV.mj_footer endRefreshing] ;
        }) ;
        
    } Failure:^(id failure) {
        NSLog(@"错误 : %@", failure) ;
        dispatch_async(dispatch_get_main_queue(), ^{
            //刷新完表格停止刷新
            [tabV reloadData] ;
            [tabV.mj_header endRefreshing] ;
            [tabV.mj_footer endRefreshing] ;
        }) ;
    }] ;
    //
    
    
    
   
    
}

// 即将出现时
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated] ;
    [self addTopView] ;
    [self.navigationController setNavigationBarHidden:YES animated:NO] ;
}

#pragma mark  2. 主界面的tableVIew
-(void)addSuperView
{
    _superTabV = [[IMSuperTableV alloc]initWithFrame:CGRectMake(0, SIZE(40), ScreenWIDTH, ScreenHEIGHT - SIZE(128.0) )] ; //128.0
    tabV.delegate = self ;
    tabV.dataSource = self ;
    tabV.sectionHeaderHeight = SIZE(headerViewHeight) ;
    
    tabV.rowHeight = SIZE(174.0) ;
    tabV.separatorInset = UIEdgeInsetsMake(0, SIZE(24.0), 0, SIZE(24.0)) ;
    tabV.separatorColor = [GVColor hexStringToColor:@"#eeeeee"] ;
    
    [self.view addSubview: _superTabV] ;
}

#pragma mark 3. 顶部 VIew
-(void)addTopView
{
    // 代替导航栏
    _topV = [[IMTopV alloc]initWithFrame:CGRectMake(0,SIZE(40.0), ScreenWIDTH, SIZE(88.0)) ] ;
    _topV.backgroundColor = [UIColor whiteColor] ;
    [_topV.leftBtn addTarget:self action:@selector(clickPosition) forControlEvents:UIControlEventTouchUpInside] ;
    [_topV.rightBtn addTarget:self action:@selector(showNavMenu:) forControlEvents:UIControlEventTouchUpInside] ;
    [_topV.middleBtn addTarget:self action:@selector(clickSearch) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview: _topV] ;
    
    // 手机顶部状态栏的 背景
    IMTopOneV *topOneV = [[IMTopOneV alloc]initWithFrame:CGRectMake(0, 0, ScreenWIDTH, SIZE(40.0))] ;
    topOneV.backgroundColor = [GVColor hexStringToColor:@"ffba14"] ;
    [self.view addSubview:topOneV] ;
    
}

#pragma mark 4. 城市定位
-(void)clickPosition{
    CityList *cvc = [[CityList alloc]init];
    cvc.hidesBottomBarWhenPushed = YES;
    cvc.selectCity = ^(NSString *cityName){
        [_topV.leftBtn setTitle:cityName forState:UIControlStateNormal] ;
    };
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:cvc];
    [self presentViewController:navi animated:YES completion:nil];
}
// 搜索
-(void)clickSearch{
    IMSearchVC *search = [[IMSearchVC alloc]init] ;
    search.hidesBottomBarWhenPushed = YES ;
    [self.navigationController pushViewController:search animated:YES] ;
}

// 导航栏右边的按钮
- (void)showNavMenu:(UIButton *)addBtn
{
    PopoverView *popoverView = [PopoverView popoverView];
    popoverView.style = PopoverViewStyleDefault ;
    popoverView.hideAfterTouchOutside = YES ;
    popoverView.showShade  = YES ;
    //弹出视图
    [popoverView showToView:addBtn withActions:[[IMDataMake sharedClick]oneActions]];
    
//    IMRestaurantVC *restaurant = [[IMRestaurantVC alloc]init] ;
//    [self.navigationController pushViewController:restaurant animated:YES] ;
}

#pragma mark  5. tableView的  表头
-(UIView *)setHeaderView
{
    _headerV = [[IMHeaderView alloc]initWithFrame:CGRectMake(0, 0, ScreenWIDTH,SIZE(headerViewHeight) ) ];
    _headerV.layer.borderWidth = 0.3 ;
    _headerV.layer.borderColor = [[GVColor hexStringToColor:@"#cccccc"]CGColor] ;
    
    // 1. 滚动
    [self setScrollViewContent] ;
    
    // 2. 网格
    [self setCollectionViewContent] ;
    
    // 3. 搜索食物的区域
    [self setSearchFoodScopeBtn] ;
    return _headerV ;
}


#pragma mark  6.1 <热门推荐>上方的 scrollView

-(void)setScrollViewContent{
    FirstModel *fm = _mArrScrollVShow[0] ;
    NSInteger sNum = fm.img.count ;
    _headerV.scrollV.contentSize = CGSizeMake(sNum * ScreenWIDTH, SIZE(300.0))  ;
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(clickTimer:) userInfo:nil repeats:YES] ;
    
    for (NSInteger i = 0; i<sNum ; i++)
    {
        _scrollBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
        _scrollBtn.frame = CGRectMake(ScreenWIDTH * i, 0, ScreenWIDTH, SIZE(300.0)) ;
        [_scrollBtn setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fm.img[i]]]] forState:UIControlStateNormal] ;
        [_scrollBtn addTarget:self action:@selector(clickScrollBtn:) forControlEvents:UIControlEventTouchUpInside] ;
        _scrollBtn.tag = 100 +i;
        [_headerV.scrollV addSubview:_scrollBtn] ;
    }
}

-(void)clickScrollBtn:(UIButton *)button{
    
    [[IMDataMake sharedClick]getScrollButtonTag:button.tag] ;
    
}
#pragma mark  6.2 <热门推荐>上方的 CollectionView

-(void)setCollectionViewContent{
    _headerV.collectionV.dataSource = self ;
    _headerV.collectionV.delegate  =self ;
    // 注册 item
    [_headerV.collectionV registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"HomeCollectionViewCell"] ;
}
// 搜索食物的范围区域
-(void)setSearchFoodScopeBtn
{
    [_headerV.btnNearby addTarget:self action:@selector(clickSearchFoodScopeBtn:) forControlEvents:UIControlEventTouchUpInside] ;
    [_headerV.btnAll addTarget:self action:@selector(clickSearchFoodScopeBtn:) forControlEvents:UIControlEventTouchUpInside] ;
    [_headerV.btnSequence addTarget:self action:@selector(clickSearchFoodScopeBtn:) forControlEvents:UIControlEventTouchUpInside] ;
}


// 附近菜馆 --- 搜索食物的范围区域
-(void)clickSearchFoodScopeBtn:(UIButton *)button
{
    PopoverView *popoverV = [PopoverView popoverView];
    popoverV.style = PopoverViewStyleDefault ;
    popoverV.hideAfterTouchOutside = YES ;                              //点击外部隐藏弹窗
    popoverV.showShade  = YES ;                                             //添加阴影
    
    switch (button.tag) {
        case 110:
            [popoverV showToView:button withActions:[[IMDataMake sharedClick] TwoActions] ];
            break;
        case 111:
            [popoverV showToView:button withActions:[[IMDataMake sharedClick] threeActions] ];
            break;
        case 112:
            [popoverV showToView:button withActions:[[IMDataMake sharedClick] fourActions] ];
        break;
        default:
            break;
    }

}

// 定时器
-(void)clickTimer:(NSTimer *)time
{
    timeNum ++ ;
    if (timeNum >= _scrollArr.count) {
        timeNum = 0 ;
    }
    _headerV.scrollV.contentOffset = CGPointMake(ScreenWIDTH *timeNum, 0) ;
}



#pragma mark --- 7. tableVIew  协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _mArrTableVVShow.count ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifer = @"HomeTableViewCell" ;
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer] ;
    if (!cell) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer] ;
    }
    [cell setFm_hot:_mArrTableVVShow[indexPath.row]] ;
    return cell ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IMRestaurantVC *restaurant = [[IMRestaurantVC alloc]init] ;
    
    FirstModel_hot *hot =_mArrTableVVShow[indexPath.row] ;
    
    restaurant.hidesBottomBarWhenPushed = YES ;
    restaurant.currentShopName = hot.store_name ;
    restaurant.strStore_ID = hot.id ;
    [self.navigationController pushViewController:restaurant animated:YES] ;
    
    [self performSelector:@selector(deSelectHigh) withObject:nil afterDelay:0.1] ;
}

-(void)deSelectHigh
{
     [_superTabV.tableView deselectRowAtIndexPath:[_superTabV.tableView indexPathForSelectedRow] animated:YES] ;
}


#pragma mark  8.  collectionView 协议
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _mArrCollectionVShow.count ;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath] ;
    
    UIColor* shadowColor2 = [UIColor colorWithRed: 0.209 green: 0.209 blue: 0.209 alpha: 1];
    UIColor* shadow = [shadowColor2 colorWithAlphaComponent: 0.73];
    cell.layer.masksToBounds = YES ;
    cell.layer.shadowColor = [shadow CGColor];
    cell.layer.contentsScale = [UIScreen mainScreen].scale;
    cell.layer.shadowOpacity = 0.75f;
    cell.layer.shadowRadius = 4.0f;
    cell.layer.shadowOffset = CGSizeMake(0,0);

    [cell setFm_info:_mArrCollectionVShow[indexPath.item]] ;
    
    return cell ;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"当前 item :%ld",(long)indexPath.item);
}


#pragma mark  9.  UINavigationController  协议   判断导航栏是否隐藏
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

// 撤回   键盘
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  IMRestaurantVC.m
//  GVDB
//
//  Created by 赵鹏云 on 16/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//



#define TOPVIEWHEIGHT SIZE(332.0) //表格内容上面的view高度
#define tabV  _superTabV.tableView   //表格
#define imgHeight 200.0f
#define isHidden   _shoppV.showNumLab.text.integerValue == 0; //等于0的时候移除
#define LEFTSPACE   300
#define leftTabV    _leftTopView.leftTableV  // 左侧表格

#import "IMRestaurantVC.h"
#import "SecondarySuperView.h"                               //主界面 表格
#import "SecondaryTopView.h"                                //表格 顶部的头部视图 view
#import "MenuInfoVC.h"                                       //三级界面
#import "SecondaryNavgationV.h"                        //代替导航栏的顶部view
#import "SecondaryCell.h"                                //主界面的单元格cell
#import "IMDataMake.h"                                 //业务处理
#import "SecondaryShoppV.h"                       //购物车按钮
#import "ThrowLineTool.h"                          //购物车的动画实现
#import "SecondLeftTabCell.h"                   //重写左面单元格cell
#import "SecondaryModel.h"                    //模型
#import "SecondaryLeftTopView.h"         //左侧视图
#import "ListView.h"                           //购物车清单

@interface IMRestaurantVC ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, ThrowLineToolDelegate, sencondaryDelegate>
{
    SecondarySuperView        *_superTabV ;
    SecondaryNavgationV       *_navigationView ; //替换导航栏
    SecondaryShoppV            *_shoppV ;  //购物车视图
    SecondaryCell                 * cell ;
    SecondaryTopView           * _topV ;
    SecondaryLeftTopView      *_leftTopView ;
    ListView                          *_listV ;
    
    UIButton                        *  btn ;
    UIView                           *coverView ;
    BOOL                            _newBOOL ;
    
    NSMutableArray             *_mArrMiddle ;
    NSMutableArray             *_mArrLeft ;
    NSMutableArray             *_mArrTop ;
    
    NSString                       *type_id ;
    NSString             *textPrice ;
}
@property (strong, nonatomic) UIView *redView;
@property(nonatomic,strong)UITableView * leftTableV ; // 左一栏视图搜索
@property(nonatomic,strong)UISearchBar * searchBar  ;
@end

@implementation IMRestaurantVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    // 导航控制器代理
//    self.navigationController.delegate = self ;
    // 1.  主界面
    [self.view addSubview: [self addSuperView]] ;

    // 2. 加载 navigationView
    [self navigationView] ;

    //3. 购物车的代理
    [ThrowLineTool sharedTool].delegate = self;
    
    //4.右滑搜索视图按钮,  购物车
    [self popSearchView] ;
    [self shoppView] ;
    
    //5. 灰色覆盖
    [self fuGaiView] ;

    //6.  右滑视图
    [self leftPopView] ;
    [_leftTopView setHidden:YES ] ;  // 预先隐藏
    
    //7.  请求数据
    [self requestData] ;

    //8. 购物车清单
    [self addListView] ;
//    textPrice = [NSString string] ;
//    textPrice = _shoppV.moneyBtn.titleLabel.text ;
}
-(void)fuGaiView{
    //覆盖视图- 灰色 ///SIZE(470.0), 0, ScreenWIDTH-  SIZE(470.0), ScreenHEIGHT
    coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWIDTH, ScreenHEIGHT)] ;
    coverView.backgroundColor = [GVColor hexStringToColor:@"#000000"] ;
    coverView.alpha = 0 ;
    coverView.tag = 801;
    [self.view addSubview:coverView] ;
}

#pragma amrk --- 解析数据
-(void)requestData
{
    //初始化数组
    _mArrTop = [NSMutableArray array] ;
    _mArrMiddle = [NSMutableArray array] ;
    _mArrLeft  = [NSMutableArray array] ;
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:self.strStore_ID,@"store_id", nil] ;


    [NetworkRequest LogininfoRequestWithUrl:SELECTED_STORE_COOKE parameters:dic1 Success:^(id success) {
        NSLog(@"yes :%@",success) ;
        // 1.
        SecondaryModel *sm = [[SecondaryModel alloc]init] ;
        [sm setValuesForKeysWithDictionary:success] ;
        [_mArrTop addObject:sm] ;

        // 2.
        for (NSDictionary *dic1 in sm.menu_info) {
            SecondaryModel_menu_info *sm_menu_info = [[SecondaryModel_menu_info alloc]init] ;
            [sm_menu_info setValuesForKeysWithDictionary:dic1] ;
            [_mArrMiddle addObject:sm_menu_info] ;
        }
        // 3.
        for (NSDictionary *dic2 in sm.type) {
            SecondaryModel_type *sm_type = [[SecondaryModel_type alloc]init] ;
            [sm_type setValuesForKeysWithDictionary:dic2] ;
            [_mArrLeft addObject:sm_type] ;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //刷新表格
            // 添加顶部view到表格
             [tabV addSubview:[self  setTopView]] ;
            [tabV reloadData] ;
            [leftTabV reloadData];
        }) ;
    } Failure:^(id failure) {
        NSLog(@"false : %@",failure) ;
    }] ;
    
}


#pragma mark -- 0. 即将出现,出现后
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated] ;
    [_navigationView setHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES] ;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated] ;
    [self.navigationController setNavigationBarHidden:YES animated:YES] ;
}

#pragma mark  1. 主界面的tableVIew
-(UIView *)addSuperView
{
    _superTabV = [[SecondarySuperView alloc]initWithFrame:CGRectMake(0, 0, ScreenWIDTH, ScreenHEIGHT)] ;
    _superTabV.backgroundColor =  [UIColor whiteColor] ;
    tabV.delegate = self ;
    tabV.dataSource = self  ;
//    tabV.tableHeaderView = [self setTopView] ;
//    [tabV addSubview:[self  setTopView]] ;
    return _superTabV ;
}

#pragma mark  2. tableVIew顶部的view

// headerView
-(UIView *)setTopView
{
    _topV = [[SecondaryTopView alloc]initWithFrame:CGRectMake(0, -TOPVIEWHEIGHT, tabV.frame.size.width, TOPVIEWHEIGHT)] ;
    [_topV.btnBack addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside] ;
    [_topV.btnCollect addTarget:self action:@selector(isCollect) forControlEvents:UIControlEventTouchUpInside] ;
    
    SecondaryModel *sm = [_mArrTop lastObject] ;
    [_topV setSecondaryModel:sm] ;
    return _topV ;
}

//是否收藏
-(void)isCollect
{
    if (_newBOOL) {
        _newBOOL = !_newBOOL ;
        [_topV.btnCollect setImage:[UIImage imageNamed:@"collect_down"] forState:UIControlStateNormal] ;
    }else{
        _newBOOL = !_newBOOL ;
        [_topV.btnCollect setImage:[UIImage imageNamed:@"collect_up"] forState:UIControlStateNormal] ;
    }
}

//通过版本号判断所代替导航栏的   view rect     返回 顶部view
-(void)navigationView
{
    _navigationView = [[SecondaryNavgationV alloc]init] ;
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >6.1)
    {
        _navigationView.frame = CGRectMake(0, 0, ScreenWIDTH, 44+20) ;
    }else
    {
        _navigationView.frame = CGRectMake(0, 0, ScreenWIDTH , 44) ;
    }
    _navigationView.labTitle.text = self.currentShopName ;
    // 返回按钮
    [_navigationView.btnBack addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview: _navigationView] ;
}

// 导航返回上一界面
-(void)clickBack{
    //返回上衣界面时隐藏 leftTableView
    [_leftTopView setHidden:YES] ;
    [self.navigationController popToRootViewControllerAnimated:YES] ;
}

// 随着滑动改变  顶部view  颜色
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y ;
    NSLog(@"滚动的偏移 : %.2f",y) ;
    if(tabV.contentOffset.y < -145.0) {
        CATransition *transition = [[CATransition alloc] init];
        transition.type = kCATransitionPush ;
        transition.subtype = kCATransitionFromTop ;
        transition.duration = 0.5 ;
        [_navigationView.layer addAnimation:transition forKey:@""];
        [_navigationView setHidden:YES];
    }else
    {
        [_navigationView setHidden:NO];
        //透明度
        CGFloat alpha = tabV.contentOffset.y / 1000;
        _navigationView.backgroundColor=[GVColor hexStringToColor:@"#ffba14"];
        _navigationView.alpha = alpha ;
    }
}

#pragma mark 3. pop出左边  视图
-(void)popSearchView{
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, ScreenHEIGHT/2 , SIZE(52.0), SIZE(160.0));
    [btn setImage:[UIImage imageNamed:@"rowing_to_starboard"] forState:UIControlStateNormal] ;
    [btn addTarget:self action:@selector(clickPopLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)clickPopLeft
{
    [UIView animateWithDuration:0.6 animations:^{
        
        _navigationView.userInteractionEnabled  = NO ; //导航条失效
        [_leftTopView setHidden:NO ] ;
        tabV.allowsSelection = NO ;    //tabV 不允许点击
        
        //按钮 -  购物车 - 表格 -  左侧视图   整体偏移
        CGRect rect1 = btn.frame ;
        rect1.origin.x = SIZE(470.0) ;
        btn.frame = rect1 ;

        CGRect rect3 = _shoppV.frame ;
        rect3.origin.x = ScreenWIDTH  ;
        _shoppV.frame = rect3 ;
        
        CGRect rect4 = tabV.frame ;
        rect4.origin.x = SIZE(470.0) ;
        tabV.frame = rect4 ;
        
        CGRect rect5 = _leftTopView.frame ;
        rect5.origin.x = 0 ;
        _leftTopView.frame = rect5 ;
        
//        [self.view addSubview: coverView] ;
        coverView.alpha = 0.5 ;
        
    }] ;
    
}

// 购物车
-(void)shoppView
{
    _shoppV = [[SecondaryShoppV alloc]initWithFrame:CGRectMake(ScreenWIDTH - SIZE(340.0), ScreenHEIGHT - SIZE(280.0) , SIZE(290.0), SIZE(140.0))] ;
    [_shoppV.moneyBtn addTarget:self action:@selector(clickShowMoneyList) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:_shoppV] ;
}
//购物车清单
-(void)clickShowMoneyList{
    if (_shoppV.showNumLab.text.integerValue == 0)   return ;
    else  [self showListView] ;
}

-(void)addListView
{
    _listV = [[ListView alloc]initWithFrame:CGRectMake(0, ScreenHEIGHT, ScreenWIDTH, 300)] ;
    _listV.backgroundColor = [UIColor greenColor] ;
    [self.view addSubview:_listV] ;
}
-(void)showListView
{
    [UIView animateWithDuration:0.6 animations:^{
        
        [_leftTopView setHidden:NO ] ;
        tabV.allowsSelection = NO ;    //tabV 不允许点击
        
        // 购物车清单   整体偏移
        CGRect rect1 = _listV.frame ;
        rect1.origin.y = SIZE(300.0) ;
        _listV.frame = rect1 ;
        
    }] ;
}
#pragma mark - 4. tableView dataSource-
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 501) {
        NSLog(@"``  %ld",_mArrMiddle.count) ;
        return _mArrMiddle.count ;
        
    }else{
        return _mArrLeft.count ;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifer = @"SecondaryCell" ;
    static NSString * identifer2 = @"SecondLeftTabCell" ;
    if (tableView.tag == 501) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifer] ;
        if (!cell) {
            cell = [[SecondaryCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer] ;
            //cell.selectionStyle = UITableViewCellSelectionStyleNone ; // 设置点击cell颜色状态
        }
        [cell setSecondaryModel_menu_info:_mArrMiddle[indexPath.row]] ;
        //签署代理  --进行增加-减少菜品份数
        cell.delegate =self ;
        return cell ;
    }
    else{
        
            SecondLeftTabCell *cell2 = [tableView dequeueReusableCellWithIdentifier:identifer2] ;
            if (!cell2) {
                cell2 = [[SecondLeftTabCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer2] ;
            }
        [cell2 setSecondaryModel_type:_mArrLeft[indexPath.row]] ;
        return cell2 ;
    }
}
// 增加菜的份数
-(void)addSencondary:(SecondaryCell *)sencon{
    _redView.center = sencon.btnAdd.center ;
    
    sencon.labFoodNum.text = [NSString stringWithFormat:@"%ld",(sencon.labFoodNum.text.integerValue+1)]; //份数
    _shoppV.showNumLab.text = sencon.labFoodNum.text;
    _shoppV.showNumLab.hidden = isHidden;  //购物车<个数>隐藏
    sencon.btnReduce.hidden = isHidden ;      //减少按钮隐藏
    sencon.labFoodNum.hidden = isHidden;     //份数隐藏
    
    [self.view addSubview:self.redView];
    [[ThrowLineTool sharedTool] throwObject:self.redView from:self.redView.center to:_shoppV.center height:10 duration:0.4];
    cell.btnAdd.enabled = NO;
    
    //价格相加          sencon.labPrice.text floatValue   单价         sencon.labFoodNum.text.integerValue    数量
    CGFloat price = [sencon.labPrice.text floatValue] *sencon.labFoodNum.text.integerValue ;
    [_shoppV.moneyBtn setTitle:[NSString stringWithFormat:@"¥ %.2f元" ,price] forState:UIControlStateNormal] ;
    
    //sencon.labFoodNum.text.integerValue
//    [_shoppV.moneyBtn setTitle:[NSString stringWithFormat:@"¥ %.2f元" ,price] forState:UIControlStateNormal] ;
    
}
// 减少菜的份数
-(void)reduceSencondary:(SecondaryCell *)sencon{
    sencon.labFoodNum.text = [NSString stringWithFormat:@"%ld",(sencon.labFoodNum.text.integerValue - 1) > 0 ? (sencon.labFoodNum.text.integerValue - 1) : 0];
    _shoppV.showNumLab.text = sencon.labFoodNum.text ;
    // 是否隐藏
    _shoppV.showNumLab.hidden = isHidden ;
    sencon.btnReduce.hidden = isHidden;
    sencon.labFoodNum.hidden = isHidden ;
    
    //价格减
//    ( sencon.labFoodNum.text.integerValue )
    CGFloat price = [sencon.labPrice.text floatValue] *sencon.labFoodNum.text.integerValue ;
    if (sencon.labFoodNum.text.integerValue ==0)    [_shoppV.moneyBtn setTitle:@"" forState:UIControlStateNormal] ;
    else   [_shoppV.moneyBtn setTitle:[NSString stringWithFormat:@"¥ %.2f元" ,price ] forState:UIControlStateNormal] ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 501) {
        MenuInfoVC *my = [[MenuInfoVC alloc]init] ;
        [self.navigationController pushViewController:my animated:YES] ;
    }else{
        //菜品类型id
        SecondaryModel_type *sm_type = _mArrLeft[indexPath.row] ;
        type_id = sm_type.id ;
        //根据菜品类型请求
        [self secondaryRequest] ;
        // 返回原来状态
        [self subPanBack] ;

    }
    //取消cell 的常亮状态
    [self performSelector:@selector(deSelectHigh) withObject:nil afterDelay:0.1] ;
    
   
}

// 取消cell 的常亮状态
-(void)deSelectHigh
{
    [tabV deselectRowAtIndexPath:[tabV indexPathForSelectedRow] animated:YES] ;
    [leftTabV deselectRowAtIndexPath:[leftTabV indexPathForSelectedRow] animated:YES] ;
}


// 购物车,起点---终点的移动过程---起点位置
- (UIView *)redView
{
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _redView.backgroundColor = [UIColor redColor];
//        _redView.center = self.view.center ;
        _redView.layer.cornerRadius = 10;
    }
    return _redView;
}
 // 红点的动画
- (void)animationDidFinish
{
    [self.redView removeFromSuperview];
    [UIView animateWithDuration:0.1 animations:^{
        _shoppV.shoppBtn.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            _shoppV.shoppBtn.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            cell.btnAdd.enabled = YES;
        }];
    }];
}

#pragma mark - 5. UINavigationControllerDegelate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES] ;
}


#pragma mark - 6. 左边 视图 懒加载
-(void)leftPopView
{
    _leftTopView = [[SecondaryLeftTopView alloc]initWithFrame:CGRectMake(- SIZE(470.0), 0, SIZE(470.0) , ScreenHEIGHT)] ;
    _leftTopView.leftTableV.delegate =self ;
    _leftTopView.leftTableV.dataSource =self ;
    [self.view addSubview:_leftTopView] ;
    
    [_leftTopView.btnAllData addTarget:self action:@selector(clickSearchData) forControlEvents:UIControlEventTouchUpInside] ;
    // 轻扫手势
    //        UITapGestureRecognizer *subVPan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(subPanBack)] ;
    //        [self.leftTableV addGestureRecognizer:subVPan] ;
}

//返回手势
-(void)subPanBack{
    [UIView animateWithDuration:0.6 animations:^{
        _navigationView.userInteractionEnabled  = YES ; //导航条失效
        tabV.allowsSelection = YES ; //表格可用
//        
        //按钮 -  购物车 - 表格 -  左侧视图   整体还原
        CGRect rect1 = btn.frame ;
        rect1.origin.x = 0 ;
        btn.frame = rect1 ;
        
        CGRect rect3 = _shoppV.frame ;
        rect3.origin.x = ScreenWIDTH - SIZE(340.0) ;
        _shoppV.frame = rect3 ;
        
        CGRect rect4 = tabV.frame ;
        rect4.origin.x = 0 ;
        tabV.frame = rect4 ;
        
        CGRect rect5 = _leftTopView.frame ;
        rect5.origin.x = - SIZE(470.0) ;
        _leftTopView.frame = rect5 ;
        
//         coverView.hidden =YES ;
        coverView.alpha = 0 ;
//        [coverView removeFromSuperview] ;
        
    }] ;
}

// 全部查询
-(void)clickSearchData
{
    [self requestData] ;
    [self subPanBack] ;
}
// 再次请求数据
-(void)secondaryRequest
{
     _mArrMiddle = [NSMutableArray array] ;
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:self.strStore_ID,@"store_id",type_id,@"type_id", nil] ;
    [NetworkRequest LogininfoRequestWithUrl:STORECOOKE_CLASS_CHOSE parameters:dic2 Success:^(id success) {
        NSLog(@"leftType : %@",success) ;
        
        NSArray *array = [success objectForKey:@"menu_info"] ;
        for (NSDictionary *dic3 in array) {
            SecondaryModel_menu_info *sm_menu_info = [[SecondaryModel_menu_info alloc]init] ;
            [sm_menu_info setValuesForKeysWithDictionary:dic3] ;
            [_mArrMiddle addObject:sm_menu_info] ;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [tabV reloadData] ;
        }) ;
    } Failure:^(id failure) {
        NSLog(@"leftType : %@",failure) ;
    }] ;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

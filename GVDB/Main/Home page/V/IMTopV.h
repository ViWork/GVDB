//
//  IMTopV.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/27.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMTopV : UIView<UISearchBarDelegate>
@property(nonatomic,strong)UIButton *leftBtn ,*rightBtn ;
@property(nonatomic,strong)UIImageView * topImg ;

/**
 搜索
 */
@property(nonatomic,strong)UISearchBar * searchBar ;

@end

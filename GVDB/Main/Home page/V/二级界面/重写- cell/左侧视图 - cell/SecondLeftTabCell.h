//
//  SecondLeftTabCell.h
//  GVDB
//
//  Created by 赵鹏云 on 17/1/3.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryModel.h"

@interface SecondLeftTabCell : UITableViewCell

@property(nonatomic,strong)UILabel * labType ;
@property(nonatomic,strong)NSString * id ;
@property(nonatomic,strong)SecondaryModel_type * secondaryModel_type ;
@end

//
//  CityList.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectCity)(NSString *cityName);

@interface CityList : UIViewController
@property (nonatomic,strong) SelectCity  selectCity;

@end

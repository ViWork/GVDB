//
//  CityCollectionCell.h
//  GVDB
//
//  Created by 赵鹏云 on 16/12/28.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityCollectionCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *gpsImageView;
-(void)isShowGPSStatus:(BOOL)isShow withLocationCityName:(NSString *)cityName;
@end

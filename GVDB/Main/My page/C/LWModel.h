//
//  LWModel.h
//  GVDB
//
//  Created by apple on 2017/1/4.
//  Copyright © 2017年 Viosky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWModel : NSObject
@property (nonatomic,strong) NSString *name,*author;
@property (nonatomic,assign)float price;
@property (nonatomic,assign)NSInteger bookID;

@end

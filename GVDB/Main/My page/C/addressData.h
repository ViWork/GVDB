//
//  addressData.h
//  GVDB
//
//  Created by apple on 2016/12/31.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWModel.h"
@interface addressData : NSObject
//单列类
+ (instancetype)shareWSDealData;

// 打开数据库
- (BOOL)openDB;

// 创建表
- (void)createTable;

// 增加数据
- (void)addData:(LWModel *)book;

// 删除数据
- (void)deleteData:(NSInteger)ID;

// 修改数据
- (void)updateData:(LWModel *)book withAnotherData:(LWModel *)another;

// 查找数据
- (NSMutableArray *)selectData;

// 关闭数据
- (void)closeDB;


@end

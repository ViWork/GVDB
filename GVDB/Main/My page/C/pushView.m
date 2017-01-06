//
//  pushView.m
//  GVDB
//
//  Created by apple on 2016/12/31.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "pushView.h"

@implementation pushView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.fieldName];
        [self addSubview:self.fieldAuthor];
        
         [_fieldAuthor addSubview:_lab2];
    }
    return self;
}

- (UITextField *)fieldName
{
    if (!_fieldName) {
        _fieldName = [[UITextField alloc]initWithFrame:CGRectMake(0, 70, self.frame.size.width, 30)];
        _fieldName.backgroundColor=[UIColor lightGrayColor];
//        _fieldName.borderStyle = UITextBorderStyleRoundedRect;
     
        [_fieldName addSubview:_labb];
    }
    return _fieldName;
    
}

- (UITextField *)fieldAuthor
{
    if (!_fieldAuthor) {
        _fieldAuthor = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, self.frame.size.width, 30)];
        _fieldAuthor.backgroundColor=[UIColor blueColor];
        [_fieldName addSubview:_lab2];
//        _fieldAuthor.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _fieldAuthor;
}
-(UILabel *)lab12
{
    if (!_lab2) {
        _lab2=[[UILabel alloc]initWithFrame:CGRectMake(0, 70, 100, 40)];
        _lab2.font=[UIFont systemFontOfSize:15];
        _lab2.text=@"联系电话";
        
    }
    return _lab2;
}
-(UILabel *)labb
{
    if (!_labb) {
        _labb=[[UILabel alloc]initWithFrame:CGRectMake(0, 70, 100, 40)];
        _labb.font=[UIFont systemFontOfSize:15];
        _labb.text=@"姓名";
        _labb.textColor=[UIColor blueColor];
    }
    return _labb;
}


@end

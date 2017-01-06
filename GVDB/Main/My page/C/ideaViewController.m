//
//  ideaViewController.m
//  GVDB
//
//  Created by apple on 2016/12/29.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "ideaViewController.h"

@interface ideaViewController ()<UITextViewDelegate>
{
    UITextView *_contentTextView;
    UILabel *_placeHolderLabel;
    NSDictionary *dic;
    
//    NSString *lookStr ;
    UILabel *labNum ;
}
@end


@implementation ideaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clickSender:) name:@"ha" object:nil] ;
    
    
    [self showView];
    _contentTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 74, [UIScreen mainScreen].bounds.size.width, 220)];
    _contentTextView.backgroundColor = [UIColor whiteColor];
    _contentTextView.delegate = self;
    _contentTextView.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_contentTextView];
    
    _placeHolderLabel = [[UILabel alloc]init];
    _placeHolderLabel.frame = CGRectMake(0, 5, [UIScreen mainScreen].bounds.size.width, 20);
    _placeHolderLabel.text = @"请输入反馈，我们将为您不断改进";
    _placeHolderLabel.enabled = NO;
    _placeHolderLabel.backgroundColor = [UIColor clearColor];
    _placeHolderLabel.font = [UIFont systemFontOfSize:12];
    [_contentTextView addSubview:_placeHolderLabel];
    UIButton *submit=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submit setTitle:@"提交" forState:UIControlStateNormal];
    submit.backgroundColor=[GVColor hexStringToColor:@"#ffba14"];
    [self.view addSubview:submit];
    submit.layer.cornerRadius=15;
    submit.layer.masksToBounds=YES;
    [submit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    [submit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contentTextView.mas_left).offset(90);
        make.right.equalTo(_contentTextView.mas_right).offset(-90);
        make.top.equalTo(_contentTextView.mas_bottom).offset(40);
    }] ;
    
    labNum=[[UILabel alloc]init];
    labNum.font=[UIFont systemFontOfSize:10];
    [_contentTextView addSubview:labNum];
    [labNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentTextView.mas_bottom).offset(200);
        make.left.equalTo(_contentTextView.mas_left).offset(5);
        
    }];
    labNum.text =   [NSString stringWithFormat:@"%lu/300",(unsigned long)_contentTextView.text.length] ;
    self.view.backgroundColor = [UIColor colorWithRed:239/255. green:239/255. blue:244/255. alpha:1] ;


}
-(void)showView{
    UIView *nav=[[UIView alloc]init];
    nav.backgroundColor=[GVColor hexStringToColor:@"#ffba14"];
    [self.view addSubview:nav];
    
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.height.mas_offset(64);
    }];
    UILabel *labTitle=[[UILabel alloc]init];
    labTitle .font=[UIFont systemFontOfSize:20];
    labTitle.textAlignment=NSTextAlignmentCenter;
    labTitle.text=@"意见反馈";
    [self.view addSubview:labTitle];
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(28);
        make.width.equalTo(nav.mas_width);
    }];
    UIButton *rtn=[[UIButton alloc]init];
    [rtn setTitle:@"<" forState:UIControlStateNormal];
    rtn.titleLabel.font=[UIFont systemFontOfSize:23];
    [rtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:rtn];
    [rtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [rtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(20);
        make.left.equalTo(nav.mas_left).offset(5);
    }];
    
}
#pragma mark -- UITextFieldDelegate

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if ([_contentTextView isFirstResponder])
    {
        [_contentTextView resignFirstResponder];
    }
}


-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        _placeHolderLabel.text = @"请输入反馈，我们将为您不断改进";
    }else{
        _placeHolderLabel.text = @"";
        
    }
    labNum.text =   [NSString stringWithFormat:@"%lu/300",(unsigned long)_contentTextView.text.length] ;
    
   
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location>=300) {
        return NO;
    }else
    {
        return YES;
    }
}

-(void)click
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)submitClick
{
//    NSDictionary *param=@{@"user_id":@"10001",@"content":_contentTextView.text};
//    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
//    manager.responseSerializer=[[AFJSONResponseSerializer alloc]init];
//    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/json"]];
//    [manager GET:JSON_url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//        NSData *data=responseObject;
//        dic=[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
//        NSLog(@"~~ %@",dic);
//        
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"ha" object:dic] ;
//        
//        NSString *code=responseObject[@"code"];
//        NSDictionary *content=responseObject[@"content"];
//        
//        if ([code integerValue]==1) {
//            [[[UIAlertView alloc]initWithTitle:@"提示" message:content[@"message"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil]show];
//            
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        nil;
//    }];
//    
    NSURLSession *session=[NSURLSession sharedSession];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.kdiana.com/index.php/Before/UserCenter/feedback"]];
    [request addValue:@"application/json" forHTTPHeaderField:@"content"];
    [request setHTTPMethod:@"POST"];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval:1];
    NSDictionary *dataDic=@{@"user_id":@"10001",@"message":@"\u63d0\u4ea4\u6210\u529f"};
    
    NSData *data=[NSJSONSerialization dataWithJSONObject:dataDic options:NSJSONWritingPrettyPrinted error:nil];
    NSURLSessionTask *uploadTask=[session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dictionary=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        if (!error) {
            
            [[[UIAlertView alloc]initWithTitle:@"提示" message:[dictionary objectForKey:@"message"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil]show];

        }else
        {
            [[[UIAlertView alloc]initWithTitle:@"提示" message:[dictionary objectForKey:@"message"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil]show];
        }
    }];
    
    
    [uploadTask resume];
    
}




-(void)clickSender:(NSNotification *)noti{
    NSLog(@"new : %@", noti.object ) ;
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

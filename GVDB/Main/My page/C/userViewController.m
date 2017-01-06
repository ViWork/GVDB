//
//  userViewController.m
//  GVDB
//
//  Created by apple on 2016/12/30.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import "userViewController.h"
#import "imageViewController.h"
@interface userViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITableView *_tab;
    NSArray *arr1,*arr2;
    UIButton *headerbtn;
}
@end

@implementation userViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showView];
    [self table];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)table{
    _tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStyleGrouped];
    _tab.delegate=self;
    _tab.dataSource=self;
    [self.view addSubview:_tab];
   
    arr2=[NSArray arrayWithObjects:@"电话",@"密码", nil];
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
    labTitle.text=@"我的信息";
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
        
    }else if (section==1)
    {
        return arr2.count;
    }else
    {
        return 1;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"s";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        
    }
    if (indexPath.section==0) {
        if (indexPath.row==0) {
//           headerbtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 40)];
//            [headerbtn setTitle:@"头像" forState:UIControlStateNormal];
//            [headerbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [cell.contentView addSubview:headerbtn];
//            [headerbtn addTarget:self action:@selector(headerClick) forControlEvents:UIControlEventTouchUpInside];
            cell.textLabel.text=@"头像";
        }
        else if (indexPath.row==1)
        {
            cell.textLabel.text=@"昵称";

        }else if (indexPath.row==2)
        {
            cell.textLabel.text=@"生日";
        }
            
    }else if (indexPath.section==1)
    {
        cell.textLabel.text=arr2[indexPath.row];

    }else
    {
        UIButton *leavebtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 5, [UIScreen mainScreen].bounds.size.width, 40)];
        [leavebtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [leavebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell.contentView addSubview:leavebtn];
    }
    cell.accessoryType=1;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.1;
    }else
    {
        return 10;
    }
}
-(void)click
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)headerClick
{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        
        
        
    }];
    
    
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        imagePicker.delegate = self;
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
        }
        
        
        [self presentViewController:imagePicker animated:YES completion:nil];
        
        
        
    }];
    
    
    
    UIAlertAction *picture = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
            
            
            
        }
        
        pickerImage.delegate = self;
        
        pickerImage.allowsEditing = NO;
        
        
        
        [self presentViewController:pickerImage animated:YES completion:nil];
        
    }];
    
    [alertVc addAction:cancle];
    
    [alertVc addAction:camera];
    
    [alertVc addAction:picture];
    
    [self presentViewController:alertVc animated:YES completion:nil];
    
    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            [self headerClick];
            
            
            
            
        }
    }
}
// 选择图片

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    
    
    //当选择的类型是图片
    
    if ([type isEqualToString:@"public.image"])
        
    {
        
        //先把图片转成NSData
        
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        NSData *data;
        
        if (UIImagePNGRepresentation(image) ==nil)
            
        {
            
            data = UIImageJPEGRepresentation(image,1.0);
            
        }
        
        else
            
        {
            
            data = UIImagePNGRepresentation(image);
            
        }
        
        
        
        //图片保存的路径
        
        //这里将图片放在沙盒的documents文件夹中
        
        NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        
        
        //文件管理器
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        
        
        //把刚刚图片转换的data对象拷贝至沙盒中并保存为image.png
        
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/userHeader.png"] contents:data attributes:nil];
        
        
        
        //关闭相册界面
        
        
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        //加在视图中
        
        [headerbtn setBackgroundImage:image forState:(UIControlStateNormal)];
        
        
        
        
    }
    
}

// 取消选取图片

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker

{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 70;
        }else
        {
            return 50;
        }
    }else
    {
        return 50;
    }
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

//
//  imageViewController.h
//  GVDB
//
//  Created by apple on 2016/12/30.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imageScroll;

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@end

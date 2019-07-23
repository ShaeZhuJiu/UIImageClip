//
//  ViewController.m
//  UIImageLipe
//
//  Created by 谢鑫 on 2019/7/23.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clipImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self clipImageView2];
    [self myScreenShot];
}
-(UIImage *)clipImageView:(UIImage *)image{
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //  获取路径
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //裁剪圆形
    [path addClip];
    //n把图片塞进上下文
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //保存新图片
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return  newImage;
    
}
-(void)clipImageView2{
UIImage *image=[UIImage imageNamed:@"2"];
_clipImageView.image=image;
_clipImageView.layer.cornerRadius=_clipImageView.bounds.size.width*0.5;
_clipImageView.layer.masksToBounds=YES;
}
-(void)myScreenShot{
    //开启一个图形上下文
    UIGraphicsBeginImageContext(self.view.bounds.size);
    //截屏
    if([self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES]){
        NSLog(@"Successfully draw the screenshot.");
    }else{
         NSLog(@"Failed to draw the screenshot.");
    }
    //获取当前d上下文
    UIImage *screenShot= UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(screenShot, self, nil, nil);
}
@end

//
//  ViewController.m
//  FaceRecognition
//
//  Created by 聚财通 on 16/3/1.
//  Copyright © 2016年 付正. All rights reserved.
//

#import "ViewController.h"
#import "FaceStreamDetectorViewController.h"
#import "IDAuthViewController.h"

@interface ViewController ()<FaceDetectorDelegate>
{
    UIImageView *imgView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self buttonWithTitle:@"人脸识别" frame:CGRectMake((self.view.frame.size.width - 150)/2, self.view.frame.size.height/2 - 100, 150, 30) action:@selector(pushToFaceStreamDetectorVC) AddView:self.view];
    
    [self buttonWithTitle:@"扫描身份证" frame:CGRectMake((self.view.frame.size.width - 150)/2, self.view.frame.size.height/2 - 50, 150, 30) action:@selector(click:) AddView:self.view];
    
    
}

-(void)sendFaceImage:(UIImage *)faceImage
{
    
}

- (void)click:(UIButton *)sender{
    IDAuthViewController *IDAuthVC = [[IDAuthViewController alloc] init];
    
    [self.navigationController pushViewController:IDAuthVC animated:YES];
}

-(void)pushToFaceStreamDetectorVC
{
    FaceStreamDetectorViewController *faceVC = [[FaceStreamDetectorViewController alloc]init];
    faceVC.faceDelegate = self;
    [self.navigationController pushViewController:faceVC animated:YES];
}

#pragma mark --- 创建button公共方法
/**使用示例:[self buttonWithTitle:@"点 击" frame:CGRectMake((self.view.frame.size.width - 150)/2, (self.view.frame.size.height - 40)/3, 150, 40) action:@selector(didClickButton) AddView:self.view];*/
-(UIButton *)buttonWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)action AddView:(id)view
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor colorWithRed:0.601 green:0.596 blue:0.906 alpha:1.000];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchDown];
    [view addSubview:button];
    return button;
}

@end

//
//  KGResigetViewController.m
//  FaceRecognition
//
//  Created by KG on 2017/12/13.
//  Copyright © 2017年 付正. All rights reserved.
//

#import "KGResigetViewController.h"
#import "KGTextField.h"

@interface KGResigetViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) KGTextField *phoneNumber;
@property (nonatomic,strong) KGTextField *verify;
@property (nonatomic,strong) KGTextField *passWord;
@property (nonatomic,strong) KGTextField *surePassWord;

@end

@implementation KGResigetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"注册账号";

}

#pragma mark -创建账号输入框-
- (void)setPhoneNumber{
    
    _phoneNumber = [[KGTextField alloc]initWithFrame:CGRectMake(50, 0, ScreenWidth - 100, 50)];
    _phoneNumber.center = CGPointMake(ScreenWidth/2, ScreenHeight/2 - 100);
    _phoneNumber.backgroundColor = [UIColor whiteColor];
    _phoneNumber.placeholder = @"请输入手机号/邮箱/QQ账号";
    _phoneNumber.borderStyle = UITextBorderStyleRoundedRect;
    _phoneNumber.delegate = self;
    _phoneNumber.clearButtonMode = UITextFieldViewModeAlways;
    _phoneNumber.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的 灰"]];
    _phoneNumber.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_phoneNumber];
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

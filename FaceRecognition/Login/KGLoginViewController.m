//
//  KGLoginViewController.m
//  FaceRecognition
//
//  Created by KG on 2017/12/13.
//  Copyright © 2017年 付正. All rights reserved.
//

#import "KGLoginViewController.h"
#import "KGTextField.h"
#import "KGForgetViewController.h"
#import "KGResigetViewController.h"
#import "FaceStreamDetectorViewController.h"

@interface KGLoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) KGTextField *userName;
@property (nonatomic,strong) KGTextField *passWord;

@end

@implementation KGLoginViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setUserName];
    [self setPassWord];
    [self setButton];
}

#pragma mark -创建账号输入框-
- (void)setUserName{
    
    _userName = [[KGTextField alloc]initWithFrame:CGRectMake(50, 0, ScreenWidth - 100, 50)];
    _userName.center = CGPointMake(ScreenWidth/2, ScreenHeight/2 - 100);
    _userName.backgroundColor = [UIColor whiteColor];
    _userName.placeholder = @"请输入手机号/邮箱/QQ账号";
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.delegate = self;
    _userName.clearButtonMode = UITextFieldViewModeAlways;
    _userName.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的 灰"]];
    _userName.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_userName];
}

#pragma mark -创建密码输入框-
- (void)setPassWord{
    
    _passWord = [[KGTextField alloc]initWithFrame:CGRectMake(50, 0, ScreenWidth - 100, 50)];
    _passWord.center = CGPointMake(ScreenWidth/2, ScreenHeight/2 - 20);
    _passWord.backgroundColor = [UIColor whiteColor];
    _passWord.placeholder = @"请输入密码";
    _passWord.borderStyle = UITextBorderStyleRoundedRect;
    _passWord.delegate = self;
    _passWord.secureTextEntry = YES;
    _passWord.rightView = [self setLookButton];
    _passWord.rightViewMode = UITextFieldViewModeAlways;
    _passWord.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"锁"]];
    _passWord.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_passWord];
}

#pragma mark -创建点击查看密码按钮-
- (UIButton *)setLookButton{
    UIButton *lookBtu = [UIButton buttonWithType:UIButtonTypeCustom];
    lookBtu.frame = CGRectMake(0, 0, 30, 30);
    [lookBtu setImage:[UIImage imageNamed:@"眼睛"] forState:UIControlStateNormal];
    [lookBtu addTarget:self action:@selector(lookBtuClick:) forControlEvents:UIControlEventTouchUpInside];
    return lookBtu;
}

#pragma mark -查看密码按钮点击事件-
- (void)lookBtuClick:(UIButton *)sender{
    if (_passWord.secureTextEntry == NO) {
        _passWord.secureTextEntry = YES;
    }else{
        _passWord.secureTextEntry = NO;
    }
}

#pragma mark -收件盘-
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
}

#pragma mark -创建按钮-
- (void)setButton{
    
    [self setButtonWithTitle:@"登录" frame:CGRectMake(50,ScreenHeight/2 + 60,ScreenWidth - 100,50) action:@selector(loginClick:) addView:self.view color:[UIColor colorWithRed:34/255.0 green:116/255.0 blue:255/255.0 alpha:1] titleColor:[UIColor whiteColor]];
    [self setButtonWithTitle:@"注册" frame:CGRectMake(50,ScreenHeight/2 + 120,150,50) action:@selector(regsiterClick:) addView:self.view color:[UIColor clearColor] titleColor:[UIColor colorWithRed:34/255.0 green:116/255.0 blue:255/255.0 alpha:1]];
    [self setButtonWithTitle:@"忘记密码" frame:CGRectMake(ScreenWidth - 200,ScreenHeight/2 + 120,150,50) action:@selector(forgetClick:) addView:self.view color:[UIColor clearColor] titleColor:[UIColor colorWithRed:34/255.0 green:116/255.0 blue:255/255.0 alpha:1]];
}

#pragma mark -创建公共按钮-
- (void)setButtonWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)action addView:(UIView *)addview color:(UIColor *)color titleColor:(UIColor *)titleColor{
    
    UIButton *ButtonName = [UIButton buttonWithType:UIButtonTypeCustom];
    ButtonName.frame = frame;
    ButtonName.backgroundColor = color;
    [ButtonName setTitle:title forState:UIControlStateNormal];
    [ButtonName setTitleColor:titleColor forState:UIControlStateNormal];
    ButtonName.titleLabel.font = [UIFont systemFontOfSize:20.0f];
    ButtonName.layer.cornerRadius = 5.0f;
    ButtonName.layer.borderColor = [UIColor clearColor].CGColor;
    ButtonName.layer.borderWidth = 1.0f;
    ButtonName.layer.masksToBounds = YES;
    [ButtonName addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [addview addSubview:ButtonName];
}

#pragma mark -登录按钮点击事件-
- (void)loginClick:(UIButton *)sender{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[FaceStreamDetectorViewController alloc] init]];
    UIWindow *myWindow = [UIApplication sharedApplication].keyWindow;
    myWindow.rootViewController = navigationController;
    
}

#pragma mark -注册按钮点击事件-
- (void)regsiterClick:(UIButton *)sender{
    KGResigetViewController *controller = [[KGResigetViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -忘记密码按钮点击事件-
- (void)forgetClick:(UIButton *)sender{
    KGForgetViewController *controller = [[KGForgetViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
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

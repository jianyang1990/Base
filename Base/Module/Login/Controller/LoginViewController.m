//
//  LoginViewController.m
//  Base
//
//  Created by mobile on 2020/5/19.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
//api
#import "LoginApi.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *submitBtn;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

#pragma mark - Private Methods

- (void)setupUI {
    [self.view addSubview:({
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.text = @"用户名";
        self.nameLabel.font = MobileFont(15);
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.backgroundColor = [UIColor redColor];
        self.nameLabel;
    })];

    [self.view addSubview:({
        self.nameField = [[UITextField alloc] init];
        self.nameField.placeholder = @"请输入您的用户名";
        self.nameField.backgroundColor = [UIColor orangeColor];
        self.nameField.tag = 1000;
        self.nameField.delegate = self;
        self.nameField;
    })];

    [self.view addSubview:({
        self.passwordLabel = [[UILabel alloc] init];
        self.passwordLabel.text = @"密码";
        self.passwordLabel.font = MobileFont(15);
        self.passwordLabel.textColor = [UIColor whiteColor];
        self.passwordLabel.textAlignment = NSTextAlignmentLeft;
        self.passwordLabel.backgroundColor = [UIColor cyanColor];
        self.passwordLabel;
    })];

    [self.view addSubview:({
        self.passwordField = [[UITextField alloc] init];
        self.passwordField.placeholder = @"请输入您的密码";
        self.passwordField.backgroundColor = [UIColor greenColor];
        self.passwordField.tag = 2000;
        self.passwordField.delegate = self;
        self.passwordField;
    })];

    [self.view addSubview:({
        self.submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.submitBtn.titleLabel setFont:MobileFont(17)];
        [self.submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.submitBtn setTitle:@"登录" forState:UIControlStateNormal];
        [self.submitBtn setBackgroundColor:[UIColor blueColor]];
        [self.submitBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        self.submitBtn;
    })];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.centerY.mas_equalTo(self.view.centerY).offset(-50);
        make.width.mas_equalTo(@50);
        make.height.mas_equalTo(@50);
    }];

    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_right).offset(10);
        make.right.mas_equalTo(self.view.right).offset(-15);
        make.top.height.mas_equalTo(self.nameLabel);
    }];

    [self.passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.centerY.mas_equalTo(self.view.centerY).offset(10);
        make.width.mas_equalTo(@50);
        make.height.mas_equalTo(@50);
    }];

    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.passwordLabel.mas_right).offset(10);
        make.right.mas_equalTo(self.view.right).offset(-15);
        make.top.height.mas_equalTo(self.passwordLabel);
    }];

    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(30);
        make.right.mas_equalTo(self.view).offset(-30);
        make.bottom.mas_equalTo(self.view.bottomY).offset(-50);
        make.height.mas_equalTo(@50);
        make.centerX.mas_equalTo(self.view.centerX);
    }];
}

/*
登录按钮点击
*/
- (void)login {
    
    LoginApi *api = [[LoginApi alloc] initWithPhone:self.name AndPassword:self.password];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *_Nonnull request) {
        
        //保存用户信息
        [(LoginApi *)request saveUserInfo];
        
        //跳转首页
        UIWindow *keyWindow;
        if (@available(iOS 13.0, *)) {
            keyWindow = [UIApplication sharedApplication].windows[0];
        } else {
            keyWindow = [UIApplication sharedApplication].keyWindow;
        }
        keyWindow.rootViewController = [[MainViewController alloc] init];
        [keyWindow makeKeyAndVisible];
    } failure:^(__kindof YTKBaseRequest *_Nonnull request) {
        
    }];
}

#pragma mark - UITextField Delegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    switch (textField.tag) {
        case 1000:
            self.name = textField.text;
            break;
        case 2000:
            self.password = textField.text;
            break;
        default:
            break;
    }
}

@end

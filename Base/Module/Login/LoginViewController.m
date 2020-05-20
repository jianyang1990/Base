//
//  LoginViewController.m
//  Base
//
//  Created by mobile on 2020/5/19.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()
@property (nonatomic, strong) UIButton *submitBtn;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - Private Methods

- (void)setupUI {
    [self.view addSubview:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button.titleLabel setFont:MobileFont(17)];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blueColor]];
        [button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        self.submitBtn = button;
        self.submitBtn;
    })];
    
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
    UIWindow *keyWindow ;
    if (@available(iOS 13.0, *)) {
        keyWindow = [UIApplication sharedApplication].windows[0];
    }else {
        keyWindow = [UIApplication sharedApplication].keyWindow;
    }
    keyWindow.rootViewController = [[MainViewController alloc] init];
    [keyWindow makeKeyAndVisible];
}


@end

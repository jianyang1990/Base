//
//  ViewController.m
//  Base
//
//  Created by mobile on 2020/5/8.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RandomColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (kFetchMyDefault(@"token")) {
        NSLog(@"已登录");
    }else {
        NSLog(@"未登陆");
    }
}


@end

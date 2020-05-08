//
//  MainViewController.m
//  Base
//
//  Created by mobile on 2020/5/8.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
}

- (void)addSubViews {
    ViewController *vc = [[ViewController alloc] init];
    vc.tabBarItem.title = @"首页";
//    vc.tabBarItem.image
//    vc.tabBarItem.selectedImage
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navi];
}
@end

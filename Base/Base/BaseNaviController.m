//
//  BaseNaviController.m
//  Base
//
//  Created by mobile on 2020/5/8.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "BaseNaviController.h"

@interface BaseNaviController ()

@end

@implementation BaseNaviController

//统一设置导航栏
+ (void)load {
    UINavigationBar *bar = [UINavigationBar appearance];
//    bar.barTintColor = [UIColor redColor];
//    [bar setTintColor:[UIColor darkGrayColor]];
//    bar.translucent = YES;
//    [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [bar setShadowImage:[UIImage new]];
    [bar setBackgroundColor:[UIColor whiteColor]];
    [bar setTranslucent:NO];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置导航栏字体颜色
    UIColor *naviTitleColor = MobileTitleColor;
    attributes[NSForegroundColorAttributeName] = naviTitleColor;
    attributes[NSFontAttributeName] = MobileFont(17);
    bar.titleTextAttributes = attributes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        //隐藏下一页的底部tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        //就有滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
        //返回按钮自定义
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -15;
        
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(0, 0, 33, 33);
        
        if (@available(ios 11.0,*)) {
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -15,0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -10,0, 0);
        }
        
        [button addTarget:self action:@selector(backButtonTapClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 点击
- (void)backButtonTapClick {
    [self popViewControllerAnimated:YES];
}
@end

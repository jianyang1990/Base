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
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *iconNames;
@property (nonatomic, strong) NSArray *iconSelectedNames;
@end

@implementation MainViewController

+ (void)load {
//    //设置item 普通状态下字体颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
//    //设置item 选中状态下字体颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    [[UITabBar appearance] setShadowImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    //设置背景view
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TAB_BAR_HEIGHT + BOTTOM_BAR_HEIGHT)];
    backView.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance] insertSubview:backView atIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titles = @[@"首页", @"待接订单", @"货源大厅", @"运单列表", @"个人中心"];
    self.iconNames = @[@"home", @"wait_list", @"good_hall", @"transform_list", @"me"];
    self.iconSelectedNames = @[@"home_selected", @"wait_list_selected", @"good_hall_selected", @"transform_list_selected", @"me_selected"];
    
    //添加子控制器
    [self addSubViews];
}

- (void)addSubViews {
    for (int i = 0; i < self.titles.count; i++) {
        ViewController *vc = [[ViewController alloc] init];
        vc.tabBarItem.title = self.titles[i];
        vc.tabBarItem.image = [UIImage imageNamed:self.iconNames[i]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:self.iconSelectedNames[i]];

        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:navi];
    }
}

@end

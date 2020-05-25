//
//  AppDelegate.m
//  Base
//
//  Created by mobile on 2020/5/8.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFeneinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setWindow:[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds]];
    [self.window setRootViewController:[[LoginViewController alloc] init]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

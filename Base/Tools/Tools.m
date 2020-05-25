//
//  Tools.m
//  Base
//
//  Created by mobile on 2020/5/9.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "Tools.h"
#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@implementation Tools

/** iOS系统版本*/
+ (NSUInteger)getDeviceSystemVersion {
    static NSUInteger      _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion =
        [[[[[UIDevice currentDevice] systemVersion]
           componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    return _deviceSystemMajorVersion;
}


/** 从故事版中获取对应的控制器
 storyboardName  故事版文件名
 identifier      对应控制器的标识, 为nil,则是instantiateInitialVC
 */
+ (UIViewController*)vcFromStoryboardWithName:(NSString*)storyboardName identifier:(NSString*)identifier {
    // 跳转登录页面
    NSString* name = storyboardName;
    if (IsEmptyValue(name)) {
        name = @"";
    }
    UIStoryboard     *mStb = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *mVC  = nil;
    
    if (IsEmptyValue(identifier)) {
        mVC  = [mStb instantiateInitialViewController];
    } else {
        mVC  = [mStb instantiateViewControllerWithIdentifier:identifier];
    }
    
    return mVC;
}


/** 全局提示框 */
+ (void)globalTipsVC:(UIViewController *)vc tips:(NSString *)tips {
    UILabel *lable = [[UILabel alloc] initWithFrame:
                      CGRectMake(0, 0, 230, 35)];
    
    lable.backgroundColor     = [UIColor blackColor];
    lable.textColor           = [UIColor whiteColor];
    lable.alpha               = 0;
    lable.textAlignment       = NSTextAlignmentCenter;
    lable.layer.cornerRadius  = 5;
    lable.layer.masksToBounds = YES;
    lable.text                = tips;
    lable.font                = [UIFont systemFontOfSize:14];
    lable.numberOfLines       = 0;
    
    CGFloat height = [tips heightForFont:lable.font width:lable.width];
    height = MAX(height, 35);
    lable.height = height;
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    lable.center = app.window.center;
    
    [app.window addSubview:lable];
    [UIView animateWithDuration:1.0 animations:^{ //动画效果
        lable.alpha = 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             lable.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [lable removeFromSuperview];
                         }];
    }];
}

+ (void)globalTips:(NSString*)tips {
    UILabel *lable = [[UILabel alloc] initWithFrame:
                      CGRectMake(0, 0, 230, 35)];
    
    lable.backgroundColor     = [UIColor blackColor];
    lable.textColor           = [UIColor whiteColor];
    lable.alpha               = 0;
    lable.textAlignment       = NSTextAlignmentCenter;
    lable.layer.cornerRadius  = 5;
    lable.layer.masksToBounds = YES;
    lable.text                = tips;
    lable.font                = [UIFont systemFontOfSize:14];
    lable.numberOfLines       = 0;
    
    CGFloat height = [tips heightForFont:lable.font width:lable.width];
    height = MAX(height, 35);
    lable.height = height;
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    lable.center = app.window.center;
    
    [app.window addSubview:lable];
    [UIView animateWithDuration:1.0 animations:^{ //动画效果
        lable.alpha = 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             lable.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [lable removeFromSuperview];
                         }];
    }];
}

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}

+ (BOOL)isNewVersion {
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = info[@"CFBundleShortVersionString"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *oldVersion = [defaults objectForKey:@"app_version"];
    if ([currentVersion isEqualToString:oldVersion]) {
        return NO;
    } else {
        [defaults setObject:currentVersion forKey:@"app_version"];
        [defaults synchronize];
        return YES;
    }
}


///**忽略版本后,计算更新时间~1周后再次提示*/
//+ (BOOL)ignoreTimeIsDone {
//    NSDate *lastDate = [[CacheManager shareCacheManager]getCacheWithKey:kLastIgnoreTime];
//    if (IsEmptyValue(lastDate)) {
//        lastDate = [NSDate date];
//        [[CacheManager shareCacheManager] saveCacheWithKey:kLastIgnoreTime withObject:lastDate];
//        return YES;
//    }
//    NSDate *currentDate = [NSDate date];
//    if (fabs([currentDate timeIntervalSinceDate:lastDate]) > IgnoreTime) {//间隔一周
//        [[CacheManager shareCacheManager] saveCacheWithKey:kLastIgnoreTime withObject:currentDate];
//        return YES;
//    }
//    return NO;
//}

+ (NSBundle *)localizedBundle {
//
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];

    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];

    NSString * preferredLang = [allLanguages objectAtIndex:0];

    if ([preferredLang containsString:@"zh-Hans"]) {//中文
        preferredLang = @"zh-Hans";
    } else if ([preferredLang containsString:@"ja"]) {//日语
        preferredLang = @"ja";
    } else {//英语
        preferredLang = @"en";
    }

    NSString *path = [[NSBundle mainBundle] pathForResource:preferredLang ofType:@"lproj"];
    //en-CN 英文
    //zh-Hans-CN 中文
    //ja-CN
    NSBundle *mBundle = [NSBundle bundleWithPath:path];
    
    return mBundle;
}

+ (UITabBarController *)getRootTabbarController
{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    UIViewController *tabbarController = window.rootViewController;
    if ([tabbarController isKindOfClass:[UITabBarController class]]) {
        return (UITabBarController *)tabbarController;
    }
    return nil;
}

@end

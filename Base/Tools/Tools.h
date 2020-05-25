//
//  Tools.h
//  Base
//
//  Created by mobile on 2020/5/9.
//  Copyright © 2020 mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const LANGUAGECODEKEY = @"LanguageCode";

typedef NS_ENUM (NSUInteger, LanguageType) {
    XMBLanguageChineseSimplified = 0,
    XMBLanguageJapanese = 1,
    XMBLanguageEnglish = 2,
};

/** 推送是否打开Block */
typedef void(^openNotification)(BOOL isOpenNotification);

@interface Tools : NSObject

/** iOS系统版本*/
+ (NSUInteger)getDeviceSystemVersion;

/** 从故事版中获取对应的控制器
 storyboardName  故事版文件名
 identifier      对应控制器的标识, 为nil,则是instantiateInitialVC
 */
+ (id)vcFromStoryboardWithName:(NSString*)storyboardName identifier:(NSString*)identifier;

/** 全局提示框 */
+ (void)globalTipsVC:(UIViewController*)vc tips:(NSString*)tips;
+ (void)globalTips:(NSString*)tips;
/** 获取当前控制器 */
+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;

/**判断是不是新版本*/
+ (BOOL)isNewVersion;

/** 当前软件是否已打开远程推送 */
+ (void)isOpenedRemoteNotification:(openNotification)isOpen;

/**忽略版本后,计算更新时间~1周后再次提示,返回yes表示需要弹出提示*/
+ (BOOL)ignoreTimeIsDone;

/**获取当前语言环境*/
+ (NSBundle *)localizedBundle;

/** 获取当前根控制器 */
+ (UITabBarController *)getRootTabbarController;

@end

NS_ASSUME_NONNULL_END

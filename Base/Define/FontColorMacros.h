//
//  FontColorMacros.h
//  Base
//
//  Created by 杨健 on 2020/5/25.
//  Copyright © 2020 mobile. All rights reserved.
//

#ifndef FontColorMacros_h
#define FontColorMacros_h

/** naviBar默认字体 */
#define XBM_NAVIBAR_TITLEFONT XBMBoldFont(17)
/** 主题色 */
#define XBMMainColor [UIColor colorWithHexString:@"#FFC11B"]
#define XBMTitleColor [UIColor colorWithHexString:@"#5B3600"]
/** 主题背景色 */
#define XBMBackgroundColor [UIColor colorWithHexString:@"#F9F9F9"]
/** 普通字体 */
#define XBMFont(f) [UIFont fontWithName:@"PingFangSC-Regular" size:f]
#define XBMBoldFont(f) [UIFont fontWithName:@"PingFangSC-Medium" size:f]
#define XBMPriceFont(f) [UIFont fontWithName:@"DINCondensed-Bold" size:f]
/** 主题色 */
/** RGBA颜色 */
#define XBMColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
/** 随机色 */
#define XBMRandomColor XBMColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
/** 常用颜色 */
#define XBM_COLOR_Black  [UIColor colorWithHexString:@"#333333"]
#define XBM_COLOR_E6   [UIColor colorWithHexString:@"#E6E6E6"]
#define XBM_COLOR_F9   [UIColor colorWithHexString:@"#F9F9F9"]
#define XBM_COLOR_5    [UIColor colorWithHexString:@"#555555"]
#define XBM_COLOR_6    [UIColor colorWithHexString:@"#666666"]
#define XBM_COLOR_9    [UIColor colorWithHexString:@"#999999"]
#endif /* FontColorMacros_h */

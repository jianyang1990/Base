//
//  CommonMacros.h
//  Base
//
//  Created by 杨健 on 2020/5/25.
//  Copyright © 2020 mobile. All rights reserved.
//

#ifndef CommonMacros_h
#define CommonMacros_h

#import <UIKit/UIKit.h>

// 空值判断
static inline BOOL IsEmptyValue(id thing) {
    return thing == nil
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0)
    ||  ([thing isKindOfClass:[NSNull class]]);
}

/** 对字符串的特殊处理,如果为空,则统一返回@"",否则原形 */
static inline NSString* checkValue (NSString* value) {
    if (IsEmptyValue(value)) {
        return @"";
    }
    return value;
}

/** 对字符串的特殊处理,如果为空,则统一返回@"0",否则原形 */
static inline NSString* checkValueZero (NSString* value) {
    if (IsEmptyValue(value)) {
        return @"0";
    }
    return value;
}

/** 对字符串的特殊处理,如果为空,则统一返回nil,否则原形 */
static inline NSString* checkValueNil (NSString* value) {
    if (IsEmptyValue(value)) {
        return nil;
    }
    return value;
}

static inline NSString* changeFenToYuan (NSString* fen) {
    if (IsEmptyValue(fen)) {
        return @"0.00";
    }
    int money = [fen intValue];
    return XBMStr(@"%.2lf",money * 0.01);
}

static inline NSString* changeYuanToFen (NSString* yuan) {
    if (IsEmptyValue(yuan)) {
        return @"0";
    }
    float money = [yuan floatValue];
    return XBMStr(@"%d",(int)(money * 100));
}

static inline NSString* changeGToKg (NSString* g) {
    if (IsEmptyValue(g)) {
        return @"0";
    }
    int weight = [g intValue];
    return XBMStr(@"%.1f",weight * 0.001);
}

#endif /* CommonMacros_h */

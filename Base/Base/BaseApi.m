//
//  BaseApi.m
//  Base
//
//  Created by mobile on 2020/5/8.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "BaseApi.h"

@implementation BaseApi

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (NSString *)baseUrl {
    if (DEBUG) {
        NSLog(@"当前环境为DEBUG模式");
        return @"http://192.168.1.171:8084/mo/action/";
    }else {
        NSLog(@"当前环境为RELEASE模式");
        return @"https://www.56brain.com:8084/mo/action/";
    }
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (YTKResponseSerializerType)responseSerializerType {
    return YTKResponseSerializerTypeJSON;
}

- (id)requestArgument {
    return self.requestArgument;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    if (token.length > 0) {
        return @{@"token":token};
    }
    return nil;
}
@end

//
//  LoginApi.m
//  Base
//
//  Created by mobile on 2020/5/20.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "LoginApi.h"
#import "User.h"

@interface LoginApi ()

@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *password;

@end

@implementation LoginApi

- (instancetype)initWithPhone:(NSString *)phone AndPassword:(NSString *)password {
    if (self = [super init]) {
        self.phone = phone;
        self.password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"api/";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{@"api":@"sys/login",@"phone":self.phone,@"passWord":self.password,@"loginEntrance": @"2", @"userType": @"3",@"loginType": @"0"};
}

- (void *)saveUserInfo {
    NSLog(@"用户信息;%@",self.responseObject);
    NSNumber *code = [self.responseObject valueForKey:@"code"];
    if (self.responseStatusCode == 200 && code.intValue == 200) {
        NSDictionary *dic = [self.responseObject valueForKey:@"data"];
        User *user = [User modelWithDictionary:dic];
//        [[NSUserDefaults standardUserDefaults] setValue:user forKey:@"user"];
        [[NSUserDefaults standardUserDefaults] setValue:user.token forKey:@"token"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return nil;
}

@end

//
//  LoginApi.h
//  Base
//
//  Created by mobile on 2020/5/20.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "BaseApi.h"

NS_ASSUME_NONNULL_BEGIN

@class User;
@interface LoginApi : BaseApi

//登陆账号密码
- (instancetype)initWithPhone:(NSString *)phone AndPassword:(NSString *)password;
- (void *)saveUserInfo;

@end

NS_ASSUME_NONNULL_END

//
//  User.h
//  Base
//
//  Created by mobile on 2020/5/20.
//  Copyright © 2020 mobile. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : BaseModel

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, assign) NSInteger userType;

@end

NS_ASSUME_NONNULL_END

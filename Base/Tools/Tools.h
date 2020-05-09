//
//  Tools.h
//  Base
//
//  Created by mobile on 2020/5/9.
//  Copyright © 2020 mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_INLINE UIFont *UIFontWithSize(CGFloat size) {
  return [UIFont systemFontOfSize:size];
}

NS_INLINE UIFont *UIFontBoldWithSize(CGFloat size){
    return [UIFont boldSystemFontOfSize:size];
}

NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject

@end

NS_ASSUME_NONNULL_END

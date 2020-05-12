//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property (nonatomic, assign, readwrite) CGFloat originX;
@property (nonatomic, assign, readonly) CGFloat rightX;
@property (nonatomic, assign, readwrite) CGFloat originY;
@property (nonatomic, assign, readonly) CGFloat bottomY;
@property (nonatomic, assign, readwrite) CGFloat centerX;
@property (nonatomic, assign, readwrite) CGFloat centerY;
@property (nonatomic, assign, readwrite) CGFloat width;
@property (nonatomic, assign, readwrite) CGFloat height;
@property (nonatomic, assign, readwrite) CGSize size;

//把View加在Window上
- (void)addToWindow;

@end

@interface UIView (Screenshot)

//View截图
- (UIImage*)screenshot;

//ScrollView截图 contentOffset
- (UIImage*)screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;

//View按Rect截图
- (UIImage*)screenshotInFrame:(CGRect)frame;

//整个view转成图片
- (UIImage*)convertToImage;
@end

@interface UIView (Animation)

//左右抖动动画
- (void)shakeAnimation;

//旋转180度
- (void)trans180DegreeAnimation;

@end


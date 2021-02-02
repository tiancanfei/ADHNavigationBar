//
//  UIViewController+ADHNavigationBar.h
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ADHNavigationBar)

/// 状态栏状态
@property (nonatomic, assign) UIStatusBarStyle adhnavigationbar_statusBarStyle;

/// 方法实现交换
/// @param originSEL 原方法实现
/// @param swizzledSEL 新的方法实现
+ (void) adhnavigationbar_exchangeImplementationsWithOriginMethod:(SEL)originSEL
                                                  swizzledMethod:(SEL)swizzledSEL;

@end

NS_ASSUME_NONNULL_END

//
//  UIViewController+ADHNavigationBar.m
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import "UIViewController+ADHNavigationBar.h"
#import <objc/runtime.h>

static const char adhnavigationbar_statusBarStyleKey;

@implementation UIViewController (ADHNavigationBar)

+ (void)load {
    [self adhnavigationbar_exchangeImplementationsWithOriginMethod:@selector(preferredStatusBarStyle) swizzledMethod:@selector(adhnavigationbar_preferredStatusBarStyle)];
}

#pragma mark - 自定义方法

/// 方法实现交换
/// @param originSEL 原方法实现
/// @param swizzledSEL 新的方法实现
+ (void) adhnavigationbar_exchangeImplementationsWithOriginMethod:(SEL)originSEL
                                                  swizzledMethod:(SEL)swizzledSEL{
    Method originMethod = class_getInstanceMethod(self, originSEL);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSEL);
    method_exchangeImplementations(originMethod, swizzledMethod);
}

/// 重新实现preferredStatusBarStyle
- (UIStatusBarStyle)adhnavigationbar_preferredStatusBarStyle {
    return self.adhnavigationbar_statusBarStyle;
}

#pragma mark - setters getters

- (void)setAdhnavigationbar_statusBarStyle:(UIStatusBarStyle)adhnavigationbar_statusBarStyle {
    objc_setAssociatedObject(self, &adhnavigationbar_statusBarStyleKey, @(adhnavigationbar_statusBarStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)adhnavigationbar_statusBarStyle {
    return (UIStatusBarStyle)[objc_getAssociatedObject(self, &adhnavigationbar_statusBarStyleKey) integerValue];
}


@end

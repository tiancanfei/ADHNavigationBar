//
//  UINavigationController+ADHNavigationBar.m
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import "UINavigationController+ADHNavigationBar.h"
#import "UIViewController+ADHNavigationBar.h"

@implementation UINavigationController (ADHNavigationBar)

+ (void)load {
    [self adhnavigationbar_exchangeImplementationsWithOriginMethod:@selector(preferredStatusBarStyle) swizzledMethod:@selector(adhnavigationbar_preferredStatusBarStyle)];
}

- (UIStatusBarStyle)adhnavigationbar_preferredStatusBarStyle {
    return [self.topViewController preferredStatusBarStyle];
}

@end

//
//  ADHNavigationBarUtil.m
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import "ADHNavigationBarUtil.h"

@implementation ADHNavigationBarUtil

+ (CGFloat) adhnavigationbar_statusBarHight {
   CGFloat statusBarHeight = 0;
   if (@available(iOS 13.0, *)) {
       UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
       statusBarHeight = statusBarManager.statusBarFrame.size.height;
   }
   else {
       statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
   }
   return statusBarHeight;
}

@end

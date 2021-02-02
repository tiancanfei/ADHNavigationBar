//
//  UIButton+ADHNavigationBar.h
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ADHNavigationBar)

- (void)adhnavigationbar_addActionBlock:(void(^)(void))actionBlock
                       forControlEvents:(UIControlEvents)controlEvents;

- (void)adhnavigationbar_addActionBlock:(void(^)(void))actionBlock;

@end

NS_ASSUME_NONNULL_END

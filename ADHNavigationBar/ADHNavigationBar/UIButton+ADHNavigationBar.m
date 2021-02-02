//
//  UIButton+ADHNavigationBar.m
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import "UIButton+ADHNavigationBar.h"
#import <objc/runtime.h>

static const char adhnavigationbar_actionBlockKey;

@interface UIButton()

@property (nonatomic, copy, nullable) void(^adhnavigationbar_actionBlock)(void);

@end

@implementation UIButton (ADHNavigationBar)

#pragma mark - 自定义方法

- (void)adhnavigationbar_addActionBlock:(void(^)(void))actionBlock
                      forControlEvents:(UIControlEvents)controlEvents {
    self.adhnavigationbar_actionBlock = actionBlock;
    [self addTarget:self action:@selector(adhnavigationbar_action) forControlEvents:controlEvents];
}

- (void)adhnavigationbar_addActionBlock:(void(^)(void))actionBlock {
    [self adhnavigationbar_addActionBlock:actionBlock forControlEvents:UIControlEventTouchUpInside];
}

- (void) adhnavigationbar_action {
    if (self.adhnavigationbar_actionBlock) {
        self.adhnavigationbar_actionBlock();
    }
}

#pragma mark - setters getters

- (void)setAdhnavigationbar_actionBlock:(void (^)(void))adhnavigationbar_actionBlock {
    objc_setAssociatedObject(self, &adhnavigationbar_actionBlockKey, adhnavigationbar_actionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(void))adhnavigationbar_actionBlock {
    return objc_getAssociatedObject(self, &adhnavigationbar_actionBlockKey);
}

@end


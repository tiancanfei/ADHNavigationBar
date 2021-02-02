//
//  ADHNavigationBar.h
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import <UIKit/UIKit.h>
#import "UIButton+ADHNavigationBar.h"
#import "ADHNavigationBarConfig.h"
#import "UINavigationController+ADHNavigationBar.h"
#import "UIViewController+ADHNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface ADHNavigationBar : UIView

/// 返回按钮
@property (nonatomic, strong, readonly) UIButton *backButton;

/// 标题
@property (nonatomic, strong, readonly) UILabel *titleLabel;

/// 配置
@property (nonatomic, strong) ADHNavigationBarConfig *config;

#pragma mark 替换导航栏返回按钮
/// 替换导航栏返回按钮
/// @param backButton 返回按钮
- (void) replaceBackButton:(UIButton *)backButton;

#pragma mark 替换导航栏返回按钮
/// 替换导航栏返回按钮
/// @param backButton 返回按钮
/// @param actionBlock 按钮事件
/// @param controlEvents 事件类型
- (void) replaceBackButton:(UIButton *)backButton
               actionBlock:(void(^_Nullable)(void))actionBlock
          forControlEvents:(UIControlEvents)controlEvents;

#pragma mark 添加导航栏左侧按钮
/// 添加导航栏左侧按钮
/// @param leftButton 左侧按钮
/// @param actionBlock 按钮事件
/// @param controlEvents 事件类型
- (void) addLeftButton:(UIButton *)leftButton
           actionBlock:(void(^_Nullable)(void))actionBlock
      forControlEvents:(UIControlEvents)controlEvents;

#pragma mark 添加导航栏右侧按钮
/// 添加导航栏右侧按钮
/// @param rightButton 右侧按钮
/// @param actionBlock 按钮事件
/// @param controlEvents 事件类型
- (void) addRightButton:(UIButton *)rightButton
            actionBlock:(void(^_Nullable)(void))actionBlock
       forControlEvents:(UIControlEvents)controlEvents;

/// 创建导航栏
/// @param style 样式
/// @param controller 控制器
+ (instancetype) navigationBarWithStyle:(ADHNavigationBarStyle) style controller:(UIViewController *)controller;

#pragma mark 刷新配置
/// 刷新配置
- (void) refreshConfigs;

#pragma mark 刷新布局
/// 刷新布局
- (void) rerfeshLayout;

@end

NS_ASSUME_NONNULL_END

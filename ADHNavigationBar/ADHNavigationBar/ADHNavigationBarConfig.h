//
//  ADHNavigationBarConfig.h
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import <UIKit/UIKit.h>
#import "ADHNavigationBarUtil.h"
#import "UIViewController+ADHNavigationBar.h"

#define kADHNStatusBarHeight [ADHNavigationBarUtil adhnavigationbar_statusBarHight]
#define kADHNNavigationBarHeight 44
#define kADHNHeight (kADHNStatusBarHeight + kADHNNavigationBarHeight)
#define kADHNWidth ([UIScreen mainScreen].bounds.size.width)
#define kADHNDefaultMinWidthOfTitleLabel 100
#define kADHNDefaultMarginHorizontal 0

#define kADHNDefaultWidthOfButton 40
#define kADHNDefaultHeightOfButton 40

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    /// 白色文字，状态栏
    ADHNavigationBarStyleWhite = 1,
    /// 黑色色文字，状态栏
    ADHNavigationBarStyleBlack,
} ADHNavigationBarStyle;

@interface ADHNavigationBarConfig : NSObject

/// 是否自动隐藏（默认会自动隐藏，但不影响侧滑）
@property (nonatomic, assign) BOOL isHideNavigationBarAuto;

/// 返回按钮尺寸
@property (nonatomic, assign) CGSize sizeOfBackButton;

/// 返回按钮图片
@property (nonatomic, strong) UIImage *backButtonImage;

/// 是否标题必须居中（默认居中）
@property (nonatomic, assign) BOOL isTitleMustCenter;

/// 导航栏左侧留白
@property (nonatomic, assign) CGFloat marginOfLeft;

/// 导航栏右侧留白
@property (nonatomic, assign) CGFloat marginOfRight;

/// 标题的最小长度默认 kADHNDefaultMinWidthOfTitleLabel
@property (nonatomic, assign) CGFloat minWidthOfTitleLabel;

/// 导航栏默认高度（导航栏高度+状态栏高度 kADHNHeight，可以自定义，但是必须大于默认高度）
@property (nonatomic, assign) CGFloat heightOfNavigationBar;

/// 标题字体（默认16号字体）
@property (nonatomic, strong) UIFont *titleFont;

/// 标题颜色（默认黑色）
@property (nonatomic, strong) UIColor *titleTextColor;

/// 背景色（默认白色）
@property (nonatomic, strong) UIColor *backgroundColorOfNavigationBar;

/// 标题对齐方式（默认是中心对齐）
@property (nonatomic, assign) NSTextAlignment titleTextAlignment;

/// 是否自动缩小字体（默认自动缩小）
@property (nonatomic, assign) BOOL titleAdjustsFontSizeToFitWidth;

/// 状态栏样式
@property (nonatomic, assign) ADHNavigationBarStyle style;

/// 是否显示返回按钮 （默认显示）
@property (nonatomic, assign) BOOL isShowBackButton;

/// 状态栏样式
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/// 控制器
@property (nonatomic, weak) UIViewController *controller;

#pragma mark 刷新状态栏
/// 刷新状态栏
- (void) refreshStatusBarStyle;

/// 创建配置
/// @param style 样式
/// @param controller 控制器
+ (instancetype) configWithStyle:(ADHNavigationBarStyle)style
                      controller:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END

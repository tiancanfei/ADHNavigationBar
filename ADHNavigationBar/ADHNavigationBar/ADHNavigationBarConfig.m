//
//  ADHNavigationBarConfig.m
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import "ADHNavigationBarConfig.h"

@implementation ADHNavigationBarConfig

/// 创建配置
/// @param style 样式
/// @param controller 控制器
+ (instancetype) configWithStyle:(ADHNavigationBarStyle) style
                      controller:(UIViewController *)controller {
    ADHNavigationBarConfig *config = [[ADHNavigationBarConfig alloc] init];
    config.isHideNavigationBarAuto = YES;
    config.minWidthOfTitleLabel = kADHNDefaultMinWidthOfTitleLabel;
    config.heightOfNavigationBar = kADHNHeight;
    config.marginOfLeft = kADHNDefaultMarginHorizontal;
    config.marginOfRight = kADHNDefaultMarginHorizontal;
    config.isTitleMustCenter = YES;
    config.sizeOfBackButton = CGSizeMake(kADHNDefaultWidthOfButton, kADHNDefaultHeightOfButton);
    config.titleFont = [UIFont systemFontOfSize:16];
    config.titleTextColor = [UIColor blackColor];
    config.titleTextAlignment = NSTextAlignmentCenter;
    config.titleAdjustsFontSizeToFitWidth = YES;
    config.backgroundColorOfNavigationBar = [UIColor whiteColor];
    config.isShowBackButton = YES;
    config.controller = controller;
    config.style = style;
    
    return config;
}

- (void)setHeightOfNavigationBar:(CGFloat)heightOfNavigationBar {
    _heightOfNavigationBar = heightOfNavigationBar >= kADHNHeight ? heightOfNavigationBar : kADHNHeight;
}

- (void)setStyle:(ADHNavigationBarStyle)style {
    _style = style;
    if (ADHNavigationBarStyleWhite == _style) {
        self.statusBarStyle = UIStatusBarStyleLightContent;
        self.titleTextColor = [UIColor whiteColor];
        self.backgroundColorOfNavigationBar = [UIColor redColor];
        self.backButtonImage = [UIImage imageNamed:@"ADHNavigationBar.bundle/navigation_back_white@2x.png"];
    }
    
    if (ADHNavigationBarStyleBlack == _style) {
        if (@available(iOS 13.0, *)) {
            self.statusBarStyle = UIStatusBarStyleDarkContent;
        } else {
            self.statusBarStyle = UIStatusBarStyleDefault;
        }
        self.titleTextColor = [UIColor blackColor];
        self.backgroundColorOfNavigationBar = [UIColor whiteColor];
        self.backButtonImage = [UIImage imageNamed:@"ADHNavigationBar.bundle/navigation_back_black@2x.png"];
    }
}


#pragma mark 刷新状态栏
/// 刷新状态栏
- (void) refreshStatusBarStyle {
    self.controller.adhnavigationbar_statusBarStyle = self.statusBarStyle;
    self.controller.navigationController.navigationBar.hidden = self.isHideNavigationBarAuto;
}


@end

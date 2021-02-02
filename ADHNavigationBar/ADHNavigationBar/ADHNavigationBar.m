//
//  ADHNavigationBar.m
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import "ADHNavigationBar.h"

@interface ADHNavigationBar()

@property (nonatomic, strong) NSArray *leftButtons;

@property (nonatomic, strong) NSArray *rightButtons;

@end

@implementation ADHNavigationBar
{
    /// 返回按钮
   UIButton *_backButton;
    /// 标题
    UILabel *_titleLabel;
}

/// 创建配置
/// @param style 样式
/// @param controller 控制器
+ (instancetype) navigationBarWithStyle:(ADHNavigationBarStyle) style
                             controller:(UIViewController *)controller {
    ADHNavigationBar *navigationBar = [[ADHNavigationBar alloc] initWithFrame:CGRectMake(0, 0, kADHNWidth, kADHNHeight)];
    navigationBar.config = [ADHNavigationBarConfig configWithStyle:style controller:controller];
    [navigationBar refreshConfigs];
    return navigationBar;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setUp];
    }
    return self;
}

#pragma mark - 自定义方法

#pragma mark 初始化
/// 初始化
- (void) setUp {
    [self addLeftButton:self.backButton actionBlock:nil forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.titleLabel];
}

#pragma mark 添加导航栏左侧按钮
/// 添加导航栏左侧按钮
/// @param leftButton 左侧按钮
/// @param actionBlock 按钮事件
/// @param controlEvents 事件类型
- (void) addLeftButton:(UIButton *)leftButton
           actionBlock:(void(^)(void))actionBlock
      forControlEvents:(UIControlEvents)controlEvents {
    [self addButton:leftButton inLeftButtons:YES actionBlock:actionBlock forControlEvents:controlEvents];
}

#pragma mark 替换导航栏返回按钮
/// 替换导航栏返回按钮
/// @param backButton 返回按钮
- (void) replaceBackButton:(UIButton *)backButton {
    [self replaceBackButton:backButton actionBlock:nil forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 替换导航栏返回按钮
/// 替换导航栏返回按钮
/// @param backButton 返回按钮
/// @param actionBlock 按钮事件
/// @param controlEvents 事件类型
- (void) replaceBackButton:(UIButton *)backButton
               actionBlock:(void(^)(void))actionBlock
          forControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *leftButtons = [NSMutableArray array];
    [leftButtons addObjectsFromArray:self.leftButtons];
    [leftButtons removeObject:self.backButton];
    self.leftButtons = leftButtons;
    
    [self.backButton removeFromSuperview];
    _backButton = backButton;
    
    [self addButton:backButton inLeftButtons:YES actionBlock:actionBlock forControlEvents:controlEvents];
}

#pragma mark 添加导航栏右侧按钮
/// 添加导航栏右侧按钮
/// @param rightButton 右侧按钮
/// @param actionBlock 按钮事件
/// @param controlEvents 事件类型
- (void) addRightButton:(UIButton *)rightButton
            actionBlock:(void(^)(void))actionBlock
       forControlEvents:(UIControlEvents)controlEvents {
    [self addButton:rightButton inLeftButtons:NO actionBlock:actionBlock forControlEvents:controlEvents];
}

#pragma mark 添加导航栏按钮
/// 添加导航栏按钮
/// @param button 按钮
/// @param actionBlock 按钮事件
/// @param inLeftButtons 是否是左侧按钮
/// @param controlEvents 事件类型
- (void) addButton:(UIButton *)button
         inLeftButtons:(BOOL)inLeftButtons
           actionBlock:(void(^)(void))actionBlock
      forControlEvents:(UIControlEvents)controlEvents {
    __block CGFloat widthOfLeftButtons = 0;
    __block CGFloat widthOfRightButtons = 0;
    CGFloat widthOftitleLabel = 0;
    [self.leftButtons enumerateObjectsUsingBlock:^(UIButton *leftButton, NSUInteger idx, BOOL * _Nonnull stop) {
        widthOfLeftButtons = widthOfLeftButtons + leftButton.frame.size.width;
    }];
    
    [self.rightButtons enumerateObjectsUsingBlock:^(UIButton *rightButton, NSUInteger idx, BOOL * _Nonnull stop) {
        widthOfRightButtons = widthOfRightButtons + rightButton.frame.size.width;
    }];
    
    widthOftitleLabel = kADHNWidth - widthOfLeftButtons - widthOfRightButtons - button.bounds.size.width;
    
    if (widthOftitleLabel >= self.config.minWidthOfTitleLabel) {
        NSMutableArray *buttons = [NSMutableArray array];
        [buttons addObjectsFromArray:inLeftButtons ? self.leftButtons : self.rightButtons];
        [buttons addObject:button];
        [button adhnavigationbar_addActionBlock:actionBlock forControlEvents:controlEvents];
        [self addSubview:button];
        
        if (inLeftButtons) {
            self.leftButtons = buttons;
        } else {
            self.rightButtons = buttons;
        }
    }
    
    [self rerfeshLayout];
}

#pragma mark 刷新配置
/// 刷新配置
- (void) refreshConfigs {
    [self.backButton setImage:self.config.backButtonImage forState:UIControlStateNormal];
    [self.backButton setImage:self.config.backButtonImage forState:UIControlStateSelected];
    [self.backButton setImage:self.config.backButtonImage forState:UIControlStateHighlighted];
    [self.backButton setImage:self.config.backButtonImage forState:UIControlStateDisabled];
    self.backButton.hidden = !self.config.isShowBackButton;
    
    self.titleLabel.font = self.config.titleFont ? self.config.titleFont : self.titleLabel.font;
    self.titleLabel.textColor = self.config.titleTextColor ? self.config.titleTextColor : self.titleLabel.textColor;
    self.titleLabel.textAlignment = self.config.titleTextAlignment ? self.config.titleTextAlignment : self.titleLabel.textAlignment;
    self.titleLabel.adjustsFontSizeToFitWidth = self.config.titleAdjustsFontSizeToFitWidth ? self.config.titleAdjustsFontSizeToFitWidth : self.titleLabel.adjustsFontSizeToFitWidth;
    self.backgroundColor = self.config.backgroundColorOfNavigationBar ? self.config.backgroundColorOfNavigationBar : self.backgroundColor;
    
    [self.config refreshStatusBarStyle];
    
    [self rerfeshLayout];
}

#pragma mark 刷新布局
/// 刷新布局
- (void) rerfeshLayout {
    CGFloat y = kADHNStatusBarHeight;
    CGFloat h = kADHNNavigationBarHeight;
    CGFloat widthOfContent = kADHNWidth - self.config.marginOfLeft - self.config.marginOfRight;
    __block CGFloat leftButtonX = self.config.marginOfLeft;
    __block CGFloat titleLabelX = self.config.marginOfLeft;
    __block CGFloat rightButtonX = widthOfContent - self.config.marginOfRight;
    __block CGFloat widthOfLeftButtons = 0;
    __block CGFloat widthOfRightButtons = 0;
    CGFloat titleLabelW = 0;
    [self.leftButtons enumerateObjectsUsingBlock:^(UIButton *leftButton, NSUInteger idx, BOOL * _Nonnull stop) {
        CGSize leftButtonSize = leftButton.frame.size;
        leftButtonSize = leftButtonSize.width == 0 ? self.config.sizeOfBackButton : leftButtonSize;
        leftButton.frame = CGRectMake(leftButtonX, y, leftButtonSize.width, h);
        leftButtonX = CGRectGetMaxX(leftButton.frame);
        titleLabelX = titleLabelX + leftButton.frame.size.width;
        widthOfLeftButtons = widthOfLeftButtons + leftButton.frame.size.width;
    }];
    
    [self.rightButtons enumerateObjectsUsingBlock:^(UIButton *rightButton, NSUInteger idx, BOOL * _Nonnull stop) {
        rightButtonX = rightButtonX - rightButton.frame.size.width;
        rightButton.frame = CGRectMake(rightButtonX, y, rightButton.frame.size.width, h);
        widthOfRightButtons = widthOfRightButtons + rightButton.frame.size.width;
    }];
    
    titleLabelW = widthOfContent - widthOfLeftButtons - widthOfRightButtons;
    
    if (self.config.isTitleMustCenter) {
        CGFloat maxWidthOfButtons = widthOfLeftButtons > widthOfRightButtons ? widthOfLeftButtons : widthOfRightButtons;
        widthOfLeftButtons = maxWidthOfButtons;
        widthOfRightButtons = maxWidthOfButtons;
        titleLabelW = widthOfContent - widthOfLeftButtons - widthOfRightButtons;
        titleLabelX = self.config.marginOfLeft + widthOfLeftButtons;
    }
    
    self.titleLabel.frame = CGRectMake(titleLabelX, y, titleLabelW, h);
}

#pragma - mark setters getters

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    }
    return _titleLabel;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
    }
    return _backButton;
}



@end

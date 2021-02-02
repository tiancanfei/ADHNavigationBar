//
//  ViewController.m
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import "ViewController.h"
#import "ADHNavigationBar.h"
#import "WhiteViewController.h"

@interface ViewController ()

@property (nonatomic, strong) ADHNavigationBar *customNavigationBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.customNavigationBar];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    WhiteViewController *vc = [[WhiteViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (ADHNavigationBar *)customNavigationBar {
    if (!_customNavigationBar) {
        _customNavigationBar = [ADHNavigationBar navigationBarWithStyle:ADHNavigationBarStyleBlack controller:self];
        _customNavigationBar.config.backgroundColorOfNavigationBar = [UIColor redColor];
        _customNavigationBar.config.isShowBackButton = NO;
        [_customNavigationBar refreshConfigs];
        _customNavigationBar.titleLabel.text = @"黑色状态栏";
        __weak typeof(self) weakSelf = self;
        [_customNavigationBar.backButton adhnavigationbar_addActionBlock:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _customNavigationBar;
}


@end

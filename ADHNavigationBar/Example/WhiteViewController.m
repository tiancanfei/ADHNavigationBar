//
//  WhiteViewController.m
//  ADHNavigationBar
//
//  Created by ade on 2021/2/2.
//

#import "WhiteViewController.h"
#import "ADHNavigationBar.h"

@interface WhiteViewController ()

@property (nonatomic, strong) ADHNavigationBar *customNavigationBar;

@end

@implementation WhiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.customNavigationBar];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (ADHNavigationBar *)customNavigationBar {
    if (!_customNavigationBar) {
        _customNavigationBar = [ADHNavigationBar navigationBarWithStyle:ADHNavigationBarStyleWhite controller:self];
        _customNavigationBar.config.backgroundColorOfNavigationBar = [UIColor redColor];
        [_customNavigationBar refreshConfigs];
        _customNavigationBar.titleLabel.text = @"白色状态栏";
        __weak typeof(self) weakSelf = self;
        [_customNavigationBar.backButton adhnavigationbar_addActionBlock:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _customNavigationBar;
}

@end

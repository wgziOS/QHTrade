//
//  TabBarBaseController.m
//  RDFuturesApp
//
//  Created by user on 17/2/28.
//  Copyright © 2017年 FuturesApp. All rights reserved.
//

#import "TabBarBaseController.h"
#import "NavigationBaseController.h"
#import "DynamicsViewController.h"
#import "PersonalViewController.h"
#import "DiscoverViewController.h"
#import "QHTabBar.h"


@interface TabBarBaseController ()
@property(nonatomic,assign)int oldIndex;
@end

@implementation TabBarBaseController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    [self setValue:[[QHTabBar alloc] init] forKeyPath:@"tabBar"];
    
   
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSDictionary *attrs =@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGB(127, 127, 127),};

    
    NSDictionary *selectedAttrs = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGB(197, 160, 101)};
    
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
//
    [self setupChildVc:[[DiscoverViewController alloc] init] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_select"];
    // 添加子控制器
    [self setupChildVc:[[DynamicsViewController alloc] init] title:@"交易" image:@"tabar_dynamic" selectedImage:@"tabar_dynamic_select"];
    // 添加子控制器
    [self setupChildVc:[[PersonalViewController alloc] init] title:@"个人中心" image:@"tabbar_personal" selectedImage:@"tabbar_personal_select"];


    
}

- (UINavigationController *)yq_navigationController {
    return self.selectedViewController;
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    NavigationBaseController *nav = [[NavigationBaseController alloc] initWithRootViewController:vc];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"icon_navigationbar_backgroundImage"] forBarMetrics:UIBarMetricsDefault];
    
    
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                NSFontAttributeName:[UIFont boldSystemFontOfSize:18]
                                                }];
    [self addChildViewController:nav];
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

}

@end

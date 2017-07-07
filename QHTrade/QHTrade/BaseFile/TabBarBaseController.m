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
#import "AwesomeViewController.h"
#import "HomeViewController.h"
#import "GroupViewController.h"
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
    NSDictionary *attrs =@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGB(153, 153, 153),};

    
    NSDictionary *selectedAttrs = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGB(255, 98, 1)};
    
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    /*
     * 添加子导航栏控制器
     */
    [self setupChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_select"];
    
    [self setupChildVc:[[AwesomeViewController alloc] init] title:@"牛人" image:@"tabbar_talent" selectedImage:@"tabbar_talent_select"];
    
    [self setupChildVc:[[GroupViewController alloc] init] title:@"圈子" image:@"tabbar_circle" selectedImage:@"tabbar_circle_select"];
    
//    [self setupChildVc:[[DynamicsViewController alloc] init] title:@"交易" image:@"tabbar_circle" selectedImage:@"tabbar_circle_select"];
 
    [self setupChildVc:[[PersonalViewController alloc] init] title:@"个人中心" image:@"tabbar_person" selectedImage:@"tabbar_person_select"];


    
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
    
//    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_image"] forBarMetrics:UIBarMetricsDefault];
    nav.navigationBar.barTintColor = [UIColor whiteColor];
    
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(51, 51, 51),
                                                NSFontAttributeName:[UIFont boldSystemFontOfSize:18]
                                                }];
//    nav.navigationItem.rightBarButtonItem.customView = self.messageItems;

    [self addChildViewController:nav];
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

}

@end

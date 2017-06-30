//
//  NavigationBaseController.m
//  RDFuturesApp
//
//  Created by user on 17/2/28.
//  Copyright © 2017年 FuturesApp. All rights reserved.
//

#import "NavigationBaseController.h"

@interface NavigationBaseController ()

@end

@implementation NavigationBaseController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.colors = @[(__bridge id)RGB(202, 165, 108).CGColor, (__bridge id)RGB(173, 130, 66).CGColor];
//    gradientLayer.locations = @[@0.1, @1.0];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//    gradientLayer.frame = CGRectMake(0, -20, SCREEN_WIDTH, 64);
//    [self.navigationBar.layer addSublayer:gradientLayer];
    

}


/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
//                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
////                [button setTitle:@"返回" forState:UIControlStateNormal];
//                [button setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
//                [button setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateHighlighted];
////                button.frame.size = CGSizeMake(70, 30);
//        
//                button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        
//                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
////                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
////                [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//                [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//                viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
                // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

@end

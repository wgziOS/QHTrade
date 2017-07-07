//
//  ViewBaseController.m
//  RDFuturesApp
//
//  Created by user on 17/2/28.
//  Copyright © 2017年 FuturesApp. All rights reserved.
//

#import "ViewBaseController.h"


@interface ViewBaseController ()
@property(nonatomic,strong)UIBarButtonItem *messageItems;
@end

@implementation ViewBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNavigationBar];
    

    self.view.backgroundColor= DEFAULT_BG_COLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



- (void) setUpNavigationBar
{
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationItem.leftBarButtonItem = [self leftButton];//设置导航栏左边按钮
    self.navigationItem.rightBarButtonItem = self.navigationController.childViewControllers.count>1? [self rightButton]:self.messageItems;//设置导航栏右边按钮
    self.navigationItem.titleView = [self centerView];//设置titel
    if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.colors = @[(__bridge id)RGB(202, 165, 108).CGColor, (__bridge id)RGB(173, 130, 66).CGColor];
//    gradientLayer.locations = @[@0.1, @1.0];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//    gradientLayer.frame = CGRectMake(0, -20, SCREEN_WIDTH, 64);
//    [self.navigationController.navigationBar.layer addSublayer:gradientLayer];
    
}

- (UIBarButtonItem *)leftButton
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [btn setImage:[UIImage imageNamed:@"navigation_back_icon"] forState:UIControlStateNormal];//设置左边按钮的图片
    [btn addTarget:self action:@selector(actionOnTouchBackButton:) forControlEvents:UIControlEventTouchUpInside];//设置按钮的点击事件
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

- (UIBarButtonItem *)rightButton
{
    return nil;
}

- (UIView *)centerView
{
    return nil;
}

- (void)actionOnTouchBackButton:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)hideTabbar:(BOOL)hidden
{
    self.tabBarController.tabBar.hidden = hidden;//隐藏导航栏
}
-(void)gotoGoshopViewController{
    
}
-(void)gotoStoreViewController{
    
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    ViewBaseController *vc = [super allocWithZone:zone];
    @weakify(vc);
    [[vc rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(vc)
        [vc addChildView];
        [vc bindViewModel];
    }];
    
    [[vc rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
        
        
    }];
    
    return vc;
}




-(void)addChildView{
    
}
-(void)bindViewModel{
    
}

-(UIBarButtonItem *)messageItems{
    if (!_messageItems) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"NavigationBar_Message_Normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"NavigationBar_Message_Selected"] forState:UIControlStateSelected];
        btn.frame = CGRectMake(0, 0, 30, 30);
        _messageItems = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
    }
    return _messageItems;
}
@end

//
//  PersonalViewController.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalMainView.h"
#import "PersonalViewModel.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "PromptView.h"
#import "SettingViewController.h"
#import "MyVisitorViewController.h"
#import "FocusViewController.h"
@interface PersonalViewController ()
@property (nonatomic,strong)PersonalMainView * mainView;
@property (nonatomic,strong)PersonalViewModel * viewModel;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];
    
  
    
}



-(void)updateViewConstraints{

    WS(weakself)
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(weakSelf.view);
    }];
    [super updateViewConstraints];
}

-(void)bindViewModel{

    WS(weakself)
    [[self.viewModel.headImgClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"头像点击");
        SettingViewController * SVC = [[SettingViewController alloc]init];
        [self.navigationController pushViewController:SVC animated:YES];
    }];
    
    [[self.viewModel.questionClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"问号点击");
        PromptView * Pview = [[PromptView alloc]initWithTitleString:@"温馨提示" SubTitleString:@"每日登录和补充完善个人资料可获得钻石哦！"];
        [Pview show];
        Pview.goonBlock = ^(){
        
        };
        
    }];
    
    [[self.viewModel.visitorsClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        //
        NSLog(@"访客点击");
        MyVisitorViewController * MVC = [[MyVisitorViewController alloc]init];
        [weakSelf.navigationController pushViewController:MVC animated:YES];
    }];
    
    [[self.viewModel.focusClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"关注");
        FocusViewController * FVC = [[FocusViewController alloc]init];
        [weakSelf.navigationController pushViewController:FVC animated:YES];
    }];
    
   
//    [[self.viewModel.userInfoCommand executionSignals] subscribeNext:^(id  _Nullable x) {
//        
//        [x subscribeNext:^(id  _Nullable x) {
//            NSLog(@"userinfo= %@",x);
//        }];
//    }];
//    
    /*

     */
    
}
//左按钮
-(UIBarButtonItem *)rightButton{
    
    return nil;
}
//右按钮
-(UIBarButtonItem *)leftButton{
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [btn addTarget:self action:@selector(rightButtonCilck:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"personal_diamond_icon"] forState:UIControlStateNormal];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
//去设置
-(void)rightButtonCilck:(id)sender{

    LoginViewController * LVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:LVC animated:YES];
//    SettingViewController * SEVC = [[SettingViewController alloc]init];
//    [self.navigationController pushViewController:SEVC animated:YES];
    
}
-(PersonalMainView *)mainView{

    if (!_mainView) {
        _mainView = [[PersonalMainView alloc]initWithViewModel:self.viewModel];
    }
    return _mainView;
}
-(PersonalViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [[PersonalViewModel alloc]init];
    }
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

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
#import "PersonalMasterView.h"
#import "TradeStatisticViewController.h"


@interface PersonalViewController ()
@property (nonatomic,strong)PersonalMainView * mainView;
@property (nonatomic,strong)PersonalViewModel * viewModel;
@property (nonatomic,strong)PersonalMasterView * masterView;
@end

@implementation PersonalViewController
-(void)viewWillAppear:(BOOL)animated{

    }
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.masterView];

//    [self.view addSubview:self.mainView];

    LoginViewController * LVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:LVC animated:YES];
    
}



-(void)updateViewConstraints{

    WS(weakSelf)
//    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.edges.equalTo(weakSelf.view);
//    }];
    [self.masterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    [super updateViewConstraints];
}

-(void)bindViewModel{

    WS(weakSelf)
    
    [[self.viewModel.middleCellClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSString * x) {
       
        switch ([x integerValue]) {
            case 1:
            {
                
                showMassage(@"跟单管理")
            }
                break;
            case 2:
            {
                showMassage(@"牛人信号")
            }
                break;
            case 3:
            {
//                showMassage(@"交易统计")
                TradeStatisticViewController * TVC = [[TradeStatisticViewController alloc]init];
                [weakSelf.navigationController pushViewController:TVC animated:YES];
            }
                break;
            case 4:
            {
                showMassage(@"数据报表")
            }
                break;
                
            default:
                break;
        }
        
    }];
    
    [[self.viewModel.setBtnClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        
        SettingViewController * SVC = [[SettingViewController alloc]init];
        [weakSelf.navigationController pushViewController:SVC animated:YES];
    }];
    
    
    [[self.viewModel.diamondBtnClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        showMassage(@"点击了钻石")
    }];
    
    [[self.viewModel.headImgClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"头像点击");
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
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [btn addTarget:self action:@selector(leftButtonCilck:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"message_icon"] forState:UIControlStateNormal];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
-(void)leftButtonCilck:(id)sender{
    
}
//右按钮
-(UIBarButtonItem *)leftButton{
    
    return nil;
}

-(PersonalMasterView *)masterView{

    if (!_masterView) {
        _masterView = [[PersonalMasterView alloc]initWithViewModel:self.viewModel];
    }
    return _masterView;
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

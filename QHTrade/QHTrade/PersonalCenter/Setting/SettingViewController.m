//
//  SettingViewController.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/8.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingMainView.h"
#import "SettingViewModel.h"
#import "AboutUSViewController.h"
#import "ChangePhoneViewController.h"
#import "AccountSetViewController.h"

@interface SettingViewController ()
@property (nonatomic,strong)SettingMainView * mainView;
@property (nonatomic,strong)SettingViewModel * viewModel;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainView];
    self.title = @"设置";

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
    
    //更换手机号
    [[self.viewModel.changePhoneClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"genghuan手机");
        ChangePhoneViewController * CVC = [[ChangePhoneViewController alloc]init];
        [weakSelf.navigationController pushViewController:CVC animated:YES];
        }];
    
    //tableViewCell 点击
    [[self.viewModel.cellClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSMutableDictionary * x) {
       
        NSString * section = [x objectForKey:@"section"];
        NSString * row = [x objectForKey:@"row"];
        
        if ([section intValue] == 0) {
            NSLog(@"0-%@",row);
            
            switch ([row intValue]) {
                case 0://个人资料
                {
                    AccountSetViewController * AVC = [[AccountSetViewController alloc]init];
                    [self.navigationController pushViewController:AVC animated:YES];
                }
                    break;
                case 1://手机号
                {
                    
                }
                    break;
                case 2://更换密码
                {
                    
                }
                    break;
                case 3://委托确认
                {
                    
                }
                    break;
                case 4://接收通知
                {
                    
                }
                    break;
                    
                default:
                    break;
            }
        }else{
            NSLog(@"1-%@",row);
            
            switch ([row intValue]) {
                case 0://意见反馈
                {
                    
                }
                    break;
                case 1://检查更新
                {
                    
                }
                    break;
                case 2://关于我们
                {
                    AboutUSViewController * AVC = [[AboutUSViewController alloc]init];
                    [self.navigationController pushViewController:AVC animated:YES];

                }
                    break;
                    
                default:
                    break;
            }
        }
    }];

}

-(SettingViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [[SettingViewModel alloc]init];
    }
    return _viewModel;
}
-(SettingMainView *)mainView{
    if (!_mainView) {
        _mainView = [[SettingMainView alloc]initWithViewModel:self.viewModel];
    }
    return _mainView;
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

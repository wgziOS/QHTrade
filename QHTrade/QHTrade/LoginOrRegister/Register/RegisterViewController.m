//
//  RegisterViewController.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/20.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "RegisterViewModel.h"
@interface RegisterViewController ()
@property (nonatomic,strong) RegisterView * mainView;
@property (nonatomic,strong) RegisterViewModel * viewModel;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) int count;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self.view addSubview:self.mainView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self events];
}
-(void)events{
    
    @weakify(self);
    RAC(self.viewModel, phoneNumStr) = self.mainView.phoneNumTextfield.rac_textSignal;
    RAC(self.viewModel, codeStr) = self.mainView.codeTextfield.rac_textSignal;
    RAC(self.viewModel, passWordStr) = self.mainView.passWordTextfield.rac_textSignal;
    
    [self.mainView.phoneNumTextfield.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
       
        if (x.length) {
            if (x.length > 11) {
                @strongify(self);
                self.mainView.phoneNumTextfield.text = [self.mainView.phoneNumTextfield.text substringToIndex:11];
            }
        }
    }];
    
    [self.mainView.codeTextfield.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        
    }];

    [self.mainView.passWordTextfield.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        
    }];
    
    self.mainView.registerButton.rac_command = self.viewModel.registerCommand;
    
    RAC(self.mainView.registerButton, backgroundColor) = [self.viewModel.registerBtnEnable map:^id _Nullable(NSNumber * value) {
        return [value boolValue] ? [UIColor whiteColor]:[UIColor whiteColor];
    }];
    
    [self.viewModel.registerBtnEnable subscribeNext:^(NSNumber * x) {
        @strongify(self);
        self.mainView.registerButton.enabled  = [x boolValue];
    }];
    
    [[self.viewModel.registerCommand executionSignals] subscribeNext:^(id  _Nullable x) {
       
        [x subscribeNext:^(QHRequestModel* model) {
            NSLog(@"注册成功返回数据%@",model);
            if ([model.status intValue] == 200) {
                showMassage(@"注册成功")
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        }];
    }];
    
    [[self.viewModel.quickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"quick快速登录");//快速登录
    
    }];
    
    
}
-(void)bindViewModel{
    WS(weakSelf)
    [[self.viewModel.getCodeSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"点击了获取验证码");
        [weakSelf getCode];
    }];
    
}
-(void)getCode{
    
    WS(weakSelf)
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setObject:self.mainView.phoneNumTextfield.text forKey:@"mobile"];
    [dic setObject:@"0" forKey:@"check_type"];
    loading(@"")
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError * error;
        QHRequestModel * model = [QHRequest postDataWithApi:@"/smscodes" withParam:dic error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            hiddenHUD;
            [MBProgressHUD hideHUDForView:nil];
            if (error == nil) {
                if ([model.status intValue] ==200 ) {
                    weakSelf.count = 0;
                    weakSelf.timer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(buttonLoadSecond) userInfo:nil repeats:YES];
                }
                showMassage(model.message)
            }
        });
    });
}

-(void)buttonLoadSecond{
    
    self.count++;
    if (60-self.count>0) {
        [self.mainView.codeLabel setText:[NSString stringWithFormat:@"%d秒后重试",60-self.count]];
        [self.mainView.codeLabel setUserInteractionEnabled:NO];
    }else{
        [self.timer invalidate];
        self.timer= nil;
        [self.mainView.codeLabel setText:@"获取验证码"];
        [self.mainView.codeLabel setUserInteractionEnabled:YES];
    }
    
}
-(void)updateViewConstraints{

    WS(weakSelf)
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    [super updateViewConstraints];
}

-(RegisterViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [[RegisterViewModel alloc]init];
    }
    return _viewModel;
}
-(RegisterView *)mainView
{
    if (!_mainView) {
        _mainView = [[RegisterView alloc]initWithViewModel:self.viewModel];
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

//
//  TradeAccountViewController.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/6.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "TradeAccountViewController.h"
#import "TradeAccountMainView.h"
#import "TradeAccountViewModel.h"

@interface TradeAccountViewController ()
@property (nonatomic,strong) TradeAccountMainView * mainView;
@property (nonatomic,strong) TradeAccountViewModel * viewModel;
@end

@implementation TradeAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];
    
    self.title = @"交易账户绑定";
    self.mainView.companyTextfield.text = @"瑞达期货";
}
-(void)bindViewModel{


    WS(weakSelf)
    [[self.viewModel.searchSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        showMassage(@"选择公司")
    }];
    
}

-(void)updateViewConstraints{
    
    WS(weakSelf)
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(weakSelf.view);
    }];
    [super updateViewConstraints];
}

-(TradeAccountViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [[TradeAccountViewModel alloc]init];
    }
    return _viewModel;
}

-(TradeAccountMainView *)mainView{

    if (!_mainView) {
        _mainView = [[TradeAccountMainView alloc]initWithViewModel:self.viewModel];
        _mainView.backgroundColor = [UIColor whiteColor];
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

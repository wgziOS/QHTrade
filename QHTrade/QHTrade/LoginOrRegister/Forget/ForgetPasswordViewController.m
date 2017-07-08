//
//  ForgetPasswordViewController.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/29.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ForgetMainView.h"
#import "ForgetViewModel.h"

@interface ForgetPasswordViewController ()
@property (nonatomic,strong) ForgetMainView * mainView;
@property (nonatomic,strong) ForgetViewModel * viewModel;
@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];

}
-(void)updateViewConstraints{

    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}


-(ForgetViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [[ForgetViewModel alloc]init];
    }
    return _viewModel;
}
-(ForgetMainView *)mainView{

    if (!_mainView) {
        _mainView = [[ForgetMainView alloc]initWithViewModel:self.viewModel];
        _mainView.backgroundColor = RGB(243, 244, 245);
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

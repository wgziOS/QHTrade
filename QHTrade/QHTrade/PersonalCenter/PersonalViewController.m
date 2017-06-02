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


}
-(PersonalMainView *)mainView{

    if (!_mainView) {
        _mainView = [[PersonalMainView alloc]init];
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

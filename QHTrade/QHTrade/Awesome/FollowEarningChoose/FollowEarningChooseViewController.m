//
//  FollowEarningChooseViewController.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningChooseViewController.h"
#import "FollowEarningChooseViewModel.h"
#import "FollowEarningChooseView.h"

@interface FollowEarningChooseViewController ()
@property(nonatomic,strong)FollowEarningChooseView *followEarningChooseView;
@property(nonatomic,strong)FollowEarningChooseViewModel *viewModel;
@end

@implementation FollowEarningChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"跟单选择"];
}
-(void)addChildView{
    [self.view addSubview:self.followEarningChooseView];
    
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf)
    [self.followEarningChooseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
}
-(void)bindViewModel{
    
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
-(FollowEarningChooseViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FollowEarningChooseViewModel alloc] init];
    }
    return _viewModel;
}
-(FollowEarningChooseView *)followEarningChooseView{
    if (!_followEarningChooseView) {
        _followEarningChooseView = [[FollowEarningChooseView alloc] initWithViewModel:self.viewModel];
    }
    return _followEarningChooseView;
}
@end

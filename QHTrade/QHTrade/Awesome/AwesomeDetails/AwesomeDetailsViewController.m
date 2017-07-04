

//
//  AwesomeDetailsViewController.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeDetailsViewController.h"
#import "AwesomeDetailsViewModel.h"
#import "AwesomeDetailsView.h"

@interface AwesomeDetailsViewController ()
@property(nonatomic,strong)AwesomeDetailsViewModel *viewModel;
@property(nonatomic,strong)AwesomeDetailsView *awesomeDetailsView;
@end

@implementation AwesomeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGB(243, 244, 245)];
    [self setTitle:@"牛人信息"];
}

-(void)addChildView{
    [self.view addSubview:self.awesomeDetailsView];
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf)
    [self.awesomeDetailsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(AwesomeDetailsViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AwesomeDetailsViewModel alloc] init];
    }
    return _viewModel;
}

-(AwesomeDetailsView *)awesomeDetailsView{
    if (!_awesomeDetailsView) {
        _awesomeDetailsView = [[AwesomeDetailsView alloc] initWithViewModel:self.viewModel];
    }
    return _awesomeDetailsView;
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

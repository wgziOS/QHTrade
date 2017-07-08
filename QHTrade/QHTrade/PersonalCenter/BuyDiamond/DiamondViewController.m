//
//  DiamondViewController.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/6.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "DiamondViewController.h"
#import "DiamondRecordViewController.h"
#import "DiamondMainView.h"
#import "DiamondViewModel.h"
@interface DiamondViewController ()
@property (nonatomic,strong) DiamondMainView * mainView;
@property (nonatomic,strong) DiamondViewModel * viewModel;
@end

@implementation DiamondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购买钻石";
    
    [self.view addSubview:self.mainView];
    
    
    
}

-(void)updateViewConstraints{
    
    WS(weakSelf)
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
 
    [super updateViewConstraints];
}
-(DiamondViewModel *)viewModel{
    
    if (!_viewModel) {
        _viewModel = [[DiamondViewModel alloc]init];
    }
    return _viewModel;

}

-(DiamondMainView *)mainView{

    if (!_mainView) {
        _mainView = [[DiamondMainView alloc]initWithViewModel:self.viewModel];
        _mainView.backgroundColor = [UIColor whiteColor];
    }
    return _mainView;
}


-(void)recordBtnClick:(id)sender{
    
    DiamondRecordViewController * DVC = [[DiamondRecordViewController alloc]init];
    [self.navigationController pushViewController:DVC animated:YES];
}
-(UIBarButtonItem *)rightButton{
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 43, 23)];
    [btn setTitle:@"记录" forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn addTarget:self action:@selector(recordBtnClick:) forControlEvents:UIControlEventTouchUpInside];//设置按钮的点击事件
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
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

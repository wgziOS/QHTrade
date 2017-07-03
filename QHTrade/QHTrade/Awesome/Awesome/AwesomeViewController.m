//
//  AwesomeViewController.m
//  QHTrade
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeViewController.h"
#import "AwesomeView.h"
#import "AwesomeViewModel.h"
#import "RookieView.h"
#import "CanFollowView.h"
#import "FollowEarningsTopView.h"


@interface AwesomeViewController ()
@property(nonatomic,strong)RookieView *rookieView;
@property(nonatomic,strong)AwesomeView *awesomeView;
@property(nonatomic,strong)FollowEarningsTopView *followEarningsTopView;
@property(nonatomic,strong)CanFollowView *canFollowView;
@property(nonatomic,strong)AwesomeViewModel *viewModel;
@property(nonatomic,strong)UIView *segmentedControl;
@property(nonatomic,strong)NSMutableArray *btnArray;
@property(nonatomic,assign)int oldIndex;
@property(nonatomic,weak)BaseView *childView;
@end

@implementation AwesomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addChildView{
    [self.view addSubview:self.awesomeView];
    self.childView = self.awesomeView;
//    [self.view addSubview:self.rookieView];

}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf)
    switch (self.oldIndex) {
        case 0:{
            [self.awesomeView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(weakSelf.view);
            }];
        }
            break;
        case 1:{
            [self.rookieView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(weakSelf.view);
            }];
        }
            break;
        case 2:{
            [self.followEarningsTopView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(weakSelf.view);
            }];
        }
            break;
        case 3:{
            [self.canFollowView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(weakSelf.view);
            }];
        }
            break;
        default:
            break;
    }
    
    
}
-(UIView *)centerView{
    return self.segmentedControl;
}
-(UIBarButtonItem *)leftButton{
    return nil;
}
-(void)segmentedControlClick:(UIButton*)button{
    UIButton *oldSelectedBtn = self.btnArray[self.oldIndex];
    oldSelectedBtn.selected = NO;
    button.selected = YES;
    
    self.oldIndex = (int)button.tag;
    
    
    switch (self.oldIndex) {
        case 0:
            [self.childView removeFromSuperview];
            [self.view addSubview:self.awesomeView];
            self.childView = self.awesomeView;
            break;
        case 1:
            [self.childView removeFromSuperview];
            [self.view addSubview:self.rookieView];
            self.childView = self.rookieView;
            break;
        case 2:
            [self.childView removeFromSuperview];
            [self.view addSubview:self.followEarningsTopView];
            self.childView = self.rookieView;
            break;
        case 3:
            [self.childView removeFromSuperview];
            [self.view addSubview:self.canFollowView];
            self.childView = self.rookieView;
            break;
            
        default:
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(UIView *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 30)];
        _segmentedControl.layer.masksToBounds = YES;
        _segmentedControl.layer.cornerRadius = 15;
        _segmentedControl.backgroundColor = RGB(150, 150, 150);
        NSArray *titleArray = [NSArray arrayWithObjects:@"牛人榜",@"新人榜",@"跟单收益榜",@"可跟单榜", nil];
        for (int i = 0; i < 4; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i ;
            button.backgroundColor = [UIColor whiteColor];
            [button setBackgroundImage:[UIImage createImageWithColor:RGB(236, 93, 30)] forState:UIControlStateSelected];
            [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:RGB(151, 150, 150) forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(segmentedControlClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setFrame:CGRectMake(i*70.5, 0, 70, 30)];
            [self.btnArray addObject:button];
            [_segmentedControl addSubview:button];
            if (i==0)button.selected = YES;
        }
    }
    return _segmentedControl;
}
-(int)oldIndex{
    if (!_oldIndex) {
        _oldIndex = 0;
    }
    return _oldIndex;
}


-(NSMutableArray *)btnArray{
    if (!_btnArray) {
        _btnArray = [[NSMutableArray alloc] init];
    }
    return _btnArray;
}
-(AwesomeView *)awesomeView{
    if (!_awesomeView) {
        _awesomeView = [[AwesomeView alloc] initWithViewModel:self.viewModel];
        
    }
    return _awesomeView;
    
}
-(RookieView *)rookieView{
    if (!_rookieView) {
        _rookieView = [[RookieView alloc] initWithViewModel:self.viewModel];

    }
    return _rookieView;
}
-(FollowEarningsTopView *)followEarningsTopView{
    if (!_followEarningsTopView) {
        _followEarningsTopView = [[FollowEarningsTopView alloc] initWithViewModel:self.viewModel];
    }
    return _followEarningsTopView;
}
-(CanFollowView *)canFollowView{
    if (!_canFollowView) {
        _canFollowView = [[CanFollowView alloc] initWithViewModel:self.viewModel];
    }
    return _canFollowView;
}

-(AwesomeViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[AwesomeViewModel alloc] init];
    }
    return _viewModel;
}
@end

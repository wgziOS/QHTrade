//
//  AwesomeViewController.m
//  QHTrade
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeViewController.h"
#import "RookieView.h"
#import "AwesomeView.h"
#import "CanFollowView.h"
#import "AwesomeViewModel.h"
#import "FollowEarningsTopView.h"
#import "AwesomeDetailsViewController.h"
#import "FollowEarningsDetailsViewController.h"
#import "SegmentedControlView.h"
#import "FollowEarningChooseViewController.h"

@interface AwesomeViewController ()
@property(nonatomic,strong)RookieView *rookieView;
@property(nonatomic,strong)AwesomeView *awesomeView;
@property(nonatomic,strong)FollowEarningsTopView *followEarningsTopView;
@property(nonatomic,strong)CanFollowView *canFollowView;
@property(nonatomic,strong)AwesomeViewModel *viewModel;
@property(nonatomic,strong)SegmentedControlView *segmentedControl;
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

-(void)bindViewModel{
    WS(weakSelf)
    [[self.viewModel.followEarningsCellClick takeUntil:self.rac_willDeallocSignal ] subscribeNext:^(id  _Nullable x) {
        FollowEarningsDetailsViewController *followEarningsDetails = [[FollowEarningsDetailsViewController alloc] init];
        [weakSelf.navigationController pushViewController:followEarningsDetails animated:YES];
    }];
    [[self.viewModel.awesomeCellClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        AwesomeDetailsViewController *awesomeDetails = [[AwesomeDetailsViewController alloc] init];
        [weakSelf.navigationController pushViewController:awesomeDetails animated:YES];
    }];
    [[self.viewModel.awesomeFollowActionClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        FollowEarningChooseViewController *followEarningChoose = [[FollowEarningChooseViewController alloc] init];
        [weakSelf.navigationController pushViewController:followEarningChoose animated:YES];
    }];
    [[self.viewModel.rookieCellClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        AwesomeDetailsViewController *awesomeDetails = [[AwesomeDetailsViewController alloc] init];
        [weakSelf.navigationController pushViewController:awesomeDetails animated:YES];
    }];
    [[self.viewModel.canFollowCellClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        AwesomeDetailsViewController *awesomeDetails = [[AwesomeDetailsViewController alloc] init];
        [weakSelf.navigationController pushViewController:awesomeDetails animated:YES];
    }];
}
-(UIView *)centerView{
    self.segmentedControl.frame= CGRectMake(0, 0, 280 ,30);
    return self.segmentedControl;
}
-(UIBarButtonItem *)leftButton{
    return nil;
}
-(void)segmentedControlClick:(int)index{
    
    switch (index) {
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
            self.childView = self.followEarningsTopView;
            break;
        case 3:
            [self.childView removeFromSuperview];
            [self.view addSubview:self.canFollowView];
            self.childView = self.canFollowView;
            break;
            
        default:
            break;
    }
    self.oldIndex = index;
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
        _segmentedControl = [[SegmentedControlView alloc] initWithSize:CGSizeMake(280, 30)
                                                           defultTitle:RGB(151, 150, 150)
                                                         selectedTitle:[UIColor whiteColor]
                                                              defultBg:[UIColor whiteColor]
                                                            selectedBg:RGB(236, 93, 30)
                                                              withFont:13
                                                       borderWithColor:RGB(150, 150, 150)
                                                            itemsArray:[NSArray arrayWithObjects:@"牛人榜",@"新人榜",@"跟单收益榜",@"可跟单榜", nil]
                             ];
        _segmentedControl.layer.masksToBounds = YES;
        _segmentedControl.layer.cornerRadius = 15;
        @weakify(self)
        _segmentedControl.itemClick = ^(int index) {
            @strongify(self)
            [self segmentedControlClick:index];
        };
        
    }
    return _segmentedControl;
}

-(int)oldIndex{
    if (!_oldIndex) {
        _oldIndex = 0;
    }
    return _oldIndex;
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

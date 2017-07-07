//
//  FollowEarningsDetailsView.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningsDetailsView.h"
#import "FollowEarningsDetailsViewModel.h"
#import "SegmentedControlView.h"

@interface FollowEarningsDetailsView()
@property(nonatomic,strong)FollowEarningsDetailsViewModel *viewModel;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UIImageView *sex;
@property(nonatomic,strong)UIButton *earningsRate;//收益率
@property(nonatomic,strong)UIButton *totalProfit;//总收益
@property(nonatomic,strong)UIButton *positionsUsage;//仓位使用率
@property(nonatomic,strong)UILabel *followingLabel;//正在跟随
@property(nonatomic,strong)UIView *awesomeView;//牛人的View
@property(nonatomic,strong)UIImageView *awesomeIcon;//牛人头像
@property(nonatomic,strong)UILabel *awesomeName;//牛人名称
@property(nonatomic,strong)UIView *bottomLine;//下底线
@property(nonatomic,strong)UILabel *promptLabel;//收益率曲线提示label
@property(nonatomic,strong)SegmentedControlView *segmentedControl;//日 月 季

@end

@implementation FollowEarningsDetailsView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (FollowEarningsDetailsViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)setupViews{
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:self.icon];
    [self.scrollView addSubview:self.name];
    [self.scrollView addSubview:self.sex];
    [self.scrollView addSubview:self.earningsRate];
    [self.scrollView addSubview:self.totalProfit];
    [self.scrollView addSubview:self.positionsUsage];
    [self.scrollView addSubview:self.followingLabel];
    [self.scrollView addSubview:self.awesomeView];
    [self.awesomeView addSubview:self.awesomeIcon];
    [self.awesomeView addSubview:self.awesomeName];
    [self.scrollView addSubview:self.bottomLine];
    [self.scrollView addSubview:self.promptLabel];
    [self.scrollView addSubview:self.segmentedControl];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView).with.offset(10);
        make.left.equalTo(weakSelf.scrollView).with.offset(16);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView).with.offset(10);
        make.left.equalTo(weakSelf.icon.mas_right).with.offset(15);
        make.size.mas_offset(CGSizeMake(80, 20));
    }];
    [self.sex mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView).with.offset(13);
        make.left.equalTo(weakSelf.name.mas_right).with.offset(5);
        make.size.mas_offset(CGSizeMake(12, 12));
    }];
    [self.earningsRate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.scrollView).with.offset(16);
        make.size.mas_offset(CGSizeMake((SCREEN_WIDTH-32)*0.3, 50));
    }];
    [self.totalProfit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakSelf.self);
        make.size.mas_offset(CGSizeMake((SCREEN_WIDTH-32)*0.3, 50));
    }];
    [self.positionsUsage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).with.offset(10);
        make.right.equalTo(weakSelf.self.mas_right).with.offset(-16);
        make.size.mas_offset(CGSizeMake((SCREEN_WIDTH-32)*0.3, 50));
    }];
    [self.followingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.earningsRate.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakSelf.scrollView);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH+3, 40));
    }];
    [self.awesomeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.followingLabel.mas_bottom);
        make.centerX.equalTo(weakSelf.scrollView);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 40));
    }];
    
    [self.awesomeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.awesomeView).with.offset(10);
        make.left.equalTo(weakSelf.awesomeView).with.offset(16);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.awesomeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.awesomeView).with.offset(10);
        make.left.equalTo(weakSelf.awesomeIcon.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH+3, 30));
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.awesomeIcon.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakSelf.scrollView);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 0.5));
    }];
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bottomLine.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.scrollView).with.offset(10);
        make.size.mas_offset(CGSizeMake(100, 30));
    }];
    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bottomLine.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.scrollView).with.offset(SCREEN_WIDTH-90);
        make.size.mas_offset(CGSizeMake(80, 20));
    }];
    
}

-(void)bindViewModel{
    WS(weakSelf)
    [self.viewModel.followRarningsSubject subscribeNext:^(id  _Nullable x) {
        [weakSelf sendData:x];
    }];
    
}

-(void)sendData:(NSDictionary*)data{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(0.5f, 500);
    }
    return _scrollView;
}
-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.text = @"I'm rookie awesome";
        _name.font = [UIFont systemFontOfSize:14];
    }
    return _name;
}
-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor greenColor];
        _icon.layer.masksToBounds = YES;
        _icon.layer.cornerRadius = 15;
    }
    return _icon;
}
-(UIImageView *)sex{
    if (!_sex) {
        _sex = [[UIImageView alloc] init];
//        _sex.backgroundColor = [UIColor greenColor];
        [_sex setImage:[UIImage imageNamed:@"personal_woman_icon"]];
    }
    return _sex;
}
-(UIButton *)earningsRate{
    if (!_earningsRate) {
        _earningsRate = [UIButton  buttonWithType:UIButtonTypeCustom];
        [_earningsRate setTitle:@"收益率\n100%" forState:UIControlStateNormal];
        [_earningsRate.titleLabel setFont:[UIFont systemFontOfSize:14]];
        _earningsRate.titleLabel.numberOfLines = 2;
        [_earningsRate setBackgroundImage:[UIImage imageNamed:@"personal_dikuang"] forState:UIControlStateNormal];
        [_earningsRate setTitleColor:RGB(50, 51, 52) forState:UIControlStateNormal];
        _earningsRate.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _earningsRate;
}
-(UIButton *)totalProfit{
    if (!_totalProfit) {
        _totalProfit = [UIButton buttonWithType:UIButtonTypeCustom];
        [_totalProfit setTitle:@"总资产\n100.12W" forState:UIControlStateNormal];
        [_totalProfit.titleLabel setFont:[UIFont systemFontOfSize:14]];
        _totalProfit.titleLabel.numberOfLines = 2;
        [_totalProfit setBackgroundImage:[UIImage imageNamed:@"personal_dikuang"] forState:UIControlStateNormal];
        [_totalProfit setTitleColor:RGB(50, 51, 52) forState:UIControlStateNormal];
        _totalProfit.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _totalProfit;
}
-(UIButton *)positionsUsage{
    if (!_positionsUsage) {
        _positionsUsage = [[UIButton alloc] init];
        [_positionsUsage setTitle:@"总收益\n10.12W" forState:UIControlStateNormal];
        [_positionsUsage.titleLabel setFont:[UIFont systemFontOfSize:14]];
        _positionsUsage.titleLabel.numberOfLines = 2;
        [_positionsUsage setBackgroundImage:[UIImage imageNamed:@"personal_dikuang"] forState:UIControlStateNormal];
        [_positionsUsage setTitleColor:RGB(50, 51, 52) forState:UIControlStateNormal];
        _positionsUsage.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _positionsUsage;
}
-(UILabel *)followingLabel{
    if (!_followingLabel) {
        _followingLabel = [[UILabel alloc] init];
        _followingLabel.text = @"    正在跟随";
        _followingLabel.textColor = RGB(67 , 68 , 68);
        _followingLabel.font = [UIFont systemFontOfSize:14];
        _followingLabel.layer.borderWidth = 0.5;
        _followingLabel.layer.borderColor = RGB(220, 220, 220).CGColor;
        _followingLabel.backgroundColor = RGB(235, 235, 235);
    }
    return _followingLabel;
}
-(UIView *)awesomeView{
    if (!_awesomeView) {
        _awesomeView = [[UIView alloc] init];
        _awesomeView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [[tap rac_gestureSignal] subscribeNext:^(id x) {
            [self.viewModel.awesomeClickSubject sendNext:nil];
        }];
        [_awesomeView addGestureRecognizer:tap];
    }
    return _awesomeView;
}
-(UIImageView *)awesomeIcon{
    if (!_awesomeIcon) {
        _awesomeIcon = [[UIImageView alloc] init];
        _awesomeIcon.backgroundColor = [UIColor greenColor];
        _awesomeIcon.layer.masksToBounds = YES;
        _awesomeIcon.layer.cornerRadius = 15;
    }
    return _awesomeIcon;
}
-(UILabel *)awesomeName{
    if (!_awesomeName) {
        _awesomeName = [[UILabel alloc] init];
        _awesomeName.text = @"牛人昵称";
        _awesomeName.font = [UIFont systemFontOfSize:14];
    }
    return _awesomeName;
}
-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UILabel alloc] init];
        _bottomLine.backgroundColor = RGB(218, 218, 218);
    }
    return _bottomLine;
}

-(UILabel *)promptLabel{
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.text = @"总收益率曲线";
        _promptLabel.font = [UIFont systemFontOfSize:14];
        _promptLabel.textColor = RGB(50, 50, 50);
    }
    return _promptLabel;
}
-(UIView *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[SegmentedControlView alloc] initWithSize:CGSizeMake(80, 30)
                                                           defultTitle:RGB(84, 85, 86)
                                                         selectedTitle:RGB(252, 99, 33)
                                                              defultBg:[UIColor whiteColor]
                                                            selectedBg:[UIColor whiteColor]
                                                              withFont:15
                                                       borderWithColor:[UIColor whiteColor]
                                                            itemsArray:[NSArray arrayWithObjects:@"日",@"月",@"季", nil]
                             ];

//        @weakify(self)
        _segmentedControl.itemClick = ^(int index) {
//            @strongify(self)
//            [self segmentedControlClick:index];
        };
        
    }
    return _segmentedControl;
}
@end

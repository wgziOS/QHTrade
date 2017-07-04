//
//  FollowEarningsDetailsView.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningsDetailsView.h"
#import "FollowEarningsDetailsViewModel.h"

@interface FollowEarningsDetailsView()
@property(nonatomic,strong)FollowEarningsDetailsViewModel *viewModel;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UIImageView *sex;
@property(nonatomic,strong)UILabel *earningsRate;//收益率
@property(nonatomic,strong)UILabel *totalProfit;//总收益
@property(nonatomic,strong)UILabel *positionsUsage;//仓位使用率
@property(nonatomic,strong)UILabel *followingLabel;//正在跟随
@property(nonatomic,strong)UIView *awesomeView;//牛人的View
@property(nonatomic,strong)UIImageView *awesomeIcon;//牛人头像
@property(nonatomic,strong)UILabel *awesomeName;//牛人名称
@property(nonatomic,strong)UIView *bottomLine;//下底线
@property(nonatomic,strong)UILabel *promptLabel;//收益率曲线提示label
@property(nonatomic,strong)UISegmentedControl *segmentedControl;//日月季 收益率按钮

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
        make.top.left.equalTo(weakSelf.scrollView).with.offset(10);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView).with.offset(10);
        make.left.equalTo(weakSelf.icon.mas_right).with.offset(5);
        make.size.mas_offset(CGSizeMake(80, 20));

    }];
    [self.sex mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView).with.offset(10);
        make.left.equalTo(weakSelf.name.mas_right).with.offset(5);
        make.size.mas_offset(CGSizeMake(30, 20));
    }];
    [self.earningsRate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.scrollView).with.offset(10);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH*0.3, 50));
    }];
    [self.totalProfit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.scrollView).with.offset(SCREEN_WIDTH*0.33);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH*0.3, 50));
    }];
    [self.positionsUsage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.scrollView).with.offset(SCREEN_WIDTH*0.66);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH*0.3, 50));
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
        make.left.top.equalTo(weakSelf.awesomeView).with.offset(10);
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
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 1));
    }];
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bottomLine.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.scrollView).with.offset(10);
        make.size.mas_offset(CGSizeMake(100, 30));
    }];
    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bottomLine.mas_bottom).with.offset(15);
        make.left.equalTo(weakSelf.scrollView).with.offset(SCREEN_WIDTH-90);
        make.size.mas_offset(CGSizeMake(80, 20));
    }];
    
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
    }
    return _icon;
}
-(UIImageView *)sex{
    if (!_sex) {
        _sex = [[UIImageView alloc] init];
        _sex.backgroundColor = [UIColor greenColor];
    }
    return _sex;
}
-(UILabel *)earningsRate{
    if (!_earningsRate) {
        _earningsRate = [[UILabel alloc] init];
        _earningsRate.numberOfLines = 2;
        _earningsRate.text = @"我真的只是收益率";
        _earningsRate.textAlignment = NSTextAlignmentCenter;
    }
    return _earningsRate;
}
-(UILabel *)totalProfit{
    if (!_totalProfit) {
        _totalProfit = [[UILabel alloc] init];
        _totalProfit.numberOfLines = 2;
        _totalProfit.text = @"我是总收益率";
        _totalProfit.textAlignment = NSTextAlignmentCenter;
    }
    return _totalProfit;
}
-(UILabel *)positionsUsage{
    if (!_positionsUsage) {
        _positionsUsage = [[UILabel alloc] init];
        _positionsUsage.numberOfLines = 2;
        _positionsUsage.text = @"我是仓位使用率";
        _positionsUsage.textAlignment = NSTextAlignmentCenter;
    }
    return _positionsUsage;
}
-(UILabel *)followingLabel{
    if (!_followingLabel) {
        _followingLabel = [[UILabel alloc] init];
        _followingLabel.text = @"   正在跟随";
        _followingLabel.font = [UIFont systemFontOfSize:14];
        _followingLabel.layer.borderWidth = 0.5;
        _followingLabel.layer.borderColor = RGB(80, 80, 80).CGColor;
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
        _awesomeName.text = @"ashdasdkjasj";
        _awesomeName.font = [UIFont systemFontOfSize:14];
    }
    return _awesomeName;
}
-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UILabel alloc] init];
        _bottomLine.backgroundColor = RGB(100, 100, 100);
    }
    return _bottomLine;
}

-(UILabel *)promptLabel{
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.text = @"收益率曲线";
        _promptLabel.font = [UIFont systemFontOfSize:14];
    }
    return _promptLabel;
}

-(UISegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"日",@"月",@"年", nil]];
        _segmentedControl.selectedSegmentIndex = 0;
    }
    return _segmentedControl;
}
@end

//
//  FollowEarningChooseHeadView.m
//  QHTrade
//
//  Created by user on 2017/7/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningChooseHeadView.h"
#import "FollowEarningChooseViewModel.h"
#import "FollowEarningChooseModel.h"

@interface FollowEarningChooseHeadView()
@property(nonatomic,strong)FollowEarningChooseViewModel *viewModel;
@property(nonatomic,strong)UIImageView *icon;//头像
@property(nonatomic,strong)UILabel *awesomeName;//牛人名称
@property(nonatomic,strong)UIImageView *subscribeIcon;//订阅数图标
@property(nonatomic,strong)UILabel *subscribeNum;//订阅数
@property(nonatomic,strong)UILabel *minimumTrading;//最小交易值
@property(nonatomic,strong)UIButton *followAction;//跟单按钮
@property(nonatomic,strong)UIView *line;//分割线
@property(nonatomic,strong)UILabel *autoFollowTitle;//自动跟单费用标题
@property(nonatomic,strong)UILabel *autoFollowPrice;//自动跟单价格
@property(nonatomic,strong)UILabel *autoFollowUnit;//自动跟单价格单位
@property(nonatomic,strong)UILabel *followActionTitle;//跟单计划标题
@property(nonatomic,strong)UILabel *followActionPlan;//跟单计划
@property(nonatomic,strong)UILabel *completedTitle;//已完成的标题
@property(nonatomic,strong)UILabel *completed;//已完成
@property(nonatomic,strong)UILabel *timeLengthTitle;//跟单时长标题
@property(nonatomic,strong)UILabel *timeLength;//跟单时长
@property(nonatomic,strong)UILabel *followActionType;//跟单类型
@property(nonatomic,strong)UIImageView *diamond;//钻石图标
@end

@implementation FollowEarningChooseHeadView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (FollowEarningChooseViewModel*)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)setupViews{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.icon];
    [self addSubview:self.awesomeName];
    [self addSubview:self.subscribeIcon];
    [self addSubview:self.subscribeNum];
    [self addSubview:self.minimumTrading];
    [self addSubview:self.line];
    [self addSubview:self.autoFollowTitle];
    [self addSubview:self.autoFollowPrice];
    [self addSubview:self.autoFollowUnit];
    [self addSubview:self.followActionTitle];
    [self addSubview:self.followActionPlan];
    [self addSubview:self.completedTitle];
    [self addSubview:self.completed];
    [self addSubview:self.timeLengthTitle];
    [self addSubview:self.timeLength];
    [self addSubview:self.followActionType];
    [self addSubview:self.diamond];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];

}
-(void)updateConstraints{
    [super updateConstraints];
    @weakify(self)
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(16);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.awesomeName mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self.icon.mas_right).with.offset(17);
        make.size.mas_offset(CGSizeMake(70, 14));
    }];
    [self.subscribeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.awesomeName.mas_right).with.offset(5);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(8, 12));
    }];
    [self.subscribeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.subscribeIcon.mas_right).with.offset(3);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(30, 12));
    }];
    
    [self.minimumTrading mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.awesomeName.mas_bottom).with.offset(3);
        make.left.equalTo(self.icon.mas_right).with.offset(17);
        make.size.mas_offset(CGSizeMake(125, 15));
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.icon.mas_bottom).with.offset(10);
        make.centerX.equalTo(self);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 0.5));
    }];
  
    [self.autoFollowTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.line.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(16);
        make.size.mas_offset(CGSizeMake(90, 20));
    }];
    [self.autoFollowPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.line.mas_bottom).with.offset(10);
        make.left.equalTo(self.autoFollowTitle.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(29, 20));
    }];
    [self.diamond mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.line.mas_bottom).with.offset(13);
        make.left.equalTo(self.autoFollowPrice.mas_right);
        make.size.mas_offset(CGSizeMake(16, 15));
    }];
    [self.autoFollowUnit mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.line.mas_bottom).with.offset(10);
        make.left.equalTo(self.diamond.mas_right);
        make.size.mas_offset(CGSizeMake(80, 20));
    }];
    [self.followActionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.autoFollowTitle.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(16);
        make.size.mas_offset(CGSizeMake(90, 20));
    }];
    [self.followActionPlan mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.autoFollowTitle.mas_bottom).with.offset(10);
        make.left.equalTo(self.autoFollowTitle.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(200, 20));
    }];
    [self.completedTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.followActionTitle.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(16);
        make.size.mas_offset(CGSizeMake(90, 20));
    }];
    [self.completed mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.followActionTitle.mas_bottom).with.offset(10);
        make.left.equalTo(self.autoFollowTitle.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(200, 20));
    }];
    [self.timeLengthTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.completedTitle.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(16);
        make.size.mas_offset(CGSizeMake(90, 20));
    }];
    [self.timeLength mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.completedTitle.mas_bottom).with.offset(10);
        make.left.equalTo(self.autoFollowTitle.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(200, 20));
    }];
    [self.followActionType mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.timeLengthTitle.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(16);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 20));
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.contentMode = UIViewContentModeScaleToFill;
        _icon.backgroundColor = [UIColor greenColor];
        _icon.layer.masksToBounds = YES;
        _icon.layer.cornerRadius = 15;
    }
    return _icon;
}
-(UILabel *)awesomeName{
    if (!_awesomeName) {
        _awesomeName = [[UILabel alloc] init];
        _awesomeName.text = @"我是牛人";
//        _awesomeName.textColor = RGB(117, 118, 119);
        _awesomeName.font = [UIFont systemFontOfSize:15];
    }
    return _awesomeName;
}
-(UIImageView *)subscribeIcon{
    if (!_subscribeIcon) {
        _subscribeIcon = [[UIImageView alloc] init];
        _subscribeIcon.image = [UIImage imageNamed:@"Awesome_subscribeNum_icon"];
    }
    return _subscribeIcon;
}

-(UILabel *)subscribeNum{
    if (!_subscribeNum) {
        _subscribeNum = [[UILabel alloc] init];
        _subscribeNum.textColor = RGB(252, 179, 43);
        _subscribeNum.text = @"123";
        _subscribeNum.font = [UIFont systemFontOfSize:12];
    }
    return _subscribeNum;
}

-(UILabel *)minimumTrading{
    if (!_minimumTrading) {
        _minimumTrading = [[UILabel alloc] init];
        _minimumTrading.text = @"最低交易金:50000,00";
        _minimumTrading.font = [UIFont systemFontOfSize:12];
        _minimumTrading.textColor = RGB(68, 69, 69);
    }
    return _minimumTrading;
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = RGB(205, 207, 205);
    }
    return _line;
}
-(UILabel *)autoFollowTitle{
    if (!_autoFollowTitle) {
        _autoFollowTitle = [[UILabel alloc] init];
        _autoFollowTitle.text = @"自动跟单费:";
        _autoFollowTitle.font = [UIFont systemFontOfSize:15];
        _autoFollowTitle.textColor = RGB(50, 51, 52);
    }
    return _autoFollowTitle;
}
-(UILabel *)autoFollowPrice{
    if (!_autoFollowPrice) {
        _autoFollowPrice = [[UILabel alloc] init];
        _autoFollowPrice.text = @"300";
//        _autoFollowPrice.textAlignment = NSTextAlignmentRight;
        _autoFollowPrice.font = [UIFont systemFontOfSize:15];
        _autoFollowPrice.textColor = RGB(50, 51, 52);
    }
    return _autoFollowPrice;
}
-(UILabel *)autoFollowUnit{
    if (!_autoFollowUnit) {
        _autoFollowUnit = [[UILabel alloc] init];
        _autoFollowUnit.text = @"/月";
        _autoFollowUnit.font = [UIFont systemFontOfSize:15];
        _autoFollowUnit.textColor = RGB(50, 51, 52);
    }
    return _autoFollowUnit;
}
-(UILabel *)followActionTitle{
    if (!_followActionTitle) {
        _followActionTitle = [[UILabel alloc] init];
        _followActionTitle.text = @"跟单计划:";
        _followActionTitle.font = [UIFont systemFontOfSize:15];
        _followActionTitle.textColor = RGB(50, 51, 52);
    }
    return _followActionTitle;
}
//跟单计划
-(UILabel *)followActionPlan{
    if (!_followActionPlan) {
        _followActionPlan = [[UILabel alloc] init];
        _followActionPlan.text = @"2017年6月20日到9月28日";
        _followActionPlan.font = [UIFont systemFontOfSize:15];
        _followActionPlan.textColor = RGB(50, 51, 52);
    }
    return _followActionPlan;
}
//已完成的标题
-(UILabel *)completedTitle{
    if (!_completedTitle) {
        _completedTitle = [[UILabel alloc] init];
        _completedTitle.text = @"已完成:";
        _completedTitle.font = [UIFont systemFontOfSize:15];
        _completedTitle.textColor = RGB(50, 51, 52);
    }
    return _completedTitle;
}
//已完成
-(UILabel *)completed{
    if (!_completed) {
        _completed = [[UILabel alloc] init];
        _completed.text = @"8天";
        _completed.font = [UIFont systemFontOfSize:15];
        _completed.textColor = RGB(50, 51, 52);
    }
    return _completed;
}
//跟单时长标题
-(UILabel *)timeLengthTitle{
    if (!_timeLengthTitle) {
        _timeLengthTitle = [[UILabel alloc] init];
        _timeLengthTitle.text = @"跟单时长:";
        _timeLengthTitle.font = [UIFont systemFontOfSize:15];
        _timeLengthTitle.textColor = RGB(50, 51, 52);
    }
    return _timeLengthTitle;
}
//跟单时长
-(UILabel *)timeLength{
    if (!_timeLength) {
        _timeLength = [[UILabel alloc] init];
        _timeLength.text = @"1个月";
        _timeLength.font = [UIFont systemFontOfSize:15];
        _timeLength.textColor = RGB(50, 51, 52);
    }
    return _timeLength;
}
//跟单类型
-(UILabel *)followActionType{
    if (!_followActionType) {
        _followActionType = [[UILabel alloc] init];
        _followActionType.text = @"跟单类型:";
        _followActionType.font = [UIFont systemFontOfSize:15];
        _followActionType.textColor = RGB(50, 51, 52);
    }
    return _followActionType;
}
//钻石图标
-(UIImageView *)diamond{
    if (!_diamond) {
        _diamond = [[UIImageView alloc] init];
        _diamond.image = [UIImage imageNamed:@"Awesome_FollowChoose_diamond"];
    }
    return _diamond;
}
@end

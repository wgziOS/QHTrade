//
//  AwesomeTableViewCell.m
//  QHTrade
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeTableViewCell.h"

@interface AwesomeTableViewCell()
@property(nonatomic,strong)UIImageView *icon;//头像
@property(nonatomic,strong)UILabel *awesomeName;//牛人名称
@property(nonatomic,strong)UIImageView *subscribeIcon;//订阅数图标
@property(nonatomic,strong)UILabel *subscribeNum;//订阅数
@property(nonatomic,strong)UILabel *minimumTrading;//最小交易值
@property(nonatomic,strong)UIButton *followAction;//跟单按钮
@property(nonatomic,strong)UIView *line;//分割线
@property(nonatomic,strong)UIImageView *tradingData;//交易数据
@property(nonatomic,strong)UIImageView *tradersPlan;//操盘计划
@property(nonatomic,strong)UILabel *earningsRate;//收益率
@property(nonatomic,strong)UILabel *todayEarningsRate;//今日收益率
@property(nonatomic,strong)UILabel *positionsUsage;//仓位使用率
@property(nonatomic,strong)UILabel *startTime;//开始时间
@property(nonatomic,strong)UILabel *endTime;//结束时间
@property(nonatomic,strong)UILabel *completed;//已完成
@property(nonatomic,strong)UIView *downLine;//分割线

@end


@implementation AwesomeTableViewCell


-(void)setupViews{
    
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setBackgroundColor:[UIColor clearColor]];
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.awesomeName];
    [self.contentView addSubview:self.subscribeIcon];
    [self.contentView addSubview:self.subscribeNum];
    [self.contentView addSubview:self.minimumTrading];
    [self.contentView addSubview:self.followAction];
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.tradingData];
    [self.contentView addSubview:self.tradersPlan];
    [self.contentView addSubview:self.earningsRate];
    [self.contentView addSubview:self.todayEarningsRate];
    [self.contentView addSubview:self.positionsUsage];
    [self.contentView addSubview:self.startTime];
    [self.contentView addSubview:self.endTime];
    [self.contentView addSubview:self.completed];
    [self.contentView addSubview:self.downLine];

    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints{
    [super updateConstraints];
    @weakify(self)
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(10);
        make.top.equalTo(self.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.awesomeName mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.contentView).with.offset(10);
        make.left.equalTo(self.icon.mas_right).with.offset(17);
        make.size.mas_offset(CGSizeMake(70, 14));
    }];
    [self.subscribeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.awesomeName.mas_right).with.offset(5);
        make.top.equalTo(self.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(8, 12));
    }];
    [self.subscribeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.subscribeIcon.mas_right).with.offset(3);
        make.top.equalTo(self.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(30, 12));
    }];
    [self.followAction mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.top.equalTo(self.contentView).with.offset(12);
        make.size.mas_offset(CGSizeMake(50, 25));
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
    [self.tradingData mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(10);
        make.top.equalTo(self.line.mas_bottom).with.offset(10);
        make.size.mas_offset(CGSizeMake(26, 25));
    }];

    [self.earningsRate mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(SCREEN_WIDTH*0.25);
        make.top.equalTo(self.line.mas_bottom).with.offset(8);
        make.size.mas_offset(CGSizeMake(50, 32));
    }];

    [self.todayEarningsRate mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(SCREEN_WIDTH*0.5);
        make.top.equalTo(self.line.mas_bottom).with.offset(8);
        make.size.mas_offset(CGSizeMake(55, 32));
    }];

    [self.positionsUsage mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(SCREEN_WIDTH*0.75);
        make.top.equalTo(self.line.mas_bottom).with.offset(8);
        make.size.mas_offset(CGSizeMake(55, 32));
    }];

    [self.tradersPlan mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(10);
        make.top.equalTo(self.tradingData.mas_bottom).with.offset(20);
        make.size.mas_offset(CGSizeMake(26, 25));
    }];

    [self.startTime mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(SCREEN_WIDTH*0.25);
        make.top.equalTo(self.tradingData.mas_bottom).with.offset(18);
        make.size.mas_offset(CGSizeMake(50, 32));
    }];
    [self.endTime mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(SCREEN_WIDTH*0.5);
        make.top.equalTo(self.tradingData.mas_bottom).with.offset(18);
        make.size.mas_offset(CGSizeMake(50, 32));
    }];
    [self.completed mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(SCREEN_WIDTH*0.75);
        make.top.equalTo(self.tradingData.mas_bottom).with.offset(18);
        make.size.mas_offset(CGSizeMake(50, 32));
    }];
    [self.downLine mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.tradersPlan.mas_bottom).with.offset(10);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 10));
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
        _awesomeName.textColor = RGB(117, 118, 119);
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
        _minimumTrading.textColor = RGB(138, 139, 140);
    }
    return _minimumTrading;
}

-(UIButton *)followAction{
    if (!_followAction) {
        _followAction = [UIButton buttonWithType:UIButtonTypeCustom];
        [_followAction setBackgroundColor:RGB(250, 99, 32)];
        [_followAction setTitle:@"跟单" forState:UIControlStateNormal];
        [_followAction setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _followAction.layer.masksToBounds = YES;
        _followAction.layer.cornerRadius = 3;
        [[_followAction rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.viewModel.awesomeFollowActionClick sendNext:nil];
        }];
        [_followAction.titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _followAction;
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = RGB(205, 207, 205);
    }
    return _line;
}
-(UIImageView *)tradingData{
    if (!_tradingData) {
        _tradingData = [[UIImageView alloc] init];
        _tradingData.image = [UIImage imageNamed:@"Awesome_tradingData_icon"];
        
    }
    return _tradingData;
}

-(UIImageView *)tradersPlan{
    if (!_tradersPlan) {
        _tradersPlan = [[UIImageView alloc] init];
        _tradersPlan.image = [UIImage imageNamed:@"Awesome_tradersPlan_icon"];

    }
    return _tradersPlan;
}

-(UILabel *)earningsRate{
    if (!_earningsRate) {
        _earningsRate = [[UILabel alloc] init];
        _earningsRate.numberOfLines = 0;
        _earningsRate.attributedText = [NSAttributedString getAttributedStringWithString:@"收益率\n100%" littlefont:10 bigFont:15 defultTextColor:RGB(87, 88, 89) specialColor:RGB(156, 157, 158) range:NSMakeRange(0, 3)];

    }
    return _earningsRate ;
}

-(UILabel *)todayEarningsRate{
    if (!_todayEarningsRate) {
        _todayEarningsRate = [[UILabel alloc] init];
        _todayEarningsRate.numberOfLines = 0;
        _todayEarningsRate.attributedText = [NSAttributedString getAttributedStringWithString:@"今日收益率\n100%" littlefont:10 bigFont:15 defultTextColor:RGB(87, 88, 89) specialColor:RGB(156, 157, 158) range:NSMakeRange(0, 5)];
        
    }
    return _todayEarningsRate ;
}

-(UILabel *)positionsUsage{
    if (!_positionsUsage) {
        _positionsUsage = [[UILabel alloc] init];
        _positionsUsage.numberOfLines = 0;
        _positionsUsage.attributedText =[NSAttributedString getAttributedStringWithString:@"仓位使用率\n100%" littlefont:10 bigFont:15 defultTextColor:RGB(87, 88, 89) specialColor:RGB(156, 157, 158) range:NSMakeRange(0, 5)];

    }
    return _positionsUsage;
}

-(UILabel *)startTime{
    if (!_startTime) {
        _startTime = [[UILabel alloc] init];
        _startTime.numberOfLines = 0;
        _startTime.attributedText = [NSAttributedString getAttributedStringWithString:@"开始时间\n06-20" littlefont:10 bigFont:15 defultTextColor:RGB(87, 88, 89) specialColor:RGB(156, 157, 158) range:NSMakeRange(0, 4)];
        
    }
    return _startTime;
}

-(UILabel *)endTime{
    if (!_endTime) {
        _endTime = [[UILabel alloc] init];
        _endTime.numberOfLines = 0;
        _endTime.attributedText = [NSAttributedString getAttributedStringWithString:@"结束时间\n08-23" littlefont:10 bigFont:15 defultTextColor:RGB(87, 88, 89) specialColor:RGB(156, 157, 158) range:NSMakeRange(0, 4)];
    }
    return _endTime;
}

-(UILabel *)completed{
    if (!_completed) {
        _completed = [[UILabel alloc] init];
        _completed.numberOfLines = 0;
        _completed.attributedText = [NSAttributedString getAttributedStringWithString:@"已完成\n8天" littlefont:10 bigFont:15 defultTextColor:RGB(87, 88, 89) specialColor:RGB(156, 157, 158) range:NSMakeRange(0, 3)];
    }
    return _completed;
}
-(UIView *)downLine{
    if (!_downLine) {
        _downLine = [[UIView alloc] init];
        _downLine.backgroundColor = RGB(232, 233, 234);
    }
    return _downLine;
}
@end

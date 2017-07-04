//
//  AwesomeDetailsHeadView.m
//  QHTrade
//
//  Created by user on 2017/7/4.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeDetailsHeadView.h"

@interface AwesomeDetailsHeadView()
@property(nonatomic,strong)UIImageView *icon;//头像
@property(nonatomic,strong)UILabel *awesomeName;//牛人名称
@property(nonatomic,strong)UIImageView *subscribeIcon;//订阅数图标
@property(nonatomic,strong)UILabel *subscribeNum;//订阅数
@property(nonatomic,strong)UILabel *minimumTrading;//最小交易值
@property(nonatomic,strong)UIButton *praise;//点赞按钮
@property(nonatomic,strong)UILabel *praiseAcount;//点赞数量
@property(nonatomic,strong)UIImageView *tradingData;//交易数据
@property(nonatomic,strong)UIImageView *tradersPlan;//操盘计划
@property(nonatomic,strong)UILabel *earningsRate;//收益率
@property(nonatomic,strong)UILabel *todayEarningsRate;//今日收益率
@property(nonatomic,strong)UILabel *positionsUsage;//仓位使用率
@property(nonatomic,strong)UILabel *startTime;//开始时间
@property(nonatomic,strong)UILabel *endTime;//结束时间
@property(nonatomic,strong)UILabel *completed;//已完成
@end


@implementation AwesomeDetailsHeadView
-(void)setupViews{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.icon];
    [self addSubview:self.awesomeName];
    [self addSubview:self.subscribeIcon];
    [self addSubview:self.subscribeNum];
    [self addSubview:self.minimumTrading];
    [self addSubview:self.praise];
    [self addSubview:self.praiseAcount];
    [self addSubview:self.tradingData];
    [self addSubview:self.tradersPlan];
    [self addSubview:self.earningsRate];
    [self addSubview:self.todayEarningsRate];
    [self addSubview:self.positionsUsage];
    [self addSubview:self.startTime];
    [self addSubview:self.endTime];
    [self addSubview:self.completed];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    @weakify(self)
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(10);
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
    
    [self.praise mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.right.equalTo(self.mas_right).with.offset(-20);
        make.top.equalTo(self).with.offset(10);
        make.size.mas_offset(CGSizeMake(15, 16));
    }];
    [self.praiseAcount mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.right.equalTo(self.praise.mas_left).with.offset(-7);
        make.top.equalTo(self).with.offset(12);
        make.size.mas_offset(CGSizeMake(180, 15));
    }];
    
    [self.minimumTrading mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.awesomeName.mas_bottom).with.offset(3);
        make.left.equalTo(self.icon.mas_right).with.offset(17);
        make.size.mas_offset(CGSizeMake(125, 15));
    }];
    
    [self.tradingData mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(12);
        make.top.equalTo(self.minimumTrading.mas_bottom).with.offset(10);
        make.size.mas_offset(CGSizeMake(26, 25));
    }];
    
    [self.earningsRate mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(SCREEN_WIDTH*0.25);
        make.top.equalTo(self.minimumTrading.mas_bottom).with.offset(8);
        make.size.mas_offset(CGSizeMake(50, 32));
    }];
    
    [self.todayEarningsRate mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(SCREEN_WIDTH*0.5);
        make.top.equalTo(self.minimumTrading.mas_bottom).with.offset(8);
        make.size.mas_offset(CGSizeMake(55, 32));
    }];
    
    [self.positionsUsage mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(SCREEN_WIDTH*0.75);
        make.top.equalTo(self.minimumTrading.mas_bottom).with.offset(8);
        make.size.mas_offset(CGSizeMake(55, 32));
    }];
    
    [self.tradersPlan mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(12);
        make.top.equalTo(self.tradingData.mas_bottom).with.offset(20);
        make.size.mas_offset(CGSizeMake(26, 25));
    }];
    
    [self.startTime mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(SCREEN_WIDTH*0.25);
        make.top.equalTo(self.tradingData.mas_bottom).with.offset(18);
        make.size.mas_offset(CGSizeMake(50, 32));
    }];
    
    [self.endTime mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(SCREEN_WIDTH*0.5);
        make.top.equalTo(self.tradingData.mas_bottom).with.offset(18);
        make.size.mas_offset(CGSizeMake(50, 32));
    }];
    
    [self.completed mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self).with.offset(SCREEN_WIDTH*0.75);
        make.top.equalTo(self.tradingData.mas_bottom).with.offset(18);
        make.size.mas_offset(CGSizeMake(50, 32));
    }];

}

-(NSAttributedString*)labelAddAttributedStringWith:(NSString*)text withRange:(NSRange)range{
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    paragraph.lineSpacing = 2; // 行距
    NSDictionary *attributedDic = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(87, 88, 89),NSParagraphStyleAttributeName:paragraph};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributedDic];
    [attributedString addAttribute:NSForegroundColorAttributeName value:RGB(156, 157, 158) range:range];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:range];
    return attributedString;
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

-(UIButton *)praise{
    if (!_praise) {
        _praise = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_praise setImage:[UIImage imageNamed:@"Awesome_praise_nomal"]
                 forState:UIControlStateNormal];
        [_praise setImage:[UIImage imageNamed:@"Awesome_praise_selected"]
                 forState:UIControlStateSelected];
        //        [_praise addTarget:self action:@selector(followEarningsClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praise;
}
-(UILabel *)praiseAcount{
    if (!_praiseAcount) {
        _praiseAcount = [[UILabel alloc] init];
        _praiseAcount.font = [UIFont systemFontOfSize:12];
        _praiseAcount.text = @"150赞";
        _praiseAcount.textColor = RGB(67, 68, 69);
        _praiseAcount.textAlignment = NSTextAlignmentRight;
        
    }
    return _praiseAcount;
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
        _earningsRate.attributedText = [self labelAddAttributedStringWith:@"收益率\n100%" withRange:NSMakeRange(0, 3)];
    }
    return _earningsRate ;
}

-(UILabel *)todayEarningsRate{
    if (!_todayEarningsRate) {
        _todayEarningsRate = [[UILabel alloc] init];
        _todayEarningsRate.numberOfLines = 0;
        _todayEarningsRate.attributedText =[self labelAddAttributedStringWith:@"今日收益率\n100%" withRange:NSMakeRange(0, 5)];
        
    }
    return _todayEarningsRate ;
}

-(UILabel *)positionsUsage{
    if (!_positionsUsage) {
        _positionsUsage = [[UILabel alloc] init];
        _positionsUsage.numberOfLines = 0;
        _positionsUsage.attributedText = [self labelAddAttributedStringWith:@"仓位使用率\n100%" withRange:NSMakeRange(0, 5)];
    }
    return _positionsUsage;
}

-(UILabel *)startTime{
    if (!_startTime) {
        _startTime = [[UILabel alloc] init];
        _startTime.numberOfLines = 0;
        _startTime.attributedText = [self labelAddAttributedStringWith:@"开始时间\n06-20" withRange:NSMakeRange(0, 4)];
    }
    return _startTime;
}

-(UILabel *)endTime{
    if (!_endTime) {
        _endTime = [[UILabel alloc] init];
        _endTime.numberOfLines = 0;
        _endTime.attributedText =[self labelAddAttributedStringWith:@"结束时间\n08-23" withRange:NSMakeRange(0, 4)];
        
    }
    return _endTime;
}

-(UILabel *)completed{
    if (!_completed) {
        _completed = [[UILabel alloc] init];
        _completed.numberOfLines = 0;
        _completed.attributedText =[self labelAddAttributedStringWith:@"已完成\n8天" withRange:NSMakeRange(0, 3)];
    }
    return _completed;
}
@end

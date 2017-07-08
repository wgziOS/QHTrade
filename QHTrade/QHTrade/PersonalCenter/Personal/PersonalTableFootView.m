//
//  PersonalTableFootView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/4.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalTableFootView.h"

@interface PersonalTableFootView ()

@end

@implementation PersonalTableFootView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{

    self.viewModel = (PersonalViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildViews];
    }
    return self;
}

-(void)addChildViews{
    WS(weakSelf)
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.subTitleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf).with.offset(6);
        make.left.equalTo(weakSelf).with.offset(16);
        make.size.mas_offset(CGSizeMake(100, 18));
    }];

    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).with.offset(3);
        make.left.equalTo(weakSelf).with.offset(16);
        make.size.mas_offset(CGSizeMake(250, 16));
    }];
    
    //折线图
    
    NSArray *data = [NSArray arrayWithObjects:
                     
                     [NSValue valueWithCGPoint:CGPointMake(1, 10)],
                     [NSValue valueWithCGPoint:CGPointMake(1.2, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(1.4, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(1.6, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(2, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(2.2, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(2.4, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(2.6, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(3, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(3.2, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(3.4, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(3.6, 20)],
                     [NSValue valueWithCGPoint:CGPointMake(4, 20)],
                     [NSValue valueWithCGPoint:CGPointMake(4.2, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(4.4, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(4.6, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(5, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(5.2, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(5.4, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(5.6, 120)],
                     [NSValue valueWithCGPoint:CGPointMake(6, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(6.2, 60)],
                     nil];
    
    self.lineChartView = [[QHLineChartView alloc] initWithFrame:CGRectMake(15, 50, SCREEN_WIDTH-30, 220)];
    [self.lineChartView setMin_X:1];
    [self.lineChartView setMax_X:6];
    [self.lineChartView setMin_Y:0];
    [self.lineChartView setMax_Y:120];
    [self.lineChartView setData:data];
    [self.lineChartView setX_labels:@[@"6/1",@"6/2",@"6/3",@"6/4",@"6/5",@"6/6"]];
    [self.lineChartView setY_labels:@[@"0",@"10",@"20",@"30",@"40",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120"]];

    [self addSubview:self.lineChartView];
}


-(UILabel *)subTitleLabel{

    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.text = @"每个交易日下午15点后结算，21点前更新";
        _subTitleLabel.textColor = RGB(141, 140, 140);
        _subTitleLabel.font = [UIFont systemFontOfSize:12.0f];
    }
    return _subTitleLabel;
}
-(UILabel *)titleLabel{

    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"总收益曲线";
        _titleLabel.textColor = RGB(51, 51, 51);
        _titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _titleLabel;
}

@end

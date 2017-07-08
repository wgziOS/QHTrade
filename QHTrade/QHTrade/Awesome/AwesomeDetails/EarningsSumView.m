//
//  EarningsSumView.m
//  QHTrade
//
//  Created by user on 2017/7/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "EarningsSumView.h"
#import "QHLineChartView.h"
#import "AwesomeDetailsViewModel.h"

@interface EarningsSumView()
@property(nonatomic,strong)QHLineChartView *lineChartView;
@property(nonatomic,strong)AwesomeDetailsViewModel *viewModel;
@property(nonatomic,strong)UILabel *title;
@end

@implementation EarningsSumView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (AwesomeDetailsViewModel*)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.title];
    [self addSubview:self.lineChartView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(16);
        make.top.equalTo(weakSelf).with.offset(9);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 13));
    }];
    [self.lineChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.title.mas_bottom);
    }];
}
-(void)bindViewModel{
    [self.viewModel.earningsSumDataSubject subscribeNext:^(id  _Nullable x) {
        
    }];
}
-(void)setData:(NSArray *)data{
    NSArray *dataa = [NSArray arrayWithObjects:
                     [NSValue valueWithCGPoint:CGPointMake(1, 10)],
                     [NSValue valueWithCGPoint:CGPointMake(1.2, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(1.4, 52)],
                     [NSValue valueWithCGPoint:CGPointMake(1.6, 22)],
                     [NSValue valueWithCGPoint:CGPointMake(2, 65)],
                     [NSValue valueWithCGPoint:CGPointMake(2.2, 34)],
                     [NSValue valueWithCGPoint:CGPointMake(2.4, 55)],
                     [NSValue valueWithCGPoint:CGPointMake(2.6, 78)],
                     [NSValue valueWithCGPoint:CGPointMake(3, 98)],
                     [NSValue valueWithCGPoint:CGPointMake(3.2, 99)],
                     [NSValue valueWithCGPoint:CGPointMake(3.4, 100)],
                     [NSValue valueWithCGPoint:CGPointMake(3.6, 101)],
                     [NSValue valueWithCGPoint:CGPointMake(4, 88)],
                     [NSValue valueWithCGPoint:CGPointMake(4.2, 55)],
                     [NSValue valueWithCGPoint:CGPointMake(4.4, 32)],
                     [NSValue valueWithCGPoint:CGPointMake(4.6, 41)],
                     [NSValue valueWithCGPoint:CGPointMake(5, 50)],
                     [NSValue valueWithCGPoint:CGPointMake(5.2, 21)],
                     [NSValue valueWithCGPoint:CGPointMake(5.4, 67)],
                     [NSValue valueWithCGPoint:CGPointMake(5.6, 75)],
                     [NSValue valueWithCGPoint:CGPointMake(6, 59)],
                     [NSValue valueWithCGPoint:CGPointMake(6.6, 90)],
                     nil];
    [self.lineChartView setMin_X:1];
    [self.lineChartView setMax_X:6.6];
    [self.lineChartView setMin_Y:0];
    [self.lineChartView setMax_Y:120];
    [self.lineChartView setData:dataa];
    [self.lineChartView setX_labels:@[@"02/12",@"06/12",@"03/13",@"03/14",@"12/25",@"12/26"]];
    [self.lineChartView setY_labels:@[@"0",@"10",@"20",@"30",@"40",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120"]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(QHLineChartView *)lineChartView{
    if (!_lineChartView) {
        _lineChartView = [[QHLineChartView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-385)];
        _lineChartView.backgroundColor = [UIColor greenColor];
    }
    return _lineChartView;
}
-(UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.textColor = RGB(140, 140, 140);
        _title.text = @"每个交易日下午15点后结算,21点前更新";
        _title.font = [UIFont systemFontOfSize:12];
    }
    return _title;
}
@end

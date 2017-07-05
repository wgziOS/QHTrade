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
    [self addSubview:self.lineChartView];
    [self addSubview:self.title];
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
//    [self.lineChartView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(weakSelf);
//    }];
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
        _lineChartView = [[QHLineChartView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-415)];
        [_lineChartView setMin_X:1];
        [_lineChartView setMax_X:6];
        [_lineChartView setMin_Y:0];
        [_lineChartView setMax_Y:120];
        [_lineChartView setData:data];
        [_lineChartView setX_labels:@[@"6/1",@"6/2",@"6/3",@"6/4",@"6/5",@"6/6"]];
        [_lineChartView setY_labels:@[@"0",@"10",@"20",@"30",@"40",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120"]];
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

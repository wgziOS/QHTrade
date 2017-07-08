//
//  TradingInformationView.m
//  QHTrade
//
//  Created by user on 2017/7/4.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "TradingInformationView.h"
#import "AwesomeDetailsViewModel.h"
#import "SegmentedControlView.h"
#import "TradingSignalsView.h"
#import "MyWarehouseView.h"
#import "EarningsSumView.h"


@interface TradingInformationView()
@property(nonatomic,strong)AwesomeDetailsViewModel *viewModel;
@property(nonatomic,strong)SegmentedControlView *segmentedControl;
@property(nonatomic,strong)TradingSignalsView *tradingSignalsView;
@property(nonatomic,strong)MyWarehouseView *myWarehouseView;
@property(nonatomic,strong)EarningsSumView *earningSumView;
@property(nonatomic,weak)BaseView *oldView;
@end

@implementation TradingInformationView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (AwesomeDetailsViewModel*)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.segmentedControl];
    [self addSubview:self.tradingSignalsView];
    [self addSubview:self.earningSumView];
    
    self.oldView = self.earningSumView;
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    
    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.equalTo(weakSelf);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 30));
    }];
    [self.oldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentedControl.mas_bottom);
        make.centerX.equalTo(self);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-365));
    }];
}
-(void)changeChlidView:(int)index{
    switch (index) {
        case 0:
            [self.oldView removeFromSuperview];
            [self addSubview:self.earningSumView];
            self.oldView = self.earningSumView;
            break;
        case 1:
            [self.oldView removeFromSuperview];
            [self addSubview:self.myWarehouseView];
            self.oldView = self.myWarehouseView;
            break;
        case 2:
            [self.oldView removeFromSuperview];
            [self addSubview:self.tradingSignalsView];
            self.oldView = self.tradingSignalsView;
            break;
            
        default:
            break;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(TradingSignalsView *)tradingSignalsView{
    if (!_tradingSignalsView) {
        _tradingSignalsView = [[TradingSignalsView alloc] initWithViewModel:self.viewModel];
    }
    return _tradingSignalsView;
}
-(MyWarehouseView *)myWarehouseView{
    if (!_myWarehouseView) {
        _myWarehouseView = [[MyWarehouseView alloc] initWithViewModel:self.viewModel];
    }
    return _myWarehouseView;
}
-(EarningsSumView *)earningSumView{
    if (!_earningSumView) {
        _earningSumView = [[EarningsSumView alloc] initWithViewModel:self.viewModel];
        _earningSumView.data = [NSArray array];
    }
    return _earningSumView;
}
-(SegmentedControlView *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[SegmentedControlView alloc] initWithSize:CGSizeMake(SCREEN_WIDTH, 30)
                                                           defultTitle:[UIColor blackColor]
                                                         selectedTitle:[UIColor whiteColor]
                                                              defultBg:[UIColor whiteColor]
                                                            selectedBg:RGB(250, 99, 32)
                                                              withFont:15
                                                       borderWithColor:RGB(215, 215, 215)
                                                            itemsArray:[NSArray arrayWithObjects:@"总收益曲线",@"他的持仓",@"交易信号", nil]
                             ];
        @weakify(self)
        _segmentedControl.itemClick = ^(int index) {
            @strongify(self)
            [self changeChlidView:index];
        };
        
    }
    return _segmentedControl;
}
@end

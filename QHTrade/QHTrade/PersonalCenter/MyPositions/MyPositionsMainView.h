//
//  MyPositionsMainView.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/8.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseView.h"
#import "MyPositionsViewModel.h"
#import "SegmentedControlView.h"
#import "TradingSignalsView.h"
#import "MyWarehouseView.h"

@interface MyPositionsMainView : BaseView

@property (nonatomic,strong) MyPositionsViewModel *viewModel;

@property (nonatomic,strong) SegmentedControlView *segmentedControl;
@property (nonatomic,strong) TradingSignalsView *tradingSignalsView;
@property (nonatomic,strong) MyWarehouseView *myWarehouseView;
@end

//
//  AwesomeDetailsViewModel.h
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseViewModel.h"

@interface AwesomeDetailsViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *tradingSignalsArray;
@property(nonatomic,strong)RACSubject *tradersInstructionsOpenSubject;//操作说明展开
@end

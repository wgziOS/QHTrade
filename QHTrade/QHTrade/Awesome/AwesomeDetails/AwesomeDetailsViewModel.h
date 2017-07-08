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
@property(nonatomic,strong)RACSubject *earningsSumDataSubject;//收益折现图数据发送
@property(nonatomic,copy)NSString *tradersInstructionsString;//操盘说明内容;
@property(nonatomic,assign)CGFloat tradersInstructionsHeight;//操盘说明内容高度;
@end

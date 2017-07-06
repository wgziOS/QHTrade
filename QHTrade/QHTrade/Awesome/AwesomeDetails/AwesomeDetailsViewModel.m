//
//  AwesomeDetailsViewModel.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeDetailsViewModel.h"

@implementation AwesomeDetailsViewModel

-(RACSubject *)tradersInstructionsOpenSubject{
    if (!_tradersInstructionsOpenSubject) {
        _tradersInstructionsOpenSubject = [RACSubject subject];
    }
    return _tradersInstructionsOpenSubject;
}
-(NSMutableArray *)tradingSignalsArray{
    if (!_tradingSignalsArray) {
        _tradingSignalsArray = [[NSMutableArray alloc] init];
    }
    return _tradingSignalsArray;
}
@end


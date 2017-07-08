//
//  TradeAccountViewModel.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/6.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "TradeAccountViewModel.h"

@implementation TradeAccountViewModel

-(RACSubject *)searchSubject{

    if (!_searchSubject) {
        _searchSubject = [RACSubject subject];
    }
    return _searchSubject;

}

-(RACSubject *)tickClickSubject{

    if (!_tickClickSubject) {
        _tickClickSubject = [RACSubject subject];
    }
    return _tickClickSubject;
}
@end

//
//  FollowEarningsDetailsViewModel.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningsDetailsViewModel.h"

@implementation FollowEarningsDetailsViewModel


-(RACCommand *)followRarningsCommand{
    if (!_followRarningsCommand) {
//        _FollowRarningsCommand = [RACCommand ]
    }
    return _followRarningsCommand;
}

-(RACSubject *)awesomeClickSubject{
    if (!_awesomeClickSubject) {
        _awesomeClickSubject = [RACSubject subject];
    }
    return _awesomeClickSubject;
}
-(NSDictionary *)dataDictionary{
    if (!_dataDictionary) {
        _dataDictionary = [[NSDictionary alloc] init];
        
    }
    return _dataDictionary;
}
-(RACSubject *)followRarningsSubject{
    if (!_followRarningsSubject) {
        _followRarningsSubject = [RACSubject subject];
    }
    return _followRarningsSubject;
}
@end

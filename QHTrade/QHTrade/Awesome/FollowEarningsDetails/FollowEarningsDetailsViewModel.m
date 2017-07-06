//
//  FollowEarningsDetailsViewModel.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningsDetailsViewModel.h"

@implementation FollowEarningsDetailsViewModel

-(RACSubject *)awesomeClickSubject{
    if (!_awesomeClickSubject) {
        _awesomeClickSubject = [RACSubject subject];
    }
    return _awesomeClickSubject;
}
@end

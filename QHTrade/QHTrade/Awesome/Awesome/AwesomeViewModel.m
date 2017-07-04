
//
//  AwesomeViewModel.m
//  QHTrade
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeViewModel.h"
#import "AwesomeModel.h"


@implementation AwesomeViewModel



-(NSMutableArray *)awesomeDataArray{
    if (!_awesomeDataArray) {
        _awesomeDataArray = [[NSMutableArray alloc] init];
    }
    return _awesomeDataArray;
}
-(NSMutableArray *)canFollowDataArray{
    if (!_canFollowDataArray) {
        _canFollowDataArray = [[NSMutableArray alloc] init];
    }
    return _canFollowDataArray;
}
-(NSMutableArray *)rookieDataArray{
    if (!_rookieDataArray) {
        _rookieDataArray = [[NSMutableArray alloc] init];
    }
    return _rookieDataArray;
}

-(RACSubject *)followEarningsCellClick{
    if (!_followEarningsCellClick) {
        _followEarningsCellClick = [RACSubject subject];
    }
    return _followEarningsCellClick;
}

-(RACSubject *)awesomeCellClick{
    if (!_awesomeCellClick) {
        _awesomeCellClick = [RACSubject subject];
    }
    return _awesomeCellClick;
}
-(RACSubject *)awesomeFollowCellClick{
    if (!_awesomeFollowCellClick) {
        _awesomeFollowCellClick = [RACSubject subject];
    }
    return _awesomeFollowCellClick;
}
-(RACSubject *)rookieCellClick{
    if (!_rookieCellClick) {
        _rookieCellClick = [RACSubject subject];
    }
    return _rookieCellClick;
}
-(RACSubject *)canFollowCellClick{
    if (!_canFollowCellClick) {
        _canFollowCellClick = [RACSubject subject];
    }
    return _canFollowCellClick;
}
@end

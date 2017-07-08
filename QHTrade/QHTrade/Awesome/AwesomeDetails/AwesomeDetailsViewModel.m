//
//  AwesomeDetailsViewModel.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeDetailsViewModel.h"

@implementation AwesomeDetailsViewModel

//收益折现图数据发送
-(RACSubject *)earningsSumDataSubject{
    if (!_earningsSumDataSubject) {
        _earningsSumDataSubject = [RACSubject subject];
    }
    return _earningsSumDataSubject;
}
//操作说明展开
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
-(NSString *)tradersInstructionsString{
    if (!_tradersInstructionsString) {
        _tradersInstructionsString = [NSString stringWithFormat:@"跟单后按照牛人的成交手数1比1跟单，若发生滑点情况，2秒内不能成交，撤单，以牛人成交价+1跳跟单，2秒内不能成交，撤单并再加2跳点后再报；再报后2秒内还不能成交，撤单，以再加2跳点再报，如还未成交则牛人该笔交易不跟单。半自动跟单需用户每日两次登录资金账户后，才会开始自动跟单，登录一次持续一个白盘或夜盘。"];
    }
    return _tradersInstructionsString;
}
-(CGFloat )tradersInstructionsHeight{
    if (!_tradersInstructionsHeight) {
        CGSize size = [NSAttributedString getTextSizeWithText:self.tradersInstructionsString withMaxSize:CGSizeMake(SCREEN_WIDTH-32, MAXFLOAT) withLineSpacing:0];
        _tradersInstructionsHeight = size.height;
    }
    return _tradersInstructionsHeight;
}
@end


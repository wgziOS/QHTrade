//
//  SettingViewModel.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/26.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "SettingViewModel.h"

@implementation SettingViewModel

-(RACSubject *)changePhoneClick{

    if (!_changePhoneClick) {
        _changePhoneClick = [RACSubject subject];
    }
    return _changePhoneClick;
}

-(RACSubject *)cellClick{
    if (!_cellClick) {
        _cellClick = [RACSubject subject];
    }
    return _cellClick;
}
@end

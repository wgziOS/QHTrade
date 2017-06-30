//
//  AccountSetViewModel.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/27.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AccountSetViewModel.h"

@implementation AccountSetViewModel
-(RACSubject *)cellClick{

    if (!_cellClick) {
        _cellClick = [RACSubject subject];
    }
    return _cellClick;
}
@end

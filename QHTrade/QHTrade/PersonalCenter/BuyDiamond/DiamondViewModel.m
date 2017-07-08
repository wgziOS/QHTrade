//
//  DiamondViewModel.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "DiamondViewModel.h"

@implementation DiamondViewModel




-(RACSubject *)commitBtnSubjet{

    if (!_commitBtnSubjet) {
        _commitBtnSubjet = [RACSubject subject];
    }
    return _commitBtnSubjet;
}
@end

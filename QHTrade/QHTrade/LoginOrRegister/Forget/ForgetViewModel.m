//
//  ForgetViewModel.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/8.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "ForgetViewModel.h"

@implementation ForgetViewModel




//-(RACCommand *)commitCommand{
//
//    
//}
-(RACSubject *)getCodeSubject{

    if (!_getCodeSubject) {
        _getCodeSubject = [RACSubject subject];
    }
    return _getCodeSubject;
}
@end

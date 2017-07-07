//
//  TradeAccountViewModel.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/6.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseViewModel.h"

@interface TradeAccountViewModel : BaseViewModel
@property (nonatomic,strong) RACSubject *tickClickSubject;

@property (nonatomic,strong) RACSubject *searchSubject;
@end

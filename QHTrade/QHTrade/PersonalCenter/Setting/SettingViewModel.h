//
//  SettingViewModel.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/26.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseViewModel.h"

@interface SettingViewModel : BaseViewModel

@property (nonatomic,strong) RACSubject *cellClick;
@property (nonatomic,strong) RACSubject *changePhoneClick;
@end

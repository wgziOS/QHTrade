//
//  PersonalViewModel.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseViewModel.h"

@interface PersonalViewModel : BaseViewModel

@property (nonatomic,strong) RACSubject *headImgClick;//头像
@property (nonatomic,strong) RACSubject *questionClick;//问号
@property (nonatomic,strong) RACSubject *visitorsClick;//访客Visitors
@property (nonatomic,strong) RACSubject *focusClick;
@property (nonatomic,strong) RACCommand *userInfoCommand;
@property (nonatomic,strong) RACSubject *refreshUI;//刷新信号
@end

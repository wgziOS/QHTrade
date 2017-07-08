//
//  PersonalViewModel.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseViewModel.h"

@interface PersonalViewModel : BaseViewModel

@property (nonatomic,strong) RACSubject *tradeAccountLoginBtnClick;//交易账户登录
@property (nonatomic,strong) RACSubject *setBtnClick;//设置
@property (nonatomic,strong) RACSubject *diamondBtnClick;//钻石
@property (nonatomic,strong) RACSubject *middleCellClick;//中间btn点击
@property (nonatomic,strong) RACSubject *positionsClick;//持仓点击

@property (nonatomic,strong) RACSubject *headImgClick;//头像
@property (nonatomic,strong) RACSubject *questionClick;//问号
@property (nonatomic,strong) RACSubject *visitorsClick;//访客Visitors
@property (nonatomic,strong) RACSubject *focusClick;
@property (nonatomic,strong) RACCommand *userInfoCommand;
@property (nonatomic,strong) RACSubject *refreshUI;//刷新信号

@end

//
//  FollowEarningsDetailsViewModel.h
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseViewModel.h"

@interface FollowEarningsDetailsViewModel : BaseViewModel
@property(nonatomic,strong)RACSubject *followRarningsSubject;//跟单详情数据发送
@property(nonatomic,strong)RACCommand *followRarningsCommand;//跟单详情数据请求
@property(nonatomic,strong)RACSubject *awesomeClickSubject;//点击查看牛人信息
@property(nonatomic,strong)NSDictionary *dataDictionary;
@end

//
//  AwesomeViewModel.h
//  QHTrade
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseViewModel.h"

@interface AwesomeViewModel : BaseViewModel
@property(nonatomic,strong)NSMutableArray *awesomeDataArray;//牛人数据
@property(nonatomic,strong)NSMutableArray *rookieDataArray;//新秀数据
@property(nonatomic,strong)NSMutableArray *canFollowDataArray;//可跟单数据
@property(nonatomic,strong)RACSubject *followEarningsCellClick;//跟单收益榜cell点击
@property(nonatomic,strong)RACSubject *awesomeCellClick;//牛人cell点击
@property(nonatomic,strong)RACSubject *rookieCellClick;//牛人cell点击
@property(nonatomic,strong)RACSubject *canFollowCellClick;//牛人cell点击
@property(nonatomic,strong)RACSubject *awesomeFollowActionClick;//跟单按钮点击
@end

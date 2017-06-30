//
//  PersonalModel.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/29.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalModel : NSObject

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,strong) NSString *fans;
@property (nonatomic,strong) NSString *follows;
@property (nonatomic,strong) NSString *diamond;
@property (nonatomic,strong) NSString *todayViewCount;
@property (nonatomic,strong) NSString *totalViewCount;
/*
 1、userName				昵称
	2、id					id
	3、gender				性别 1 男 2女 3其他
	4、fans					粉丝数
	5、follows				关注数
	6、diamond				钻石数
	7、todayViewCount		今日访客数
	8、totalViewCount		总访问数
 */
@end

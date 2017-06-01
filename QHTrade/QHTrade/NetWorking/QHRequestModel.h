//
//  QHRequestModel.h
//  QHTrade
//
//  Created by user on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QHRequestModel : NSObject
@property(nonatomic,copy)NSString *Code;
@property(nonatomic,strong)id Data;
@property(nonatomic,copy)NSString *Message;
@property(nonatomic,copy)NSString *State;
@end

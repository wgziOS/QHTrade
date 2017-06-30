//
//  UserInformation.h
//  QHTrade
//
//  Created by user on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject
+(UserInformation*)getInformation;
//转bsae64方法
+ (NSString *)transBase64WithImage:(UIImage *)image;

-(void)PostUserInformationDataWithUserId:(NSString *)userid andtoken:(NSString*)token andPhoneNumber:(NSString *)phoneNumber;
-(NSMutableDictionary *)getUserInformationData;
-(void)cleanUserInfo;
@end

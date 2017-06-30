//
//  UserInformation.m
//  QHTrade
//
//  Created by user on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation
+(UserInformation*)getInformation{
    static UserInformation *userInfor;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        userInfor = [[UserInformation alloc] init];
        
    });
    
    return userInfor;
}

-(void)PostUserInformationDataWithUserId:(NSString *)userid andtoken:(NSString*)token andPhoneNumber:(NSString *)phoneNumber
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userid forKey:@"userId"];
    [defaults setObject:token forKey:@"token"];
    [defaults setObject:phoneNumber forKey:@"phoneNumber"];
}

-(NSMutableDictionary *)getUserInformationData{
    NSMutableDictionary *infoDictionary = [[NSMutableDictionary alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [infoDictionary setObject:[defaults objectForKey:@"userId"] forKey:@"userId"];
    [infoDictionary setObject:[defaults objectForKey:@"token"] forKey:@"token"];
    
    
    
    return infoDictionary;
}

-(void)cleanUserInfo{
    
    NSString * str  = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    NSString * str1  = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSString * str2  = [[NSUserDefaults standardUserDefaults] objectForKey:@"phoneNumber"];
    
    if (str.length > 0 && str1.length >0 && str2.length > 0) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userId"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"phoneNumber"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
}
//转bsae64方法
+ (NSString *)transBase64WithImage:(UIImage *)image{
    
    NSData* imgData = UIImageJPEGRepresentation(image, 0.1f);
    
    NSString *encodedImageStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSString *string = [NSString stringWithFormat:@"data:image/png;base64,%@",encodedImageStr];
    
    return string;
}
@end

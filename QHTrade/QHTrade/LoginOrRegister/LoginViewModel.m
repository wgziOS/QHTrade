//
//  LoginViewModel.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/9.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (RACSignal *)signInSiganl{

    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       
        [self signInWithPhoneNum:self.phoneNumStr passWord:self.passWordStr complete:^(QHRequestModel* responsObject) {
            [subscriber sendNext:responsObject];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}


-(instancetype)init{

    if (self = [super init]) {
        
        RACSignal * phoneNumLengthSig = [RACObserve(self, phoneNumStr) map:^id _Nullable(NSString * value) {
            if (value.length == 11) return @(YES);
            
            return @(NO);
        }];
        
        RACSignal * passWordLengthSig = [RACObserve(self, passWordStr) map:^id _Nullable(NSString * value) {
            if (value.length>=6) {
                return @(YES);
            }
            return @(NO);
        }];
        
        _loginBtnEnable = [RACSignal combineLatest:@[phoneNumLengthSig,passWordLengthSig] reduce:^id (NSNumber * phoneNum, NSNumber * passWord){
            return @([phoneNum boolValue] && [passWord boolValue]);
        }];
        
        _loginCommand = [[RACCommand alloc]initWithEnabled:_loginBtnEnable signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [self signInSiganl];
        }];
        
        
        
    }
    return self;
}
#pragma mark -网络请求
- (void)signInWithPhoneNum:(NSString *)phoneNum passWord:(NSString *)passWord complete:(void(^)(QHRequestModel* responsObject))completeBlock {
    
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    parameter[@"mobile"] = phoneNum;
    parameter[@"password"] = passWord;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSError * error;
        QHRequestModel * model = [QHRequest postDataWithApi:@"/tokens" withParam:parameter error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (error == nil) {
                
            }else{
                [MBProgressHUD showError:@"网络正在开小差"];
            }
            completeBlock(model);
        });
        
    });


}
-(RACSubject *)quickSubject{

    if (!_quickSubject) {
        _quickSubject = [[RACSubject alloc]init];
    }
    return _quickSubject;
}
-(RACSubject *)forgetSubject{

    if (!_forgetSubject) {
        _forgetSubject = [[RACSubject alloc]init];
    }
    return _forgetSubject;
}

@end

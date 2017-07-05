//
//  PersonalViewModel.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalViewModel.h"
#import "PersonalModel.h"
@implementation PersonalViewModel

-(void)initialize{

//    WS(weakself)
    
    [self.userInfoCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
       
        NSLog(@"%@",x);
        PersonalModel * model = [PersonalModel mj_objectWithKeyValues:x];
        
        NSLog(@"%@",model.gender);
        [self.refreshUI sendNext:model];
    }];
    
}
-(RACSubject *)refreshUI{

    if (!_refreshUI) {
        _refreshUI = [RACSubject subject];
    }
    return _refreshUI;
}

-(RACCommand *)userInfoCommand{

    if (!_userInfoCommand) {
        
        _userInfoCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
               
                loading(@"获取个人信息")
               
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    
                    NSError * error;
                    QHRequestModel * model = [QHRequest getDataWithApi:@"/users" withParam:nil error:&error];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        hiddenHUD;
                        if (error == nil) {
                            
                            if ([model.status intValue] == 200) {
                                
                                [subscriber sendNext:model.content];
                            }else [subscriber sendNext:nil];
                            
                        }else{
                            [subscriber sendCompleted];
                            [MBProgressHUD showError:@"网络正在开小差"];
                        }
                    });
                    
                });
                
                return nil;
            }];
        }];
    }
    return _userInfoCommand;
}
-(RACSubject *)middleCellClick{

    if (!_middleCellClick) {
        _middleCellClick = [RACSubject subject];
    }
    return _middleCellClick;
}
-(RACSubject *)tradeAccountLoginBtnClick{

    if (!_tradeAccountLoginBtnClick) {
        _tradeAccountLoginBtnClick = [RACSubject subject];
    }
    return _tradeAccountLoginBtnClick;
}
-(RACSubject *)diamondBtnClick{

    if (!_diamondBtnClick) {
        _diamondBtnClick = [RACSubject subject];
    }
    return _diamondBtnClick;

}
-(RACSubject *)setBtnClick{

    if (!_setBtnClick) {
        _setBtnClick = [RACSubject subject];
    }
    return _setBtnClick;
}
-(RACSubject *)focusClick{

    if (!_focusClick) {
        _focusClick = [RACSubject subject];
    }
    return _focusClick;
}
-(RACSubject *)visitorsClick{

    if (!_visitorsClick) {
        _visitorsClick = [RACSubject subject];
    }
    return _visitorsClick;
}
-(RACSubject *)questionClick{

    if (!_questionClick) {
        _questionClick = [RACSubject subject];
    }
    return _questionClick;
}
-(RACSubject *)headImgClick{
    if (!_headImgClick) {
        _headImgClick = [RACSubject subject];
    }
    return _headImgClick;
}
@end

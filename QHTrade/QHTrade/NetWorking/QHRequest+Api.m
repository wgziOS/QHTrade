//
//  QHRequest+Api.m
//  QHTrade
//
//  Created by user on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "QHRequest+Api.h"

@implementation QHRequest (Api)

+(QHRequestModel *)postDataWithApi:(NSString *)api withParam:(NSDictionary *)data_dic error:(NSError *__autoreleasing *)error{
    
    NSString *request_Url = [NSString stringWithFormat:@"%@%@",HostUrlBak,api];
    __block QHRequestModel *model=nil;
    __block NSError *blockError = nil;
    
    [[QHRequest request] POST:request_Url
                   parameters:data_dic
                      success:^(QHRequest *request, id response) {
                          model = [QHRequestModel mj_objectWithKeyValues:response];
                      }
                      failure:^(QHRequest *request, NSError *error) {
                          blockError = error;
                      }];
    if (!blockError) {
        *error = blockError;
    }
    return model;
}

+(QHRequestModel *)postImageWithApi:(NSString *)api withParam:(NSDictionary*)data_dic
                              error:(NSError* __autoreleasing*)error{
    NSString *request_Url = [NSString stringWithFormat:@"%@%@",HostUrlBak,api];
    __block QHRequestModel *model=nil;
    __block NSError *blockError = nil;
    
    [[QHRequest request] POSTUploadImageWithURLString:request_Url
                                           parameters:data_dic
                                              success:^(QHRequest *request, id response) {
                                                  model = [QHRequestModel mj_objectWithKeyValues:response];
                                                  
                                              }
                                              failure:^(QHRequest *request, NSError *error) {
                                                  blockError = error;
                                                  
                                              }];
    
    if (!blockError) {
        *error = blockError;
    }
    return model;
    
    
}

+(QHRequestModel *)getDataWithApi:(NSString *)api withParam:(NSDictionary *)data_dic error:(NSError *__autoreleasing *)error{
    NSString *request_Url = [NSString stringWithFormat:@"%@%@",HostUrlBak,api];
    __block QHRequestModel *model=nil;
    __block NSError *blockError = nil;
    
    [[QHRequest request] GET:request_Url parameters:data_dic success:^(QHRequest *request, id response) {
        model = [QHRequestModel mj_objectWithKeyValues:response];
    } failure:^(QHRequest *request, NSError *error) {
        blockError = error;
    }];
//    [[QHRequest request] POST:request_Url
//                   parameters:data_dic
//                      success:^(QHRequest *request, id response) {
//                          model = [QHRequestModel mj_objectWithKeyValues:response];
//                      }
//                      failure:^(QHRequest *request, NSError *error) {
//                          blockError = error;
//                      }];
    if (!blockError) {
        *error = blockError;
    }
    return model;
}


@end

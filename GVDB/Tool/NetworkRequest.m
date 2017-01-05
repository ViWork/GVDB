//
//  NetworkRequest.m
//  networkrequest
//
//  Created by Hunter on 2016/12/20.
//  Copyright © 2016年 Hunter. All rights reserved.
//

#import "NetworkRequest.h"
#import <AFHTTPSessionManager.h>
@implementation NetworkRequest

+ (void)LogininfoRequestWithUrl:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)success Failure:(FailureBlock)failure{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager.securityPolicy setAllowInvalidCertificates:NO];
    [manager POST:url parameters:parameters  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


+ (void)requestForPhoneCodeURL:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)success Failure:(FailureBlock)failure{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
//    [manager.securityPolicy setAllowInvalidCertificates:NO];
    [manager POST:url parameters:parameters  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+(void)requestDataWithURL:(NSString *)url params:(id)params successBlock:(SuccessBlock)success failure:(FailureBlock)failure
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager] ;
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"] ;
    [manager POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        success(responseObject) ;
        NSLog(@"~~%@",success) ;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error) ;
         NSLog(@"~~%@",failure) ;
    }] ;
    
}
@end

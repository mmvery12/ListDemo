//
//  HttpClient.m
//  Demo1
//
//  Created by 李煜昌 on 14-5-27.
//  Copyright (c) 2014年 VACN. All rights reserved.
//



#import "HttpClient.h"
#import "JSONKit.h"
#import "AFNetworking.h"

@implementation HttpClient

//#pragma - mark net request
//
//#pragma mark method="get";
//
//
//
//+ (void) sendGetRequestUrl:(NSString *) url parameters:(NSString *)parameters success:(successBlock) succblock failure:(failureBlock) failblock{
//   
//    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    manager.requestSerializer.timeoutInterval = 60;
//    manager.requestSerializer.cachePolicy=NSURLRequestReloadIgnoringCacheData;
//    [manager GET:url parameters:@{@"RequestJson":parameters} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
//    
//}


#pragma mark method="post"


+ (void)sendPostRequestUrl:(NSString *)url parameters:(NSDictionary *)dict success:(successBlock)succblock failure:(failureBlock)failblock{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer.timeoutInterval = 60;
    manager.requestSerializer.cachePolicy=NSURLRequestReloadIgnoringCacheData;
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        succblock(responseObject);
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failblock(error,0);
    }];
}


//#pragma mark method ="multi post"
//
//
//+ (void)sendMultiPostRequestUrl:(NSString *)url parameters:(NSString *)parameters success:(successBlock)succblock failure:(failureBlock)failblock{
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
////    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    manager.requestSerializer.timeoutInterval = 60;
//    manager.requestSerializer.cachePolicy=NSURLRequestReloadIgnoringCacheData;
//
//    [manager POST:url parameters:@{@"RequestJson":parameters} constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        succblock(responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        failblock(error,0);
//    }];
//}
//
//
//
//
//
//#pragma mark method="post"
//
//
//+ (void)sendPostRequestUrl:(NSString *)url parameters:(NSString *)parameters success:(successBlock)succblock failure:(failureBlock)failblock statusBlock:(statusBlock) statusblock{
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    manager.requestSerializer.timeoutInterval = 60;
//    manager.requestSerializer.cachePolicy=NSURLRequestReloadIgnoringCacheData;
//
//    [manager POST:url parameters:@{@"RequestJson":parameters} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
//}
//
//
//
//
//
//
//#pragma mark addToken
//
//+ (NSMutableDictionary *) addToken:(NSMutableDictionary *) dic {
//
//    if (dic==nil) {
//        dic=[NSMutableDictionary dictionary];
//    }
//    
//    NSString * tokenStr= [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
//    
//    if (tokenStr) {
//        [dic setObject:tokenStr forKey:@"token"];
//    }else{
//        NSString *str = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//        NSString *send = @"";
//        send= [str stringByReplacingOccurrencesOfString:@"-" withString:@""];
//        [[NSUserDefaults standardUserDefaults] setObject:send forKey:@"token"];
//        [dic setObject:send forKey:@"token"];
//    }
//    return dic;
//}
//
@end

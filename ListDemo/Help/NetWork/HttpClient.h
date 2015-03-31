//
//  HttpClient.h
//  Demo1
//
//  Created by 李煜昌 on 14-5-27.
//  Copyright (c) 2014年 VACN. All rights reserved.
//

/**@file
 * @brief   网络请求封装类声明
 * @author  王平平
 * @date    2014-5-27
 * @version 1.0
 */

#import <Foundation/Foundation.h>
//#import "AFHTTPRequestOperationManager.h"

/** @brief 定义一个successBlock,请求成功后执行的代码块 */
typedef void (^successBlock)(id dic) ;

/** @brief 定义一个failureBlock,请求失败后执行的代码块 */
typedef void (^failureBlock)(id msg,int errCode);

/** @brief 定义一个statusBlock,请求后执行的状态代码块 */
typedef void (^statusBlock)(id dic);

@interface HttpClient : NSObject

/** @brief 发送Get请求 */
+ (void) sendGetRequestUrl:(NSString *)urlPath parameters:(NSString *) parameters success:(successBlock) succblock failure:(failureBlock) failblock;

/** @brief 发送Post请求 */
+ (void) sendPostRequestUrl:(NSString *)urlPath parameters:(NSDictionary *)dict success:(successBlock) succblock failure:(failureBlock) failblock;

/** @brief 发送MultiPost请求 */
+ (void) sendMultiPostRequestUrl:(NSString *)urlPath parameters:(NSDictionary *)dict success:(successBlock) succblock failure:(failureBlock) failblock;

/** @brief 发送Post请求 返回status code  */
+ (void) sendPostRequestUrl:(NSString *)urlPath parameters:(NSString *) parameters success:(successBlock) succblock failure:(failureBlock) failblock statusBlock:(statusBlock) statusblock;

/** @brief 请求参数中增加令牌 */
+ (NSMutableDictionary *) addToken:(NSMutableDictionary *) dic;

@end

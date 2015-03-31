//
//  NetAssistOper.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessBlock)(id body);
typedef void (^FaildBlock)(void);
@interface NetAssistOper : NSOperation<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)SuccessBlock sb;
@property (nonatomic,copy)FaildBlock fb;
@property (nonatomic,copy)NSDictionary *json;
@end

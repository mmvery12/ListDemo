//
//  NetAssist.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RequestObj;
typedef void (^SuccessBlock)(id body);
typedef void (^FaildBlock)(void);
@interface NetAssist : NSObject
+(void)NetAssistRequestr:(RequestObj *)req sb:(SuccessBlock)sb fb:(FaildBlock)fb;
@end

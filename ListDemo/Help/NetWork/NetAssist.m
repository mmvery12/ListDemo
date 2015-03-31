//
//  NetAssist.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "NetAssist.h"
#import "NetAssistQueue.h"
#import "NetAssistOper.h"
#import "RequestObj.h"
#import "ResponseAdapter.h"
#import "AFNetworking.h"
#import "HttpClient.h"
#import "JSONKit.h"
@implementation NetAssist
+(void)NetAssistRequestr:(RequestObj *)req sb:(SuccessBlock)sb fb:(FaildBlock)fb
{
#define S1
#ifdef S1
    [HttpClient sendPostRequestUrl:[req getAppendReuestUrlStr] parameters:[req reqObj] success:^(id dic) {
        sb([ResponseAdapter Adapter:dic]);
    } failure:^(id msg, int errCode) {
        fb();
    }];
#else
    NetAssistQueue *queue = [NetAssistQueue ShareNetAssistQueue];
    NetAssistOper *oper = [[NetAssistOper alloc] init];
    oper.url = [req getAppendReuestUrlStr];
    oper.json = [req reqObj];
    oper.sb = sb;
    oper.fb = fb;
    [queue addOperation:oper];
#endif
}
@end


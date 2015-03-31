//
//  ResponseAdapter.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "ResponseAdapter.h"
#import "ResponseObj.h"
#import "MTLJSONAdapter.h"
@implementation ResponseAdapter
+(NSDictionary *)Adapter:(id)body
{
    ResponseObj *resp = [ResponseObj Adaptor:ResponseObj.class Source:body];
    return resp.body;
}
@end

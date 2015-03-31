//
//  ResponseObj.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "ResponseObj.h"
#import <objc/runtime.h>

@implementation ResponseObj
+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"elapsedTime":@"elapsedTime",
             @"errorCode":@"errorCode",
             @"errorDesc":@"errorDesc",
             @"body":@"body"};
}

+(id)Adaptor:(Class)tclass Source:(id)source
{
    NSError *error = nil;
    id issue = [MTLJSONAdapter modelOfClass:tclass fromJSONDictionary:source error:&error];
    return issue;
}
@end

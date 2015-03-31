//
//  GetCityList.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "GetCityListReq.h"

@implementation GetCityListReq
-(NSString *)getAppendReuestUrlStr
{
    return URL_General(@"GetCityList");
}
-(id)getAppendRequestBody
{
    return @{@"versionNo":@"1",
             @"code":@"0",
             @"downLevel":[NSNumber numberWithInteger:3]};
}
@end

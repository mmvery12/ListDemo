//
//  CategoryReq.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "GetCategoryReq.h"

@implementation GetCategoryReq
-(NSString *)getAppendReuestUrlStr
{
    return URL_General(@"GetCategory");
}
-(id)getAppendRequestBody
{
    return @{@"versionNo":@"0",
             @"cityCode":_cityCode};
}
@end

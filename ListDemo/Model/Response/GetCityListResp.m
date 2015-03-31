//
//  GetCityListResp.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "GetCityListResp.h"

@implementation GetCityListResp
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"cityList": @"cityList",
             @"versionNo": @"versionNo"
             };
}
@end

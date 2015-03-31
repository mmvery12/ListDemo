//
//  GetCategoryResp.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/30.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "GetCategoryResp.h"

@implementation GetCategoryResp
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"iconUrlBase":@"iconUrlBase",
             @"versionNo": @"versionNo",
             @"CategoryTree": @"CategoryTree"
             };
}
@end

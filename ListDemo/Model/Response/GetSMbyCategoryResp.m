//
//  GetSMbyCategoryResp.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "GetSMbyCategoryResp.h"

@implementation GetSMbyCategoryResp
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"MerchandiseList":@"MerchandiseList",
             @"totalPageCount":@"totalPageCount",
             @"picUrlBase":@"picUrlBase",
             @"FilterTree":@"FilterTree"
             };
}
@end

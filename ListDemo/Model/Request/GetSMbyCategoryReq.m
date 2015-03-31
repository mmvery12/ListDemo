//
//  GetSMbyCategoryReq.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "GetSMbyCategoryReq.h"

@implementation SearchPrice
- (instancetype)init
{
    self = [super init];
    if (self) {
        _max = @"1000";
        _min = @"0";
    }
    return self;
}
-(id)getAppendRequestBody
{
    return @{@"max":_max,@"min":_min};
}

@end

@implementation GetSMbyCategoryReq
- (instancetype)init
{
    self = [super init];
    if (self) {
        _search_price = [[SearchPrice alloc] init];
        _filters = [NSMutableArray array];
        _sortOrder = 2;
        _onePageSize = 10;
        _pageIndex = 0;
        _is_attribute = 1;
    }
    return self;
}
-(id)getAppendRequestBody
{
    return @{@"cityCode":_cityCode,
             @"si_seq":_si_seq,
             @"filters":_filters,
             @"is_attribute":[NSNumber numberWithInteger:_is_attribute],
             @"sortType":[NSNumber numberWithInteger:_sortType],
             @"sortOrder":[NSNumber numberWithInteger:_sortOrder],
             @"search_price":[_search_price getAppendRequestBody],
             @"onePageSize":[NSNumber numberWithInteger:_onePageSize],
             @"pageIndex":[NSNumber numberWithInteger:_pageIndex]};
}
-(NSString *)getAppendReuestUrlStr
{
    return URL_Merchandise(@"GetSMbyCategory");
}
@end

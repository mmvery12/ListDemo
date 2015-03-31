//
//  GetTokenReq.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "GetTokenReq.h"

@interface GetTokenReq ()
{
    NSString *_deviceId;
    NSString *_deviceModel;
    NSNumber *_osType;
    NSString *_osVersionNo;
    NSString *_appVersionNo;
}
@end

@implementation GetTokenReq
-(NSString *)getAppendReuestUrlStr
{
    return URL_Misc(@"GetToken");
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        SystemShare *share = [SystemShare Share];
        _deviceId = @"e1eb28e39d6de3619f31c978d2f4814a";
        
//        share.uuid;
        _deviceModel = share.model;
        _osType = [NSNumber numberWithInteger:2];
        _osVersionNo = share.systemVers;
        _appVersionNo = share.appVers;
    }
    return self;
}
-(id)getAppendRequestBody
{
    return @{@"deviceId":_deviceId,
             @"deviceModel":_deviceModel,
             @"osType":_osType,
             @"osVersionNo":_osVersionNo,
             @"appVersionNo":_appVersionNo};
}
@end

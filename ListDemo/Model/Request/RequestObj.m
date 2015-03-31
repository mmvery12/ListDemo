//
//  RequestObj.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "RequestObj.h"
#import "JSONKit.h"
@interface RequestObj ()
{
    NSString *_apiVersion;
    NSString *_cityCode;
    NSString *_view_size;
    NSString *_token;
    NSString *_appVersion;
}
@end

@implementation RequestObj
-(instancetype)init
{
    if (self = [super init]) {
        _apiVersion = @"i4.3";
        _cityCode = @"1";
        _view_size = @"640x1136";
        _token = [SystemShare Share].token;
        _appVersion = [SystemShare Share].appVers;
    }
    return self;
}

-(id)reqObj
{
    NSError *er;
    return @{@"data":
                 [@{@"apiVersion":_apiVersion,
                   @"cityCode":_cityCode,
                   @"view_size":_view_size,
                   @"token":_token,
                   @"appVersion":_appVersion,
                   @"body":[self getAppendRequestBody]} JSONStringWithOptions:JKSerializeOptionValidFlags error:&er]
             };
}


-(NSString *)reqJSONStr
{
    @try {
        return [[self reqObj] JSONString];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    @finally {
        
    }
}

-(NSData *)reqJSONData
{
    @try {
        return [[self reqObj] JSONData];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    @finally {
        
    }
}
@end


@implementation RequestObj (Extern)

-(NSString *)getAppendReuestUrlStr
{
    return nil;
}
-(id)getAppendRequestBody
{
    return nil;
}

@end

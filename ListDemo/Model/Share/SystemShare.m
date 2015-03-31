//
//  SystemShare.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "SystemShare.h"

@implementation SystemShare
@synthesize uuid = _uuid;
@synthesize appVers = _appVers;
@synthesize model = _model;
@synthesize systemVers = _systemVers;
+(id)Share
{
    @synchronized(self)
    {
        static SystemShare *share;
        if (!share) {
            share = [[SystemShare alloc] init];
        }
        return share;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        _appVers = [self getAppVers];
        _model = [[UIDevice currentDevice] model];
        _systemVers = [[UIDevice currentDevice] systemVersion];
    }
    return self;
}

-(NSString *)getAppVers
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

-(void)setToken:(NSString *)token
{
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"KToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSString *)token
{
    NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"KToken"];
    return token==nil?@"":token;
}
@end

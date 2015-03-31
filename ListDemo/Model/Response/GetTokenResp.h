//
//  GetTokenResp.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "ResponseObj.h"

@interface GetTokenResp : ResponseObj
@property (nonatomic,readonly,strong) NSString *token;
@end

//
//  ResponseObj.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLJSONAdapter.h"
#import "MTLModel.h"
@interface ResponseObj : MTLModel<MTLJSONSerializing>
@property (nonatomic,readonly,strong) NSString *elapsedTime;
@property (nonatomic,readonly,strong) NSString *errorCode;
@property (nonatomic,readonly,strong) NSString *errorDesc;
@property (nonatomic,readonly,strong) NSDictionary *body;
+(id)Adaptor:(Class)tclass Source:(id)source;
@end

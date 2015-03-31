//
//  RequestObj.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SystemShare.h"
#import "SystemAssist.h"
#define URL_General(__str) [NSString stringWithFormat:@"%@/general/%@",gapp,__str]
#define URL_Merchandise(__str) [NSString stringWithFormat:@"%@/merchandise/%@",mapp,__str]
#define URL_Shopcart(__str) [NSString stringWithFormat:@"%@/shopcart/%@",sapp,__str]
#define URL_Order(__str) [NSString stringWithFormat:@"%@/order/%@",sapp,__str]
#define URL_Misc(__str) [NSString stringWithFormat:@"%@/misc/%@",sapp,__str]

@interface RequestObj : NSObject
-(NSData *)reqJSONData;
-(NSString *)reqJSONStr;
-(id)reqObj;
@end


@interface RequestObj (Extern)
-(NSString *)getAppendReuestUrlStr;
-(id)getAppendRequestBody;
@end

//
//  CategoryReq.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "RequestObj.h"
@interface GetCategoryReq : RequestObj
@property (nonatomic,strong) NSString *cityCode;
@end

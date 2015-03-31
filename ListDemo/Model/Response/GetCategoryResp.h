//
//  GetCategoryResp.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/30.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "ResponseObj.h"



@interface GetCategoryResp : ResponseObj
@property (nonatomic,readonly,strong) NSString * versionNo;
@property (nonatomic,readonly,strong) NSArray * CategoryTree;
@property (nonatomic,readonly,strong) NSString * iconUrlBase;
@end

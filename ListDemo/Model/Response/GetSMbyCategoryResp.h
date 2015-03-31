//
//  GetSMbyCategoryResp.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "ResponseObj.h"

@interface GetSMbyCategoryResp : ResponseObj
@property (nonatomic,readonly,strong) NSArray * MerchandiseList;
@property (nonatomic,readonly,strong) NSString * totalPageCount;
@property (nonatomic,readonly,strong) NSString * picUrlBase;
@property (nonatomic,readonly,strong) NSArray * FilterTree;
@end

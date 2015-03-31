//
//  GetSMbyCategoryReq.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "RequestObj.h"

@interface SearchPrice : RequestObj
@property (nonatomic,strong) NSString *max;
@property (nonatomic,strong) NSString *min;
@end

@interface GetSMbyCategoryReq : RequestObj
@property (nonatomic,copy) NSString * cityCode;
@property (nonatomic,copy) NSString * si_seq;
@property (nonatomic,copy) NSMutableArray * filters;
@property (nonatomic,assign) NSInteger is_attribute;
@property (nonatomic,assign) NSInteger sortType;
@property (nonatomic,assign)  NSInteger sortOrder;
@property (nonatomic,copy) SearchPrice * search_price;
@property (nonatomic,assign) NSInteger onePageSize;
@property (nonatomic,assign) NSInteger pageIndex;
@end

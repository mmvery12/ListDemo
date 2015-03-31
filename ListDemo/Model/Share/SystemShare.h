//
//  SystemShare.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SystemShare : NSObject
@property (nonatomic,readonly,strong) NSString *uuid;
@property (nonatomic,readonly,strong) NSString *appVers;
@property (nonatomic,readonly,strong) NSString *model;
@property (nonatomic,readonly,strong) NSString *systemVers;
@property (nonatomic,strong) NSString *token;
@property (nonatomic,strong) NSString *cityCode;
+(SystemShare *)Share;
@end

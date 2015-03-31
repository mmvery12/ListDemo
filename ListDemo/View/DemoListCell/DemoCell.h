//
//  DemoCell.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CellStyle)
{
    CellStyleRows = 1,
    CellStyleColumns = 1<<1
};

typedef NS_ENUM(NSInteger, BtnStatus)
{
    BtnStatus0 = 1,
    BtnStatus1 = 1<<1,
    BtnStatus2 = 1<<2,
    BtnStatus3 = 1<<3,
    BtnStatus4 = 1<<4
};

typedef void (^DiffStatusMethod) (NSIndexPath *indexPath);
@interface DemoCell : UICollectionViewCell
@property (nonatomic,weak) NSString *imageUrl;
@property (nonatomic,weak) NSString *title;
@property (nonatomic,weak) NSString *subTitle;
@property (nonatomic,weak) NSString *priceTitle;
@property (nonatomic,strong) NSIndexPath *indexPath;
-(void)currentShow:(BtnStatus)s :(CellStyle)style;
@property (nonatomic,copy) DiffStatusMethod diffMethod;
@end


//cell多状态重用机制，
//有限状态机制
//通过flag确定cell当前显示状态

//flag可直接赋值，或通过protrol获取
//cell不同显示状态下的不同触发可采取block或者protrol的方式
//




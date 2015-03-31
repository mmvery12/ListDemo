//
//  DemoListViewController.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface DemoListViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIActionSheetDelegate>
@property (nonatomic,strong) NSString *si_seq;
@end

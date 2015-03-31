//
//  BaseViewController.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstInitView];
    [self secondLoadTemp];
    [self thirdLoadNet];
}



-(void)firstInitView
{
    NSAssert(NO, @"[ERROR] SubObject must overwrite -(void)firstInitView");
}
-(void)secondLoadTemp
{
    NSAssert(NO, @"[ERROR] SubObject must overwrite -(void)secondLoadTemp");
}
-(void)thirdLoadNet
{
    NSAssert(NO, @"[ERROR] SubObject must overwrite -(void)thirdLoadNet");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

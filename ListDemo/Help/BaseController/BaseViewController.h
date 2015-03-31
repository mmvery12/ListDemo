//
//  BaseViewController.h
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
-(void)firstInitView;
-(void)secondLoadTemp;
-(void)thirdLoadNet;
@end

@interface BaseViewController (Waitting)
-(void)showWaitting;
-(void)dismissWatting;
@end

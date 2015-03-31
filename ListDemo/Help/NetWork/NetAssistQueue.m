//
//  NetAssistQueue.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "NetAssistQueue.h"
#import "NetAssistOper.h"
static NSInteger Max = 4;
@implementation NetAssistQueue

+(id)ShareNetAssistQueue
{
    static NetAssistQueue *share;
    @synchronized(self)
    {
        if (!share) {
            share = [[NetAssistQueue alloc] init];
        }
        return share;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.maxConcurrentOperationCount = Max;
    }
    return self;
}
@end

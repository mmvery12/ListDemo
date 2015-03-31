//
//  NetAssistOper.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "NetAssistOper.h"
#import "JSONKit.h"
@interface NetAssistOper ()
{
    NSURLConnection *_conn;
    NSMutableData *_revData;
}
@end

@implementation NetAssistOper
-(void)start
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[self.json JSONData]];
    _conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [_conn scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [_conn start];
    while (_conn) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}

-(BOOL)isExecuting
{
    return  _conn;
}

-(BOOL)isFinished
{
    return !_conn;
}

-(BOOL)isConcurrent
{
    return YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (!_revData){
        _revData = [NSMutableData data];
    }
    [_revData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _sb(_revData);
    _conn = nil;
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _fb();
    _conn = nil;
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        [[challenge sender]  useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        [[challenge sender]  continueWithoutCredentialForAuthenticationChallenge: challenge];
    }
}
@end

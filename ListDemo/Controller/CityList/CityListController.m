//
//  CityListController.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "CityListController.h"
#import "HttpClient.h"
#import "GetCityListReq.h"
#import "GetCityListResp.h"
#import "NetAssist.h"
#import "MTLJSONAdapter.h"
#import "JSONKit.h"
#import "CategoryListController.h"
#import "SystemShare.h"
#define CellHeight 70.
static  NSString *CellIdentifier = @"CellIdentifier";
@interface CityListController ()
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
@end

@implementation CityListController


-(void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)firstInitView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
-(void)secondLoadTemp
{
}
-(void)thirdLoadNet
{
    __weak CityListController *ctr = self;
    [NetAssist NetAssistRequestr:[[GetCityListReq alloc] init] sb:^(id body) {
        GetCityListResp *resp = [GetCityListResp Adaptor:GetCityListResp.class Source:body];
        [ctr arichData:resp];
    } fb:^{
        
    }];
}

-(void)arichData:(GetCityListResp *)resp
{
    _dataArray = (id)[[NSArray alloc] initWithArray:resp.cityList copyItems:YES];
    [_tableView reloadData];
}

#pragma mark -tabel data/delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [[_dataArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dataCount];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [SystemShare Share].cityCode = [[_dataArray objectAtIndex:indexPath.row] objectForKey:@"code"];
    [self.navigationController pushViewController:[[CategoryListController alloc] init] animated:YES];
}

-(NSInteger)dataCount
{
    if (_dataArray) {
        return _dataArray.count;
    }
    return 0;
}

@end

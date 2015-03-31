//
//  CategoryListController.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/27.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "CategoryListController.h"
#import "NetAssist.h"
#import "GetCategoryReq.h"
#import "GetCategoryResp.h"
#import "SystemShare.h"
#import "DemoListViewController.h"
#import "JSONKit.h"
#define CellHeight 70.
static  NSString *CellIdentifier = @"CellIdentifier";
static  NSString *CellIdentifier1 = @"CellIdentifier1";
static  NSString *CellIdentifier2 = @"CellIdentifier2";
@interface CategoryListController ()
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    UITableView *_tableViewCate1;
    UITableView *_tableViewCate2;
}
@end



@implementation CategoryListController
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
    
    _tableViewCate1 = [[UITableView alloc] initWithFrame:CGRectMake(44, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    _tableViewCate2 = [[UITableView alloc] initWithFrame:CGRectMake(88, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    
    [_tableViewCate1 registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier1];
    [_tableViewCate2 registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier2];
    
    _tableViewCate1.dataSource = _tableViewCate2.dataSource = self;
    _tableViewCate1.delegate = _tableViewCate2.delegate = self;
    [self.view addSubview:_tableViewCate1];
    [self.view addSubview:_tableViewCate2];
    [self cate1hidden:YES];
    [self cate2hidden:YES];
}

-(void)cate1hidden:(BOOL)hidden
{
    _tableViewCate1.hidden = hidden;
}

-(void)cate2hidden:(BOOL)hidden
{
    _tableViewCate2.hidden = hidden;
}

-(BOOL)isCate1hidden
{
    return _tableViewCate1.hidden;
}

-(BOOL)isCate2hidden
{
    return _tableViewCate2.hidden;
}

-(void)secondLoadTemp
{

}
-(void)thirdLoadNet
{
    
    __weak CategoryListController *ctr = self;
    GetCategoryReq *req = [[GetCategoryReq alloc] init];
    req.cityCode = [SystemShare Share].cityCode;
    [NetAssist NetAssistRequestr:req sb:^(id body) {
        GetCategoryResp *resp = [GetCategoryResp Adaptor:GetCategoryResp.class Source:body];
        [ctr loadtabel:resp.CategoryTree];
    } fb:^{
        
    }];
}

-(void)loadtabel:(NSArray *)data
{
    _dataArray = (id)[[NSArray alloc] initWithArray:data copyItems:YES];
    [_tableView reloadData];
}


#pragma mark -tabel data/delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_tableView]) {
        return [self tableCell1:tableView :indexPath];
    }
    
    if ([tableView isEqual:_tableViewCate1]) {
        return [self tableCell2:tableView :indexPath];
    }
    
    if ([tableView isEqual:_tableViewCate2]) {
        return [self tableCell3:tableView :indexPath];
    }
    return nil;
}

-(UITableViewCell *)tableCell1:(UITableView *)tableView :(NSIndexPath *)indexpath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexpath];
    cell.textLabel.text = [[_dataArray objectAtIndex:indexpath.row] objectForKey:@"si_name"];
    return cell;
}

-(UITableViewCell *)tableCell2:(UITableView *)tableView :(NSIndexPath *)indexpath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1 forIndexPath:indexpath];
    cell.textLabel.text = [[[[_dataArray objectAtIndex:[_tableView indexPathForSelectedRow].row] objectForKey:@"child"] objectAtIndex:indexpath.row] objectForKey:@"si_name"];
    return cell;
}

-(UITableViewCell *)tableCell3:(UITableView *)tableView :(NSIndexPath *)indexpath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2 forIndexPath:indexpath];
    cell.textLabel.text = [[[[[[_dataArray objectAtIndex:[_tableView indexPathForSelectedRow].row] objectForKey:@"child"] objectAtIndex:[_tableViewCate1 indexPathForSelectedRow].row] objectForKey:@"child"] objectAtIndex:indexpath.row] objectForKey:@"si_name"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_tableView]) {
        return [self dataCount];
    }
    
    if ([tableView isEqual:_tableViewCate1]) {
        return [self dataCount2];
    }
    
    if ([tableView isEqual:_tableViewCate2]) {
        return [self dataCount3];
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_tableView]) {
        [self cate1hidden:NO];
        [_tableViewCate1 reloadData];
        [self cate2hidden:YES];
    }
    
    if ([tableView isEqual:_tableViewCate1]) {
        [self cate2hidden:NO];
        [_tableViewCate2 reloadData];
    }
    if ([tableView isEqual:_tableViewCate2]) {
        DemoListViewController *demo = [[DemoListViewController alloc] init];
        demo.si_seq = [[[[[[_dataArray objectAtIndex:[_tableView indexPathForSelectedRow].row] objectForKey:@"child"] objectAtIndex:[_tableViewCate1 indexPathForSelectedRow].row] objectForKey:@"child"] objectAtIndex:indexPath.row] objectForKey:@"si_seq"];
        [self.navigationController pushViewController:demo animated:YES];
    }
}

-(NSInteger)dataCount
{
    if (_dataArray) {
        return _dataArray.count;
    }
    return 0;
}

-(NSInteger)dataCount2
{
    if (_dataArray) {
        return [[[_dataArray objectAtIndex:[_tableView indexPathForSelectedRow].row] objectForKey:@"child"] count];
    }
    return 0;
}

-(NSInteger)dataCount3
{
    if (_dataArray) {
        return [[[[[_dataArray objectAtIndex:[_tableView indexPathForSelectedRow].row] objectForKey:@"child"] objectAtIndex:[_tableViewCate1 indexPathForSelectedRow].row] objectForKey:@"child"] count];
    }
    return 0;
}

@end

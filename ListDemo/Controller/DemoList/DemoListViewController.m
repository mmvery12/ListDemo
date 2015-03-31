//
//  DemoListViewController.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "DemoListViewController.h"
#import "DemoCell.h"
#import "NetAssist.h"
#import "GetSMbyCategoryReq.h"
#import "GetSMbyCategoryResp.h"
#import <objc/runtime.h>
#import "JSONKit.h"
#import "CellLayout.h"
static NSString *CellIdentifier = @"CellIdentifier";
static NSString *CollectionIdentifier = @"CollectionIdentifier";
#define CellHeight 70.
@interface DemoListViewController ()
{
    NSMutableArray *_dataArray;
    NSMutableArray *_filterTree;
    CellStyle _style;
    UICollectionView *_collectionView;
    CellLayout *_layout;
}
@end

@implementation DemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -base work flow
-(void)firstInitView
{
    _layout = [[CellLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_layout];
    [_collectionView registerClass:[DemoCell class] forCellWithReuseIdentifier:CollectionIdentifier];
    [self.view addSubview:_collectionView];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    self.view.backgroundColor = [UIColor whiteColor];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self showModelWithStyle:1];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(showAc) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = bar;
}

-(void)showAc
{
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:@"1",@"2",@"3", nil];
    [action showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.cancelButtonIndex!=buttonIndex) {
        [self showModelWithStyle:[[actionSheet buttonTitleAtIndex:buttonIndex] integerValue]];
        [_collectionView reloadData];
    }
}

-(void)showModelWithStyle:(NSInteger)num
{
    switch (num) {
        case 1:
            _layout.cellHeight = 120;
            _style = CellStyleRows;
            break;
        case 2:
            _layout.cellHeight = 300;
            _style = CellStyleColumns;
            break;
        default:
            break;
    }
    _layout.numsOfCellsLine = num;
}

-(void)secondLoadTemp
{
    
}

-(void)thirdLoadNet
{return;
    __weak DemoListViewController *demo = self;
    GetSMbyCategoryReq *smb = [[GetSMbyCategoryReq alloc] init];
    smb.cityCode = [SystemShare Share].cityCode;
    smb.si_seq = self.si_seq;
    [NetAssist NetAssistRequestr:smb sb:^(id body) {
        GetSMbyCategoryResp *resp = [GetSMbyCategoryResp Adaptor:GetSMbyCategoryResp.class Source:body];
        [demo loadSMbyCategory:resp.MerchandiseList :resp.FilterTree];
    } fb:^{
        
    }];
}

-(void)loadSMbyCategory:(NSArray *)merchandiseList :(NSArray *)filterTree
{
    _dataArray = [(id)[NSArray alloc] initWithArray:merchandiseList copyItems:YES];
//    _filterTree = [(id)[NSArray alloc] initWithArray:filterTree copyItems:YES];
}

#pragma mark -memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)dealloc
{
}
#pragma mark -loaddata



#pragma mark -collcetion data/delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DemoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionIdentifier forIndexPath:indexPath];
    cell.contentView.layer.borderColor = indexPath.row%2==0? [UIColor blueColor].CGColor: [UIColor redColor].CGColor;
    cell.contentView.layer.borderWidth = 1.0f;
    cell.title = @"1231231231231312312313123123222312312312312312313123123123";
    cell.subTitle = @"sadasdadasdadasdasdsadasdasdasd";
    cell.priceTitle = @"¥:100.00";
    [cell currentShow:BtnStatus0 :_style];
    return cell;
}
@end

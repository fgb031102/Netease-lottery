//
//  skyBaseSetViewController.m
//  网易彩票
//
//  Created by sky on 14-5-19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyBaseSetViewController.h"
#import "skyArrowItem.h"
#import "skyGroupItem.h"
#import "skySwitchItem.h"
#import "skyCell.h"
#import "MBProgressHUD+MJ.h"
#import "skyCollectionViewController.h"
#import "skyViewController.h"

@interface skyBaseSetViewController ()

@end

@implementation skyBaseSetViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSMutableArray *)data
{
    if (_data == nil) {
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    skyGroupItem *group = self.data[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    skyCell *cell = [skyCell cellWithTableView:tableView];
    
    skyGroupItem *groupItem = self.data[indexPath.section];
    
    skySetCellItem *cellItem = groupItem.items[indexPath.row];
    
    cell.item = cellItem;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    skyGroupItem *group = self.data[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    skyGroupItem *group = self.data[section];
    return group.footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    skyGroupItem *group = self.data[indexPath.section];
    skySetCellItem *cellItem = group.items[indexPath.row];
    if (cellItem.operation) {
        cellItem.operation();
    }else if ([cellItem isKindOfClass:[skyArrowItem class]]) {
        skyArrowItem *arrowItem = (skyArrowItem *)cellItem;
        if (arrowItem.dest == nil) {
            return;
        }
        UIViewController *vc = [[arrowItem.dest alloc] init];//因为UICollectionView创建的时候需要传入样式布局，但是为了保证程序的扩展性我们不能使用带有布局参数的init方法，因此我们只能将UICollectionView的init方法进行重写。
        vc.title = arrowItem.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end

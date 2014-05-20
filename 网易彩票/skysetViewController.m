//
//  skysetViewController.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skysetViewController.h"
#import "skyArrowItem.h"
#import "skyGroupItem.h"
#import "skySwitchItem.h"
#import "skyCell.h"
#import "MBProgressHUD+MJ.h"
#import "skyCollectionViewController.h"
#import "skyViewController.h"
#import "skyPushViewController.h"
#import "skyAboutViewController.h"
#import "skyHelpViewController.h"


@interface skysetViewController ()

//@property (nonatomic,strong)NSMutableArray *data;

@end

@implementation skysetViewController

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
    
    skyGroupItem *group1 = [[skyGroupItem alloc] init];
    skySetCellItem *item1 = [skyArrowItem arrowCellWithTitle:@"信息推送" icon:@"MorePush" dest:[skyPushViewController class]];
    skySetCellItem *item2 = [skySwitchItem cellWithTitle:@"信息推送" icon:@"MorePush"];
    group1.header = @"头部1";
    group1.footer = @"尾部1";
    NSArray *items1 = @[item1,item2];
    group1.items = items1;
    
    
    skyGroupItem *group2 = [[skyGroupItem alloc] init];
    //用基类来创建一个cell对象，此时cell右边的数据将没有accessoryView的设置。
    skySetCellItem *item3 = [skySetCellItem cellWithTitle:@"检查新版本" icon:@"MorePush"];
    item3.operation = ^{
        [MBProgressHUD showMessage:@"正在加载..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"已经是最新版本"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        });
    };
    
    skySetCellItem *item4 = [skyArrowItem arrowCellWithTitle:@"产品推荐" icon:@"MorePush" dest:[skyCollectionViewController class]];
   
    skySetCellItem *item5 = [skyArrowItem arrowCellWithTitle:@"关于" icon:@"MorePush" dest:[skyAboutViewController class]];
    
    skySetCellItem *item6 = [skyArrowItem arrowCellWithTitle:@"帮助" icon:@"MorePush" dest:[skyHelpViewController class]];
    
    group2.header = @"头部2";
    group2.footer = @"尾部2";
    NSArray *items2 = @[item3,item4,item5,item6];
    group2.items = items2;
    
    [self.data addObject:group1];
    [self.data addObject:group2];
}

/*
- (NSMutableArray *)data
{
    if (_data == nil) {
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
*/
@end

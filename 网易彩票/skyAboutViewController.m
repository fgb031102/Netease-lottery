//
//  skyAboutViewController.m
//  网易彩票
//
//  Created by sky on 14-5-19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyAboutViewController.h"
#import "skyGroupItem.h"
#import "skyArrowItem.h"
#import "skySetCellItem.h"
#import "skyLabelCellItem.h"
#import "skyHeaderView.h"

@interface skyAboutViewController ()

@end

@implementation skyAboutViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setGroup];
    
    skyHeaderView *headerView = [[skyHeaderView alloc] init];
    NSLog(@"%@",headerView);
    self.tableView.tableHeaderView = headerView;
}

- (void)setGroup
{
    skyGroupItem *group1 = [[skyGroupItem alloc] init];
    skySetCellItem *item1 = [skyArrowItem arrowCellWithTitle:@"信息推送" icon:nil dest:nil];
    skySetCellItem *item2 = [skyArrowItem cellWithTitle:@"客服" icon:nil];
    item2.subTitles = @"123456789";
    group1.header = @"头部1";
    group1.footer = @"尾部1";
    NSArray *items1 = @[item1,item2];
    group1.items = items1;
    
    [self.data addObject:group1];
}

@end

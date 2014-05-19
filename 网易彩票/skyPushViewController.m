//
//  skyPushViewController.m
//  网易彩票
//
//  Created by sky on 14-5-19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyPushViewController.h"
#import "skyGroupItem.h"
#import "skySetCellItem.h"
#import "skyArrowItem.h"
#import "skySwitchItem.h"

@interface skyPushViewController ()

@end

@implementation skyPushViewController

- (void)setGroup
{
    skyGroupItem *group1 = [[skyGroupItem alloc] init];
    skySetCellItem *item1 = [skyArrowItem arrowCellWithTitle:@"信息推送" icon:@"MorePush" dest:nil];
    skySetCellItem *item2 = [skySwitchItem cellWithTitle:@"信息推送" icon:@"MorePush"];
    group1.header = @"头部1";
    group1.footer = @"尾部1";
    NSArray *items1 = @[item1,item2];
    group1.items = items1;
    
    [self.data addObject:group1];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setGroup];
}

@end

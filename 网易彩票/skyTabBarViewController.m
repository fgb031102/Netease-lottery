//
//  skyTabBarViewController.m
//  网易彩票
//
//  Created by sky on 14-5-16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyTabBarViewController.h"
#import "skyTabBar.h"
#import "skyTabBarItem.h"

@interface skyTabBarViewController () <skyTabBarDelegate>

@end

@implementation skyTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    skyTabBar *tabBar = [[skyTabBar alloc] init];
//    [tabBar setBackgroundColor:[UIColor orangeColor]];
    tabBar.frame = self.tabBar.bounds;
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
    
    [tabBar tabBarItemWithTitle:@"购买大厅" normalImage:@"TabBar1" heightImage:@"TabBar1Sel"];
    [tabBar tabBarItemWithTitle:@"合买跟单" normalImage:@"TabBar2" heightImage:@"TabBar2Sel"];
    [tabBar tabBarItemWithTitle:@"开奖信息" normalImage:@"TabBar3" heightImage:@"TabBar3Sel"];
    [tabBar tabBarItemWithTitle:@"幸运广场" normalImage:@"TabBar4" heightImage:@"TabBar4Sel"];
    [tabBar tabBarItemWithTitle:@"我的彩票" normalImage:@"TabBar5" heightImage:@"TabBar5Sel"];
}

- (void)skyTabBar:(skyTabBar *)tabBar didBtnItemClick:(skyTabBarItem *)clickItem
{
    self.selectedIndex = clickItem.tag;
}

@end

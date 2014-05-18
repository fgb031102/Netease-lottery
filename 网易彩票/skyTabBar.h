//
//  skyTabBar.h
//  网易彩票
//
//  Created by sky on 14-5-16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class skyTabBar;
@class skyTabBarItem;

@protocol skyTabBarDelegate <NSObject>

- (void)skyTabBar:(skyTabBar *)tabBar didBtnItemClick:(skyTabBarItem *)clickItem;

@end

@interface skyTabBar : UIView

@property (nonatomic,weak)id <skyTabBarDelegate> delegate;

- (void)tabBarItemWithTitle:(NSString *)title normalImage:(NSString *)normalImage heightImage:(NSString *)heightImage;

@end

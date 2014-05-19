//
//  skySetCellItem.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skySetCellItem.h"

@implementation skySetCellItem

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon
{
    skySetCellItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

@end

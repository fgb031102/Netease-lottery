//
//  skyArrowItem.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyArrowItem.h"

@implementation skyArrowItem

+ (instancetype)arrowCellWithTitle:(NSString *)title icon:(NSString *)icon dest:(Class)dest
{
    skyArrowItem *arrowItem = [self cellWithTitle:title icon:icon];
    arrowItem.dest = dest;
    return arrowItem;
}

@end

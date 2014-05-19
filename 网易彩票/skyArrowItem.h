//
//  skyArrowItem.h
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skySetCellItem.h"

@interface skyArrowItem : skySetCellItem

@property (nonatomic,strong)Class dest;

+ (instancetype)arrowCellWithTitle:(NSString *)title icon:(NSString *)icon dest:(Class)dest;

@end

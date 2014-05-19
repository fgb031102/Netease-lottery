//
//  skySetCellItem.h
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Operation)();

@interface skySetCellItem : NSObject

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *icon;

@property (nonatomic,copy)Operation operation;

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon;

@end

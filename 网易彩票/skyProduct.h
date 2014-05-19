//
//  skyProduct.h
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface skyProduct : NSObject

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *icon;

+ (instancetype)productWithDic:(NSDictionary *)dic;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

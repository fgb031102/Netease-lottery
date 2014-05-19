//
//  skyProduct.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyProduct.h"

@implementation skyProduct

+ (instancetype)productWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dic];
        self.title = dic[@"title"];
        self.icon = dic[@"icon"];
    }
    return self;
}

@end

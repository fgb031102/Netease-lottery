//
//  skyHtml.m
//  网易彩票
//
//  Created by sky on 14-5-20.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyHtml.h"

@implementation skyHtml

+ (instancetype)htmlWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dic];
        self.title = dic[@"title"];
        self.html = dic[@"html"];
        self.ID = dic[@"id"];
    }
    return self;
}

@end

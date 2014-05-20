//
//  skyHtml.h
//  网易彩票
//
//  Created by sky on 14-5-20.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface skyHtml : NSObject

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *html;

+ (instancetype)htmlWithDic:(NSDictionary *)dic;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

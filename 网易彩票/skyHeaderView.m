//
//  skyHeaderView.m
//  网易彩票
//
//  Created by sky on 14-5-19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyHeaderView.h"

@implementation skyHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"skyHeaderView" owner:nil options:nil]lastObject];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

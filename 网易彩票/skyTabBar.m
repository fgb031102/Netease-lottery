//
//  skyTabBar.m
//  网易彩票
//
//  Created by sky on 14-5-16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyTabBar.h"
#import "UIImage+sky.h"
#import "skyTabBarItem.h"

@interface skyTabBar ()

@property (nonatomic, strong)skyTabBarItem *selectedItem;

@end

@implementation skyTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)tabBarItemWithTitle:(NSString *)title normalImage:(NSString *)normalImage heightImage:(NSString *)heightImage
{
#warning 按钮对象进行自定义操作skyTabBarItem
    skyTabBarItem *item = [skyTabBarItem buttonWithType:UIButtonTypeCustom];
    [item setTitle:title forState:UIControlStateNormal];
    [item setImage:[UIImage imageWithName:normalImage] forState:UIControlStateNormal];
    [item setImage:[UIImage imageWithName:heightImage] forState:UIControlStateSelected];
    [self addSubview:item];
    [item addTarget:self action:@selector(btnClikc:) forControlEvents:UIControlEventTouchDown];
}

- (void)btnClikc:(skyTabBarItem *)btn
{
    if ([self.delegate respondsToSelector:@selector(skyTabBar:didBtnItemClick:)]) {
        [self.delegate skyTabBar:self didBtnItemClick:btn];
    }
    self.selectedItem.selected = NO;
    btn.selected = YES;
    self.selectedItem = btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (int i = 0; i < self.subviews.count; i++) {
        skyTabBarItem *btn = self.subviews[i];
        btn.tag = i;
        CGFloat yPoint = 0;
        CGFloat btnH = self.bounds.size.height;
        CGFloat btnW = self.bounds.size.width / self.subviews.count;
        CGFloat xPoint = i * btnW;
        btn.frame = CGRectMake(xPoint, yPoint, btnW, btnH);
        if (i == 0) {
//            btn.selected = YES;
//            self.selectedItem = btn;
            //当初始化的按钮为第一个时，默认调用点击方法进行点击。
            [self btnClikc:btn];
        }
    }
}

@end

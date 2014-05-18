//
//  skyTitleButton.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyTitleButton.h"

@interface skyTitleButton ()

@property (nonatomic,copy)NSString *title;
@property (nonatomic,strong)UIFont *titleFont;

@end

@implementation skyTitleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
//        self.titleFont = [UIFont systemFontOfSize:19];
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}


//利用currentTitle取得按钮当前的title
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
//    CGSize size = [self.currentTitle sizeWithFont:self.titleFont];
    CGSize size = [self.currentTitle sizeWithFont:[UIFont systemFontOfSize:19]];
    CGFloat titleW = size.width;
    CGFloat titleH = contentRect.size.height;
    CGFloat titleX = 0;
    CGFloat titleY = 0;

    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 32;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end

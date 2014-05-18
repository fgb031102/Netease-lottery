//
//  UIImage+sky.m
//  网易彩票
//
//  Created by sky on 14-5-17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "UIImage+sky.h"

@implementation UIImage (sky)

+ (UIImage *)imageWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5f topCapHeight:image.size.height * 0.5f];
    
    return image;
}
@end

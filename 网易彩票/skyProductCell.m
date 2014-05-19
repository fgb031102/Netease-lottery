//
//  skyProductCell.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyProductCell.h"
#import "skyProduct.h"

@interface skyProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation skyProductCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib //因为cell的item是用xib创建的，所在要在些方法中设置展示图片的imageView的圆角。
{
    self.iconImage.layer.cornerRadius = 10.0f;
    self.iconImage.clipsToBounds = YES;
}

- (void)setProduct:(skyProduct *)product
{
    _product = product;
    self.iconImage.image = [UIImage imageNamed:product.icon];
    self.nameLabel.text = product.title;
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

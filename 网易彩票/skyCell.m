//
//  skyCell.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyCell.h"
#import "skySetCellItem.h"
#import "skySwitchItem.h"
#import "skyArrowItem.h"
#import "UIImage+sky.h"

@interface skyCell ()

@property (nonatomic,strong) UIImageView *arrowView;

@property (nonatomic,strong) UISwitch *itemSwitch;

@end

@implementation skyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *indetifier = @"cell";
    skyCell *cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
    if (cell == nil) {
        cell = [[skyCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indetifier];
    }
    return cell;
}

- (void)setItem:(skySetCellItem *)item
{
    _item = item;
    [self setCellData];
    [self setAccessary];
}

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

- (UISwitch *)itemSwitch
{
    if (_itemSwitch == nil) {
        _itemSwitch = [[UISwitch alloc] init];
        [_itemSwitch addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _itemSwitch;
}

//对按钮的状态进行保存
- (void)valueChange:(UISwitch *)sender
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setBool:sender.isOn forKey:self.item.title];
    [user synchronize];
}

//在设置右边视图是对保存的数据进行保存
- (void)setAccessary
{
    if ([self.item isKindOfClass:[skyArrowItem class]]) {
        self.accessoryView = self.arrowView;
    }else if ([self.item isKindOfClass:[skySwitchItem class]]) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        self.itemSwitch.On = [user boolForKey:self.item.title];
        self.accessoryView = self.itemSwitch;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else {
        self.accessoryView = nil;
    }
}

- (void)setCellData
{
    self.textLabel.text = self.item.title;
    self.imageView.image = [UIImage imageWithName:self.item.icon];
    if (self.item.title) {
        self.detailTextLabel.text = self.item.subTitles;
    }
}

@end

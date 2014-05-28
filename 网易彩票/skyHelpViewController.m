//
//  skyHelpViewController.m
//  网易彩票
//
//  Created by sky on 14-5-19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyHelpViewController.h"
#import "skyGroupItem.h"
#import "skyArrowItem.h"
#import "skySwitchItem.h"
#import "skySetCellItem.h"
#import "skyNavigationViewController.h"
#import "skyHtmlViewController.h"
#import "skyHtml.h"

@interface skyHelpViewController ()

@property (nonatomic,strong)NSMutableArray *htmlArray;

@end

@implementation skyHelpViewController

- (void)setGroup
{
    skyGroupItem *group1 = [[skyGroupItem alloc] init];
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:self.htmlArray.count];
    for (skyHtml *html in self.htmlArray) {
        skySetCellItem *item = [skyArrowItem arrowCellWithTitle:html.title icon:nil dest:[skyHtmlViewController class]];
        [items addObject:item];
    }
    group1.items = items;
    
    [self.data addObject:group1];
}

- (NSMutableArray *)htmlArray
{
    if (_htmlArray == nil) {
        
        _htmlArray = [NSMutableArray array];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        NSArray *dicArray = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableLeaves error:nil];
        
       
        
        for (NSDictionary *dic in dicArray) {
            skyHtml *html = [skyHtml htmlWithDic:dic];
            [_htmlArray addObject:html];
        }
    }
    
    
    
    return _htmlArray;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setGroup];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    skyHtmlViewController *htmlVC = [[skyHtmlViewController alloc] init];
    
    htmlVC.html = self.htmlArray[indexPath.row];
    skyNavigationViewController *nav = [[skyNavigationViewController alloc] initWithRootViewController:htmlVC];
    [self presentViewController:nav animated:YES completion:nil];
}

@end

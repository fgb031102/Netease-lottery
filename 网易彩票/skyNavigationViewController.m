//
//  skyNavigationViewController.m
//  网易彩票
//
//  Created by sky on 14-5-16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyNavigationViewController.h"
#import "UIImage+sky.h"

@interface skyNavigationViewController ()

@end

@implementation skyNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBar];
    if (!iOS7) {
        [self setNavigationBarItem];
    }
}

- (void)setNavigationBar
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    NSString *imageName = @"NavBar64";
    if (!iOS7) {
        imageName = @"NavBar";
    }
    [navigationBar setBackgroundImage:[UIImage imageWithName:imageName] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[UITextAttributeFont] = [UIFont systemFontOfSize:19];
    dic[UITextAttributeTextColor] = [UIColor whiteColor];
    //        dic[UITextAttributeTextShadowOffset] = UIEdgeInsetsZero;
    navigationBar.titleTextAttributes = dic;
    navigationBar.tintColor = [UIColor whiteColor];//设置返回按钮的颜色
}

- (void)setNavigationBarItem
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    [item setBackgroundImage:[UIImage imageWithName:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imageWithName:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
//    item.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

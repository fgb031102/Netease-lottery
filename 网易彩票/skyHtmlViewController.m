//
//  skyHtmlViewController.m
//  网易彩票
//
//  Created by sky on 14-5-19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyHtmlViewController.h"
#import "skyHtml.h"

@interface skyHtmlViewController ()

@end

@implementation skyHtmlViewController

- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)setHtml:(skyHtml *)html
{
    _html = html;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setLeftBtn];
    
    UIWebView *webView = (UIWebView *)self.view;
    self.title = self.html.title;
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.html.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)setLeftBtn
{
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(diss:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)diss:(UIBarButtonItem *)barItem
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
